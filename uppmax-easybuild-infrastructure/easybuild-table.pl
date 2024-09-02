#!/usr/bin/env perl

# this script creates tables from directories of EasyBuild .eb files
#
# it searches one or more clones of git repositories containing easyconfigs to find candidates
#

#sub greet_one($name = 'Bruce') {
#    say "Hello, $name!";
#}
#
#sub greet_all($leader, @everyone) {
#    say "Hello, $leader!";
#    say "Hi also, $_." for @everyone;
#}
#
#sub make_nested_hash($name, %pairs) {
#    return { $name => \%pairs };
#}
#Please, note that function signatures were introduced in Perl 5.20 and considered experimental until Perl 5.36. Therefore, if you use a Perl version in that range you may want to disable warnings for the "experimental::signatures" category:


use strict;
use warnings;
use feature 'say';
use feature 'signatures';
no warnings 'experimental::signatures';

BEGIN { $ENV{PERL5LIB} =~ /perl_modules\/5\.32\.1/ or { print "\n\nYou should do 'module load perl_modules/5.32.1'\n\n\n" and exit 1 } }

use Getopt::Long;
use Cwd             ();
use Carp            ();
use POSIX           ();
use Math::Round     ();
use List::Util      ();
use Sort::Naturally ();
use File::Grep      ();
use File::Temp      ();
#use Data::Dumper::Concise;
use Data::Dumper::Perltidy;
$Data::Dumper::Perltidy::ARGV = "-l=300";
$Data::Dumper::Sortkeys = sub { [ Sort::Naturally::nsort keys %{$_[0]} ] };

my $startdir = Cwd::getcwd();
my $opt_debug = 1;
my $opt_header = 1;

my @modules_skipped = qw( );

my @errorlog;
sub carp_and_log($err) {
    Carp::carp "$err";
    push @errorlog, $err;
}

sub onezero (@) {  # make truthy / falsy explicit 1 / 0
    return map { $_ ? "1" : "0" } @_;
}

# sort in descending order of length, and naturally within the same length
my @toolchain_name = sort { length($b) <=> length($a) || Sort::Naturally::ncmp($a, $b) } qw( gompic iimpic gmvapich2 Fujitsu nvompi gomkl GNU FCC iimkl iimpi gcccuda iccifort gfbf GCC GCCcore foss fosscuda gimkl intel intel-compilers intelcuda iomkl gompi CrayCCE CrayGNU CrayIntel NVHPC PGI ffmpi gimpi gimpic giolf giolfc gmpich gmpolf gmvolf gobff goblf golf iccifortcuda iibff iompi nvofbf pomkl pompi DUMMY SYSTEM );

say STDERR "recognized toolchains: ".join(" ", @toolchain_name) if $opt_debug >= 1;
my $DUMMY_toolchain = 0;  # whenever we've seen DUMMY or dummy used as a toolchain
my $SYSTEM_toolchain = 0;  # whenever we've seen SYSTEM or system used as a toolchain
my $missing_toolchain = 0;  # whenever there is no toolchain defined in the eb file

my %toolchain_versions;  # collects all the named toolchains
my %module_version_only; # if didn't recognize as matching the above filename format (it was missing the toolchain parts) then add it here

sub check_toolchain ($context, $name) {
    if (not List::Util::any { $name eq $_ } @toolchain_name) { # check against the list of known toolchain names
        carp_and_log "$context: *** name $name does not match known toolchains";
    }
}

