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
#use Data::Dumper::Concise;
use Data::Dumper::Perltidy;
$Data::Dumper::Perltidy::ARGV = "-l=300";
$Data::Dumper::Sortkeys = sub { [ Sort::Naturally::nsort keys %{$_[0]} ] };

my $startdir = Cwd::getcwd();


sub onezero (@) {  # make truthy / falsy explicit 1 / 0
    return map { $_ ? "1" : "0" } @_;
}

my %MANUAL;  # manual map UPPMAX-name => EasyBuild-name or undef if certain no EasyBuild name

my %UPPMAX;  # to be filled with UPPMAX-local modules and versions
my %EB;      # to be filled with EasyBuild modules and versions
my %EB_TC;   # to be filled with EasyBuild toolchains used

my $uppmax_header;
my $eb_header = join("\t", qw( base_dir moduleclass module version toolchain toolchainversion versionsuffix ebfile ));

my $opt_debug = 3;
my $opt_header = 1;
my @opt_uppmax = qw( tables/sw.libs.tsv );
my @opt_eb     = qw( tables/eb.math.tsv );

my @modules_skipped = qw( );

if ($opt_debug > 2) {
    say STDERR "Set values before GetOptions:";
    say STDERR "opt_debug = $opt_debug";
    say STDERR "opt_header = $opt_header";
    say STDERR "opt_uppmax = ( ".join(" ", @opt_uppmax)." )";
    say STDERR "opt_eb = ( ".join(" ", @opt_eb)." )";
    say STDERR "modules_skipped = ( ".join(" ", @modules_skipped)." )";
}

GetOptions(
    "debug=i" => \$opt_debug,
    "header!" => \$opt_header,
    "uppmax=s@" => \@opt_uppmax,
    "eb=s@" => \@opt_eb,
) or die "USAGE: $0 [ --uppmax FILE.tsv [ --uppmax FILE2.tsv ... ] default ( ".join(" ", @opt_uppmax)." ) ] [ --eb FILE.tsv [ --uppmax FILE2.tsv ... ] default ( ".join(" ", @opt_eb)." ) ] [ --debug level ] [ --header | --noheader ]";

if ($opt_debug > 2) {
    say STDERR "Set values after GetOptions:";
    say STDERR "opt_debug = $opt_debug";
    say STDERR "opt_header = $opt_header";
    say STDERR "opt_uppmax = ( ".join(" ", @opt_uppmax)." )";
    say STDERR "opt_eb = ( ".join(" ", @opt_eb)." )";
    say STDERR "ARGV = ".join(" ", @ARGV);
}

say STDERR "$0  starting directory  $startdir" if $opt_debug > 2;

######
######

sub fill_UPPMAX($UPPMAX, @table_files) {   # slurp up modules and versions from the UPPMAX sw.*.tsv tables
    # arg 1 is reference to hash to fill
    # arg 2+ are table files
    say STDERR "fill_UPPMAX() begin" if $opt_debug > 2;
    foreach my $file (@table_files) {

        open(my $table, "<$file") or Carp::croak "Could not open '$file': $!";
        say STDERR "fill_UPPMAX() opened table file '$file'" if $opt_debug > 1;

        while (my $line = <$table>) {
            chomp $line;
            my ($base_dir, $version_subdir, $module, $version, $remainder) = split /\t/, $line, 5;
            if ($base_dir eq "base_dir") {  # header
                say STDERR "file_UPPMAX() line $. is header, skipping '$line'" if $opt_debug > 2;
                next;
            }
            if (not exists $UPPMAX->{$module}) {
                say STDERR "$base_dir  $version_subdir" if $opt_debug > 2;
                $UPPMAX->{$module} = { base_dir => $base_dir , module => $module , versions => [ $version ] };
            } else {
                say STDERR "$base_dir  ".(" " x (length($module) + 1))."$version" if $opt_debug > 2;
                push @{$UPPMAX->{$module}->{versions}} , $version;
            }
        }

    }
}

######
######

######
######

# base_dir	moduleclass	module	version	toolchain	toolchainversion	versionsuffix	ebfile

sub fill_EB($EB, @table_files) {   # slurp up modules and versions from the EasyBuild eb.*.tsv tables
    # arg 1 is reference to hash to fill
    # arg 2+ are table files
    say STDERR "fill_EB() begin" if $opt_debug > 2;
    foreach my $file (@table_files) {

        open(my $table, "<$file") or Carp::croak "Could not open '$file': $!";
        say STDERR "fill_EB() opened table file '$file'" if $opt_debug > 1;

        while (my $line = <$table>) {
            chomp $line;
            my ($base_dir, $moduleclass, $module, $version, $toolchain, $toolchainversion, $versionsuffix, $ebfile) = split /\t/, $line, 8;
            my $fullversion = "$version-$toolchain-$toolchainversion$versionsuffix";
            my $eb_tc = "$toolchain-$toolchainversion";
            $EB_TC{$eb_tc}++;
            if ($base_dir eq "base_dir") {  # header
                say STDERR "file_EB() line $. is header, skipping '$line'" if $opt_debug > 2;
                next;
            }
            if (not exists $EB->{$module}) {
                say STDERR "$base_dir  $version_subdir" if $opt_debug > 2;
                $EB->{$module} = { base_dir => $base_dir , module => $module , versions => [ $version ] , fullversions => [ $fullversion ] };
            } else {
                say STDERR "$base_dir  ".(" " x (length($module) + 1))."$version    $fullversion"     if $opt_debug > 2;
                push @{$EB->{$module}->{versions}} , $version;
                push @{$EB->{$module}->{fullversions}} , $fullversion;
            }
        }

    }
}

######
######

fill_UPPMAX( \%UPPMAX, @opt_uppmax);
fill_EB( \%EB, @opt_eb);

say Dumper \%UPPMAX if $opt_debug > 2;
say Dumper \%EB     if $opt_debug > 2;
say Dumper \%EB_TC  if $opt_debug > 2;

exit if $opt_debug > 4;

