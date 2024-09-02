#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use feature 'signatures';
no warnings 'experimental::signatures';
use File::Temp ();
use Sort::Naturally ();
use Data::Dumper::Perltidy;
$Data::Dumper::Perltidy::ARGV = "-l=300";
$Data::Dumper::Sortkeys = sub { [ Sort::Naturally::nsort keys %{$_[0]} ] };



my $opt_debug = 3;

sub interp_equals_values($filename, @left) {  # this uses python to interpret the .eb file and give values for each of the things it finds there
    my %ans;
    my $file_wrap; # statements to wrap interpreting the filewith a try except
    # makes use of fuckit function decorator from https://github.com/ajalt/fuckitpy following advice from https://stackoverflow.com/questions/19522990/catch-exception-and-continue-try-block-in-python
    # create interp() function decorated with @fuckit read and print values from the .eb file
    my $indent = "    ";
    my $pre = "import fuckit\n\n\@fuckit\ndef interp():\n";
    my $eb_file = qx(cat "$filename" | sed '/^\\s*\$/d' | sed 's/^/$indent/');
    my $values_py; # the string printing @left values
    foreach (@left) {
        my $this;
        if ($_ eq "toolchain") {  # dictionary members
            $this = "print(\"toolchain_name = \" + str(toolchain['name']))\n".$indent."print(\"toolchain_version = \" + str(toolchain['version']))";
        } else {
            $this = "print(\"$_ = \" + str($_))";
        }
        $values_py .= $indent . $this . "\n";
    }
    my $cmd = "$pre$eb_file$values_py\n\ninterp()\n";
    say STDERR "interp_equals_values()  file = $filename"               if $opt_debug > 1;
    say STDERR "interp_equals_values()  eb_file = :::${eb_file}:::" if $opt_debug > 2;
    say STDERR "interp_equals_values()  values_py = :::${values_py}:::" if $opt_debug > 2;
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
    #carp_and_log "filegrep_equals_values():$filename: *** name $ans{toolchain_name} does not match known toolchains" if not List::Util::any { $ans{toolchain_name} eq $_ } @toolchain_name;
    return %ans;
}

my $file = 'b/binutils/binutils-2.25-GCC-4.9.2-binutils-2.25.eb';
my @ebfile_values = qw( name version versionsuffix toolchain description moduleclass moduletype );

my %hits = interp_equals_values($file, @ebfile_values);

say STDERR "filegrep_equals_values()  return value\n".Dumper \%hits  if $opt_debug > 2;