my $eb_header = join("\t", qw( base_dir moduleclass module version toolchain toolchainversion versionsuffix ebfile ));
my %class_fd;  # hash to manage files for tables, one per moduleclass
sub class_fd($class, $directory = "tables") {
    if ($class eq '') {
        $class = 'NONE';
        say STDERR "class is empty, using name '$class'";
    }
    my $stub = "$directory/eb.$class";
    my ($table_file, $table_fd, $errors_file, $errors_fd);
    if (! defined $class_fd{$stub} ) {
        ($table_file, $errors_file) = ("$startdir/$stub.tsv", "$startdir/$stub.errors");
        if (-e $table_file) {
            say STDERR "$table_file exists";
            open $table_fd, ">>", $table_file or Carp::croak "could not append to class table_file '$table_file': $!";
        } else {
            say STDERR "$table_file will be created";
            open $table_fd, ">", $table_file or Carp::croak "could not create class table_file '$table_file': $!";
            say $table_fd $eb_header;
        }
        if (-e $errors_file) {
            open $errors_fd, ">>", $errors_file or Carp::croak "could not append to class errors_file '$errors_file': $!";
        } else {
            open $errors_fd, ">", $errors_file or Carp::croak "could not create class errors_file '$errors_file': $!";
        }
        $class_fd{$stub} = {
            table_file  => $table_file,
            table_fd    => $table_fd, 
            errors_file => $errors_file,
            errors_fd   => $errors_fd, 
        };
    }
    say STDERR Dumper \%class_fd if $opt_debug > 2;
    return ( $class_fd{$stub}->{table_fd}, $class_fd{$stub}->{errors_fd});
}
sub class_wrapup {
    say STDERR "Output by module class written to:";
    foreach (Sort::Naturally::nsort keys %class_fd) {
        say STDERR join("\t", $_, $class_fd{$_}->{table_file}, $class_fd{$_}->{errors_file});
        $class_fd{$_}->{table_fd}->close();
        $class_fd{$_}->{errors_fd}->close();
    }
}

if ($opt_debug > 2) {
    say STDERR "Set values before GetOptions:";
    say STDERR "opt_debug = $opt_debug";
    say STDERR "opt_header = $opt_header";
    say STDERR "modules_skipped = ( ".join(" ", @modules_skipped)." )";
}

GetOptions(
    "debug=i" => \$opt_debug,
    "header!" => \$opt_header,
) or die "USAGE: $0 [ --debug level ] [ --header | --noheader ] directory_1 [ directory_2 ... ]";

if ($opt_debug > 2) {
    say STDERR "Set values after GetOptions:";
    say STDERR "opt_debug = $opt_debug";
    say STDERR "opt_header = $opt_header";
    say STDERR "ARGV = ".join(" ", @ARGV);
}

say STDERR "$0  starting directory  $startdir" if $opt_debug > 2;

# EasyBuild eb files names 
#
# ./easybuild/easyconfigs/x/xtb/xtb-6.2.2-hotfix-intel-2017b-Python-3.6.3.eb
# ./easybuild/easyconfigs/x/xtb/xtb-6.2.3-foss-2019b.eb
# ./easybuild/easyconfigs/x/xtb/xtb-6.4.1-foss-2021b.eb
#
#    BASE/
#         easybuild/
#                   easyconfigs/
#                               ?/                      single-character lowercase binning prefix for .eb files
#                                 modulename/           module name, a prefix of the eb file name
#                                            file.eb    the full file name
#
# file.eb
#
#    modulename-version-toolchainprefix-toolchainversion-versionsuffix.eb
#    ^^^^^^^^^^                                             matches modulename/ parent directory
#                       ^^^^^^^^^^^^^^^                     matches one of the @toolchain_name
#               ^^^^^^^                                     everything betwen modulename- and -toolchainprefix
#                                       ^^^^^^^^^^^^^^^^    everything after toolchainprefix- and before optional version suffix or .eb
#                                                       ^^^^^^^^^^^^^^
#                                                           everything after toolchainversion and before .eb, includes leading '-'
#                                                           the only clue we have to this is the "versionsuffix = '...'" line from the .eb file itself
#                                                           it may include dictionary substitutions via %(...)s

# This uses python to interpret the .eb file and give values for each of the
# things it finds there it writes a temporary file containing the definition of
# the function interp() which wraps the contents of the .eb file and has
# python3 interpret it.  This function ends by printing the values that we want
# (listed in @left, with special handling for 'toolchain').  This python file
# is run using qx{} and its output captured and the values interpreted.
#
# The file imports the fuckit package to suppress errors,
# https://github.com/ajalt/fuckitpy, following advice from
# https://stackoverflow.com/questions/19522990/catch-exception-and-continue-try-block-in-python
# The interp() function is decorated with @fuckit which forces it to continue
# even though undef errors happen.  Wish there was another way to handle this.
#
# This won't work with the system python which is 3.6.8
#
# module load python/3.11.8
# module load git/2.44.0
# git clone --recursive https://github.com/ajalt/fuckitpy
# cd fuckitpy
# pip3 install --user .

