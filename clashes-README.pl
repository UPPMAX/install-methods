#!/usr/bin/env perl

# Find clashes among the README files
#
# Load a perl_modules module, preferrably
#
# 1. looks for cases where the same module has a Module-Version-install-README.md and Module-Version_install-README.md (-install and _install)  We prefer the latter

use strict;
use warnings;
use feature 'say';

BEGIN { push @INC, sub { print STDERR "\n\nYou should do 'module load perl_modules/5.32.1'\n\n\n" } }

use Cwd              ();
use File::Find::Rule ();
use Sort::Naturally  ();
use File::Compare    ();

my $pwd = $ENV{PWD};
my $getcwd = Cwd::getcwd();

say STDERR "pwd     '$pwd'";
say STDERR "getcwd  '$getcwd'";

my %README = map { $_ => 1 } File::Find::Rule::find( file => , name => '*install-README.md' , in => $pwd);

my @RM;

foreach ( Sort::Naturally::nsort keys %README ) {
    if (/-install-README.md$/) {  # we have -install
        (my $underscore = $_) =~ s/-install-README.md$/_install-README.md/;
        if (exists $README{$underscore}) {
            say "\n\n\n\nCLASH   $_";
            say "        $underscore";
            say qx( echo );
            say qx( ls -l "$_" "$underscore" );
            say qx( echo );
            if (File::Compare::compare($_, $underscore) == 0) {

                say qx( echo "================ FILES ARE IDENTICAL" );

                push @RM, "rm -f '$_'    # FILES ARE IDENTICAL";

            } else {

                say qx( echo "**************** $_" );
                say qx( echo );
                say qx( cat "$_" );
                say qx( echo );
                say qx( echo );
                say qx( echo "**************** $underscore" );
                say qx( echo );
                say qx( cat "$underscore" );

            }
        }
    }
}

if (@RM) {
    say STDERR "\n#  What follows are 'rm -f' commands for each -install-README.md file that is identical to its corresponding _install-README.md\n";
    say STDERR $_ foreach @RM;
}
