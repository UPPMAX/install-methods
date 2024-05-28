#!/usr/bin/env perl

# this script just scans provided subdirectories of the /sw tree (eg, /sw/libs and /sw/bioinfo) and produces a table of module names and versions and modification times for the version directories
#
# another script will do our modules -> EB module mapping
#
# dropped
#
# "exists_eb", "exists_eb_other", "eb_url"
#        # easybuild-related attributes, none exist at this point
#        my ($exists_eb, $exists_eb_other, $eb_url) = qw/ . . . /;


use strict;
use warnings;
use feature 'say';

use Getopt::Long;
use Cwd;
use POSIX ();
use Math::Round ();
use List::Util ();

my $opt_debug = 1;
my $opt_header = 1;
my @years = (3, 5, 10);

my @util_dirs_skipped = qw/ doug-dumping-ground slurm-drmaa.BACKUP /;

GetOptions(
    "debug=i" => \$opt_debug,
    "header!" => \$opt_header,
) or die "USAGE: $0 [ --debug level ] [ --header | --noheader ] directory_1 [ directory_2 ... ]";

my $startdir = getcwd();

say STDERR "$startdir starting directory" if $opt_debug > 2;

sub onezero (@) {  # make truthy / falsy explicit 1 / 0
    return map { $_ ? "1" : "0" } @_;
}

# header, only if something to look at
say join("\t", "base_dir", "version_subdir", "module", "version", "mod_time", "mod_days", map { "mod_${_}y" } @years) if scalar @ARGV;


foreach my $arg (@ARGV) {
    chdir($arg);
    say STDERR getcwd() . " current directory" if $opt_debug > 2;
    my @glob = glob("*/*");
    my %module_repeat;  # don't keep repeating the same message
    my %dir_repeat;  # don't keep repeating the same message
    foreach my $glob_entry (@glob) {
        if (! (-d $glob_entry or -l $glob_entry)) {
            say STDERR "$arg  $glob_entry not a directory or symlink" if $opt_debug > 1;
            next;
        }
        my ($module, $second) = split('/', $glob_entry, 2);
        if (-l $module) { 
            say STDERR "$arg  $module module name is a symlink so probably an alias skipped" if $opt_debug == 1 && ! $module_repeat{$module};
            ++$module_repeat{$module};
            next;
        } elsif (List::Util::any { $module eq $_ } @util_dirs_skipped) { 
            say STDERR "$arg  $module top-level utility directory skipped" if $opt_debug > 1 && ! $dir_repeat{$module};
            ++$dir_repeat{$module};
            next;
        } elsif (List::Util::any { $second eq $_ } @util_dirs_skipped) { 
            say STDERR "$arg  $second interior utility directory skipped" if $opt_debug > 1;
            next;
        } elsif ($second eq "mf") { # the module file directory
            say STDERR "$arg  $glob_entry directory skipped" if $opt_debug > 1;
            next;
        } elsif ($second eq "src") {  # source directory
            say STDERR "$arg  $glob_entry appears to be a source directory skipped" if $opt_debug == 1;
            next;
        } elsif ($second =~ /^(bin|lib|lib64|include|share|man)$/) {  # prefix component
            say STDERR "$arg  $glob_entry appears to be a prefix component skipped" if $opt_debug == 1;
            next;
        }

        # at this point, after these limited checks, the second component of the path may represent a version directory
        # gather additional attributes

        # subdirectory for this version; this might be wrong in reality (e.g., /sw/libs/cp2k-4.1-*)
        my $version_subdir = $glob_entry;

        # last modified time, use format to produce YYYY-MM-DD_HH:MM:SS
        #
        my ($modify_time, $modify_days, $modify_years, %modify_y);

        if (! defined((stat($glob_entry))[9])) {

            say STDERR "$arg  $glob_entry has ".'(stat($glob_entry))[9]'." undefined" if $opt_debug > 1;
            my $i_am = -l $glob_entry ? "L" : ".";
            ($modify_time, $modify_days, $modify_years, @modify_y{@years}) = ($i_am) x (3 + scalar @years);

        } else {

            $modify_time = POSIX::strftime('%Y-%m-%d_%H:%M:%S', localtime((stat($glob_entry))[9]));

            $modify_days = -M $glob_entry;
            $modify_years = $modify_days / 365.;
            @modify_y{@years} = map { onezero($modify_years < $_) } @years;
            $modify_days = Math::Round::round($modify_days);

        }

        say join("\t", $arg, $version_subdir, $module, $second, $modify_time, $modify_days, @modify_y{@years});
    }
    chdir($startdir); # return to our original drectory for the next iter
}