sub interp_equals_values($filename, @left) {
    my %ans;
    my $indent = "    ";
    my $pre = "import fuckit\nimport re\n\n\@fuckit\ndef interp():\n";
    my $eb_file = qx(cat "$filename" | sed '/^\\s*\$/d' | sed 's/^/$indent/'); # removes all-blank lines and block-indents the contents
    if ($eb_file =~ /(toolchain\s*=\s*)(SYSTEM|system)/) { # tweak if toolchain = SYSTEM or system, modify to surround it by single quotes
        $eb_file =~ s/(toolchain\s*=\s*)(SYSTEM|system)/$1'$2'/;
    }
    my $values_py; # commands to print @left values, added to the end of interp()
    foreach (@left) {
        my $this;
        if ($_ eq "toolchain") {  # could either be toolchain alone ('SYSTEM' always?) or two dictionary members
            $this = "print(\"$_ = \" + str($_))\n".$indent."print(\"toolchain_name = \" + str(toolchain['name']))\n".$indent."print(\"toolchain_version = \" + str(toolchain['version']))";
        } elsif ($_ eq "description") {  # special multiline string handling
            $this = "$_ = re.sub(r'\\s+', ' ', \"\".join($_.splitlines()))\n".$indent."print(\"$_ = \" + str($_))";
        } else {
            $this = "print(\"$_ = \" + str($_))";
        }
        $values_py .= $indent . $this . "\n";
    }
    my $cmd = "$pre$eb_file$values_py\n\ninterp()\n";
    say STDERR "interp_equals_values()  file = $filename"               if $opt_debug > 1;
    say STDERR "interp_equals_values()  eb_file = :::${eb_file}:::" if $opt_debug > 2;
    say STDERR "interp_equals_values()  values_py = :::${values_py}:::" if $opt_debug > 3;
    say STDERR "interp_equals_values()  cmd = :::${cmd}:::" if $opt_debug > 2;

    my ($tempfh, $tempfilename) = File::Temp::tempfile();
    say $tempfh $cmd;
    $tempfh->close();
    my @ans = qx{python3 $tempfilename};
    foreach (@ans) {
        chomp;
        my @f = split / = /, $_, 2;
        $ans{$f[0]} = $f[1];
    }
    if (defined $ans{toolchain}) {
        # check for the two cases of specifying the SYSTEM toolchain
        if ($ans{toolchain} eq "SYSTEM" or $ans{toolchain} eq "system") {
            if (defined $ans{toolchain_name}) {  # meaning toolchain dictionary exists, so we don't understand something
                say STDERR "interp_equals_values():$filename: \%ans currently contains\n".Dumper \%ans;
                carp_and_log "interp_equals_values():$filename: 'toolchain' set to SYSTEM and a toolchain dictionary also found";
            }
            ++$SYSTEM_toolchain;
            $ans{toolchain_name} = "SYSTEM";
            $ans{toolchain_version} = "SYSTEM";
        } elsif ($ans{toolchain_name} =~ /^(SYSTEM|system)$/) {  # they used 'SYSTEM' or 'system' in a toolchain dictionary
            if ($ans{toolchain_version} !~ /^(SYSTEM|system)$/) {  # they did not use 'SYSTEM' or 'system' as the version
                say STDERR "interp_equals_values():$filename: \%ans currently contains\n".Dumper \%ans;
                carp_and_log "interp_equals_values():$filename: toolchain dictionary contains 'SYSTEM' name but not 'SYSTEM' version";
            }
            ++$SYSTEM_toolchain;
            $ans{toolchain_name} = "SYSTEM";
            $ans{toolchain_version} = "SYSTEM";
        } elsif ($ans{toolchain_name} =~ /^(DUMMY|dummy)$/) {  # they used 'DUMMY' or 'dummy' in a toolchain dictionary
            if ($ans{toolchain_version} !~ /^(DUMMY|dummy)$/) {  # they did not use 'DUMMY' or 'dummy' as the version
                say STDERR "interp_equals_values():$filename: \%ans currently contains\n".Dumper \%ans;
                carp_and_log "interp_equals_values():$filename: toolchain dictionary contains 'DUMMY' name but not 'DUMMY' version";
            }
            ++$DUMMY_toolchain;
            $ans{toolchain_name} = "DUMMY";
            $ans{toolchain_version} = "DUMMY";
        }
        delete $ans{toolchain};
    } else {
        # no toolchain defined, this is a problem, assume SYSTEM
        ++$missing_toolchain;
        ++$SYSTEM_toolchain;
        $ans{toolchain_name} = "SYSTEM";
        $ans{toolchain_version} = "SYSTEM";
    }
    check_toolchain("interp_equals_values():$filename", $ans{toolchain_name});
    say STDERR "interp_equals_values()  return value\n".Dumper \%ans if $opt_debug > 3;
    unlink $tempfilename;
    return %ans;
}



