#!/usr/bin/env perl

# this script maps UPPMAX module names to EasyBuild module names
#
# it searches one or more clones of git repositories containing easyconfigs to find candidates
#
# at first it will work on only module names
# then it will map versions
#
# at first it will use only EasyBuild's only list of easyconfig
#


use strict;
use warnings;
use feature 'say';

BEGIN { push @INC, sub { print STDERR "\n\nYou should do 'module load perl_modules/5.32.1'\n\n\n" } }

use Getopt::Long;
use Cwd             ();
use Carp            ();
use POSIX           ();
use Math::Round     ();
use List::Util      ();
use Sort::Naturally ();
#use Data::Dumper::Concise;
use Data::Dumper::Perltidy;
$Data::Dumper::Perltidy::ARGV = "-l=200";
$Data::Dumper::Sortkeys = sub { [ Sort::Naturally::nsort keys %{$_[0]} ] };

my %MANUAL;  # manual map UPPMAX-name => EasyBuild-name or undef if certain no EasyBuild name

my $opt_debug = 3;
my $opt_header = 1;
my $opt_uppmax = "tables/sw.libs.tsv";

my @modules_skipped = qw/ /;

if ($opt_debug > 2) {
    say STDERR "Set values at start:";
    say "opt_debug = $opt_debug";
    say "opt_header = $opt_header";
    say "opt_uppmax = $opt_uppmax";
    say "modules_skipped = ".join(" ", @modules_skipped);
}

GetOptions(
    "debug=i" => \$opt_debug,
    "header!" => \$opt_header,
    "uppmax=s" => \$opt_uppmax,
) or die "USAGE: $0 [ --uppmax FILE.tsv default '$opt_uppmax' ] [ --debug level ] [ --header | --noheader ] directory_1 [ directory_2 ... ]";

if ($opt_debug > 2) {
    say STDERR "Set values after GetOptions:";
    say "opt_debug = $opt_debug";
    say "opt_header = $opt_header";
    say "opt_uppmax = $opt_uppmax";
    say "ARGV = ".join(" ", @ARGV);
}

my $startdir = Cwd::getcwd();

say STDERR "$startdir starting directory" if $opt_debug > 2;

sub onezero (@) {  # make truthy / falsy explicit 1 / 0
    return map { $_ ? "1" : "0" } @_;
}

# slurp up modules and versions from --uppmax file

my %UPPMAX;

open(my $uppmax, "<$opt_uppmax") or Carp::croak "Could not open '$opt_uppmax': $!";

while (my $line = <$uppmax>) {
    chomp $line;
    my ($base_dir, $version_subdir, $module, $version, $remainder) = split /\t/, $line, 5;
    if ($base_dir eq "base_dir") {  # header
        say STDERR "line $. is header, skipping '$line'" if $opt_debug > 2;
        next;
    }
    if (not exists $UPPMAX{$module}) {
        say STDERR "$base_dir  $version_subdir" if $opt_debug > 2;
        $UPPMAX{$module} = { base_dir => $base_dir , module => $module , versions => [ $version ] };
    } else {
        say STDERR "$base_dir  ".(" " x (length($module) + 1))."$version" if $opt_debug > 2;
        push @{$UPPMAX{$module}->{versions}} , $version;
    }
}

say Dumper \%UPPMAX;

exit;


# the remainder of @ARGV contains EasyBuild easyconfig directories to search
foreach my $arg (@ARGV) {
    chdir($arg);
    say STDERR Cwd::getcwd() . " current directory" if $opt_debug > 2;
    my @glob = glob("*/*");
    my %module_repeat;  # don't keep repeating the same message
    my %dir_repeat;  # don't keep repeating the same message
    foreach my $glob_entry (@glob) {
        if (! (-d $glob_entry or -l $glob_entry)) {
            say STDERR "$ $glob_entry not a directory or symlink skipped" if $opt_debug > 1;
            next;
        }
        my ($module, $second) = split('/', $glob_entry, 2);
        if (-l $module) { 
            say STDERR "$module module name is a symlink so probably an alias skipped" if $opt_debug == 1 && ! $module_repeat{$module};
            ++$module_repeat{$module};
            next;
        } elsif (List::Util::any { $module eq $_ } @modules_skipped) { 
            say STDERR "$module top-level utility directory skipped" if $opt_debug > 1 && ! $dir_repeat{$module};
            ++$dir_repeat{$module};
            next;
        } elsif (List::Util::any { $second eq $_ } @modules_skipped) { 
            say STDERR "$second interior utility directory skipped" if $opt_debug > 1;
            next;
        } elsif ($second eq "mf") { # the module file directory
            say STDERR "$glob_entry directory skipped" if $opt_debug > 1;
            next;
        } elsif ($second eq "src") {  # source directory
            say STDERR "$glob_entry appears to be a source directory skipped" if $opt_debug == 1;
            next;
        } elsif ($second =~ /^(bin|lib|lib64|include|share|man)$/) {  # prefix component
            say STDERR "$glob_entry appears to be a prefix component skipped" if $opt_debug == 1;
            next;
        }

        # at this point, after these limited checks, the second component of the path may represent a version directory
        # gather additional attributes

    }
    chdir($startdir); # return to our original drectory for the next iter
}