sub chunk_easyconfig_filename($filename, $parentdir) {
    my $orig_filename = $filename;
    Carp::croak "$filename does not end with '.eb'" if $filename !~ /\.eb$/;
    $filename =~ s/\.eb$//; # now strip it off
    Carp::croak "$filename does not include '$parentdir-'  as a prefix" if $filename !~ /^\Q$parentdir\E-/;
    $filename =~ s/^(\Q$parentdir\E)-//;  # now remove it
    my $modulename = $1;
    # now search for entries from toolchain_name as substrings
    # if none are found, there may be no toolchain prefix
    # or we may need to add it to @toolchain_name
    my ($version, $toolchain_name, $toolchain_version, $versionsuffix, $description, $moduleclass) = (undef, undef, undef, undef, "", "");
    # pull a few values out of .eb file
    my @ebfile_values = qw( name version versionsuffix toolchain description moduleclass moduletype );
    ##my %hits = filegrep_equals_values($orig_filename, @ebfile_values);
    my %hits = interp_equals_values($orig_filename, @ebfile_values);
    if ($hits{toolchain_name} eq "SYSTEM") {
        # quick sanity check for SYSTEM since I don't get what's going on in all cases
        # We expect that SYSTEM toolchain means no toolchain name or version appears in the filename.
        # We must ensure this is true here.  Add further checks as we understand more.
        if ($filename =~ /SYSTEM/) {
            Carp::croak "chunk_easyconfig_filename():$orig_filename: uses SYSTEM toolchain and SYSTEM appears in the filename";
        }
    } elsif ($hits{toolchain_name} eq "DUMMY") {
        # quick sanity check for DUMMY, see above
        if ($filename =~ /DUMMY/) {
            Carp::croak "chunk_easyconfig_filename():$orig_filename: uses DUMMY toolchain and DUMMY appears in the filename";
        }
    }
    if (defined $hits{versionsuffix}) {
        say STDERR "found substitution in versionsuffix: '$hits{versionsuffix}'" if $hits{versionsuffix} =~ /%/ && $opt_debug >= 2;
        # strip off version-toolchain_name-toolchain_version leaving only (substituted) versionsuffix
        if ($hits{toolchain_name} eq "SYSTEM") {
            ($versionsuffix = $filename) =~ s/^([^-]+)-/-/;
            ($version, $toolchain_name, $toolchain_version) = ($1, $hits{toolchain_name}, $hits{toolchain_version});
        } else {
            ($versionsuffix = $filename) =~ s/^(.+)-(\Q$hits{toolchain_name}\E)-(\Q$hits{toolchain_version}\E)//;
            ($version, $toolchain_name, $toolchain_version) = ($1, $2, $3);
        }
    } elsif ($filename =~ /^(.+)-(\Q$hits{toolchain_name}\E)-(\Q$hits{toolchain_version}\E)$/) {  # does not include versionsuffix
        ($version, $toolchain_name, $toolchain_version, $versionsuffix) = ($1, $2, $3, "");
    } elsif ($filename =~ /^(.+)$/) {
        # we assume that the one thing left here ($1) is the version of the module
        say STDERR "chunk_easyconfig_filename(): stub version '$filename' vs .eb file version '$hits{version}'" if $opt_debug >= 3;
        if ($filename ne $hits{version}) {
            carp_and_log "chunk_easyconfig_filename():$orig_filename: where only version in filename, the stub '$filename' does not match the .eb file version '$hits{$version}'";
        }
        $version = $1;
        $toolchain_name = defined $hits{toolchain_name} ? $hits{toolchain_name} : "";
        $toolchain_version = defined $hits{toolchain_version} ? $hits{toolchain_version} : "";
        $versionsuffix = "";
        ++$module_version_only{"$modulename/$version"};
    } else {
        Carp::croak "chunk_easyconfig_filename():$orig_filename: you should never reach here";
    }
    ++$toolchain_versions{$toolchain_name}->{$toolchain_version}->{count};
    ++$toolchain_versions{$toolchain_name}->{$toolchain_version}->{$versionsuffix}->{count} if $versionsuffix;
    Carp::croak "problem matching version toolchain_{name,version} and/or versionsuffix" if List::Util::any { ! defined $_ } ($version, $toolchain_name, $toolchain_version, $versionsuffix);
    $description = $hits{description} if defined $hits{description};
    if (defined $hits{moduleclass} xor defined $hits{moduletype}) {  # only one defined
        $moduleclass = defined $hits{moduleclass} ? $hits{moduleclass} : $hits{moduletype};
    } elsif (defined $hits{moduleclass}) { # both defined
        if ($hits{moduleclass} ne $hits{moduletype}) {
            carp_and_log "chunk_easyconfig_filename():$orig_filename: .eb file has conflicting moduleclass ($hits{moduleclass}) and moduletype ($hits{moduletype})";
        }
        $moduleclass = $hits{moduleclass};
    } else { # none defined
        carp_and_log "chunk_easyconfig_filename():$orig_filename: .eb file with neither moduleclass nor moduletype";
    }
    say STDERR "chunk_easyconfig_filename()  $orig_filename  ( ".join(" ", $moduleclass, $modulename, $version, $versionsuffix, $toolchain_name, $toolchain_version, $moduleclass)." )" if $opt_debug > 3;
    return ( 
        modulename => $modulename,
        version => $version,
        versionsuffix => $versionsuffix,
        toolchain_name => $toolchain_name, 
        toolchain_version => $toolchain_version,
        moduleclass => $moduleclass,
        description => $description,
    );
}

# The remainder of @ARGV contains EasyBuild easyconfig directories to search.
# I will generalise this to allow searching an entire tree for *.eb files, but
# not just yet.
#
# Each of these are the single-character binning directories that contain the
# named directories for the tool within which its easyconfigs are found. For
# example, the base easybuild-easyconfigs repository contains these at
#
#     easybuild-easyconfigs/easybuild/easyconfigs/?
#
# with the archival easyconfigs found at
#
#     easybuild-easyconfigs/easybuild/easyconfigs/__archive__/?
#
# The Fred Hutch directories are at
#
#    easybuild-life-sciences/fh_easyconfigs/? 

# reminder, the header is 
# my $eb_header = join("\t", qw( base_dir moduleclass module version toolchain toolchainversion versionsuffix ebfile ));

foreach my $arg (@ARGV) {
    chdir($arg);
    say STDERR "$0: current directory " . Cwd::getcwd() if $opt_debug >= 1;
    my @glob = glob("*");
    # module names are in @glob
    foreach my $tool_directory (@glob) {
        my $tool_parent = Cwd::getcwd();
        if (! (-d $tool_directory or -l $tool_directory)) {
            say STDERR "$tool_directory not a directory or symlink  skipped" if $opt_debug > 1;
            next;
        }
        chdir($tool_directory);
        say STDERR Cwd::getcwd() . " current directory" if $opt_debug > 2;
        my @eb_files = glob("*.eb");
        foreach my $eb_file (@eb_files) {
            say STDERR "eb_file: $eb_file" if $opt_debug > 1;
            my %chunked = chunk_easyconfig_filename($eb_file, $tool_directory);
            say STDERR Dumper \%chunked if $opt_debug > 1;
            my ($t, $e) = class_fd($chunked{moduleclass});
            foreach (qw( moduleclass modulename version toolchain_name toolchain_version versionsuffix )) {
                Carp::croak "main_loop:$eb_file: \$chunked{$_} is undefined here" if not defined $chunked{$_};
            }
            say $t join("\t", $arg, @chunked{qw( moduleclass modulename version toolchain_name toolchain_version versionsuffix )}, "$arg/$tool_directory/$eb_file"); 
            say $e $_ foreach @errorlog;
            @errorlog = ();
        }
        chdir($tool_parent);  # back to our single-character bin directory
    }
    chdir($startdir); # return to our original drectory for the next iter
}

class_wrapup();

#say STDERR "\n\n%toolchain_versions:\n";
#say STDERR Dumper \%toolchain_versions;
open (my $tv, ">tables/ebinfo.toolchainversions.tsv") or Carp::croak "could not create ebinfo.toolchainversions.tsv: $!";
say $tv join("\t", qw(toolchain toolchainversion moduleversionsuffix count));
foreach my $x0 (Sort::Naturally::nsort keys %toolchain_versions) {
    foreach my $x1 (Sort::Naturally::nsort keys %{$toolchain_versions{$x0}}) {
        my $x2 = '';
        say $tv join("\t", $x0, $x1, $x2, $toolchain_versions{$x0}->{$x1}->{count});
        foreach $x2 (Sort::Naturally::nsort keys %{$toolchain_versions{$x0}->{$x1}}) {
            next if $x2 eq "count";
            say $tv join("\t", $x0, $x1, $x2, $toolchain_versions{$x0}->{$x1}->{$x2}->{count});
        }
    }
}
$tv->close();
#say STDERR "\n\n%module_version_only -- module/version for modules whose files contain only the module name and version\n";
#say STDERR Dumper \%module_version_only;
open my $mvo, ">tables/ebinfo.moduleversionsonly.tsv" or Carp::croak "could not create ebinfo.moduleversiononly.tsv: $!";
say $mvo $_ foreach Sort::Naturally::nsort keys %module_version_only;
$mvo->close();
say STDERR "\n\n";
say STDERR "SYSTEM|system toolchain specified: $SYSTEM_toolchain";
say STDERR "DUMMY|dummy toolchain specified: $DUMMY_toolchain";
say STDERR "missing toolchain specifications $missing_toolchain";

__END__

./easybuild/easyconfigs/__archive__/z/zlibbioc/zlibbioc-1.16.0-intel-2015b-R-3.2.1.eb
./easybuild/easyconfigs/__archive__/z/zsh/zsh-5.0.2-goolf-1.4.10.eb
./easybuild/easyconfigs/__archive__/z/zsh/zsh-5.0.2-ictce-5.3.0.eb
./easybuild/easyconfigs/__archive__/z/zsync/zsync-0.6.2-goolf-1.4.10.eb
./easybuild/easyconfigs/__archive__/z/zsync/zsync-0.6.2-ictce-5.3.0.eb
./easybuild/easyconfigs/a/ABAQUS/ABAQUS-2017-hotfix-1721.eb
./easybuild/easyconfigs/a/ABAQUS/ABAQUS-2018-hotfix-1806.eb
./easybuild/easyconfigs/a/ABAQUS/ABAQUS-2020.eb
./easybuild/easyconfigs/a/ABAQUS/ABAQUS-2021-hotfix-2132.eb
./easybuild/easyconfigs/a/ABAQUS/ABAQUS-2022-hotfix-2214.eb
./easybuild/easyconfigs/a/ABAQUS/ABAQUS-2022-hotfix-2223.eb
./easybuild/easyconfigs/a/ABAQUS/ABAQUS-2022.eb
./easybuild/easyconfigs/a/ABAQUS/ABAQUS-6.12.1-linux-x86_64.eb
./easybuild/easyconfigs/a/ABAQUS/ABAQUS-6.13.5-linux-x86_64.eb
./easybuild/easyconfigs/a/ABAQUS/ABAQUS-6.14.1-linux-x86_64.eb
./easybuild/easyconfigs/a/ABINIT/ABINIT-7.0.3-x86_64_linux_gnu4.5.eb
./easybuild/easyconfigs/a/ABINIT/ABINIT-7.0.5-x86_64_linux_gnu4.5.eb
./easybuild/easyconfigs/a/ABINIT/ABINIT-7.10.5-intel-2016.02-GCC-4.9-libxc.eb
./easybuild/easyconfigs/a/ABINIT/ABINIT-7.10.5-intel-2016.02-GCC-4.9.eb
./easybuild/easyconfigs/a/ABINIT/ABINIT-7.2.1-x86_64_linux_gnu4.5.eb

# code we no longer need
#
#
#
# my hack to basically grep for values which is not as good as just asking
# python3 to resolve what it can for us, performed by interp_equals_values()
sub filegrep_equals_values($filename, @left) {
    my %ans;
    my $pattern = join("|", @left);
    $pattern = '('.$pattern.')' if @left;
    $pattern = '^'.$pattern;
    $pattern = $pattern.'\s*=\s*';
    say STDERR "filegrep_equals_values()  file = $filename  pattern = $pattern" if $opt_debug > 2;
    my @hits = File::Grep::fgrep { /$pattern/ } $filename;  # one hash of hits per file

    #say STDERR Dumper \@hits if $opt_debug > 2;

    foreach my $hit (values %{$hits[0]->{matches}}) {
        chomp $hit;
        $hit =~ /^(.+) = (.+)$/;
        my ($name, $value) = ($1, $2);
        if ($name eq "versionsuffix") {
            # that we have a versionsuffix is news enough, retain it for tracing but parent determines it by subtraction
            $ans{versionsuffix} = $value;
        } elsif ($value =~ /^'([^']*)'$/ || $value =~ /^'([^']*)'\s*#.*$/ || $value =~ /^"([^"]*)"$/ || $value =~ /^"([^"]*)"\s*#.*$/) {
            # single- or double-quoted value with no interior single quotes, optionally followed by a comment
            $value = $1;
            $ans{$name} = $value;
        } elsif ($name eq "toolchain" and $value =~ /^\{(.*)\}$/) {  # { } dictionary
            # toolchain is special in that it generates values for both toolchain_name and toolchain_version
            foreach my $entry (split /,\s*/, $1) {
                my @entry = split /:\s*/, $entry;
                s/^['"](.+)['"]$/$1/ for @entry;
                $ans{"toolchain_$entry[0]"} = $entry[1];
            }
        } elsif ($name eq "toolchain" and $value eq 'SYSTEM') {  # the SYSTEM toolchain
            $ans{toolchain_name} = "SYSTEM";
            $ans{toolchain_version} = "SYSTEM";
        } elsif ($name eq "description") {  # potential (or always?) multiline string?
            my $description = "";
            open(my $wholefile, "<$filename") or Carp::croak("could not open $filename to swallow description: $!");
            $wholefile = join('', <$wholefile>);
            if ($wholefile =~ /description\s*=\s*"""(.*)"""/s) {  # multiline match
                ($description = $1) =~ s/\n//g;
            }
            $ans{description} = $description;
            say STDERR "\$ans{description} = $ans{description}" if $opt_debug > 2;
        } elsif ($value =~ / [%+] /) {  # python expression containing a substitution or concatenation **surrounded by spaces**, hopefully this is version 
            if ($name eq "version") {
                $ans{version} = $value;
            } else {
                Carp::croak "filegrep_equals_values():$filename: substitution observed for name = '$name'  value = '$value'";
            }
        } else {  # unknown state
            Carp::croak "filegrep_equals_values()  was not expecting to get here for '$filename' ( ".join(" ", @left)." ) :: line hit = '$hit'";
        }
    }
    say STDERR "filegrep_equals_values()  return value\n".Dumper \%ans if $opt_debug > 3;
    check_toolchain("filegrep_equals_values():$filename", $ans{toolchain_name});
    return %ans;
}

#say STDERR filegrep_equals_values('test.eb', qw( name version versionsuffix toolchain ));
#exit;
