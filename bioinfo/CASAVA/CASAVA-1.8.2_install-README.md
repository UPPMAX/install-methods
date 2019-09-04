CASAVA/1.8.2
============

Don't have installation details, but worth noting that a fix of a depracated feature was required in `/sw/bioinfo/CASAVA/1.8.2/rackham/lib/CASAVA-1.8.2/perl/Casava/Alignment/Config.pm`.

A user was running `configureBclToFastq.ph -h` after loading thos module and turning up a series of cascading syntax errors in the above `Config.pm` file.  Asking for more info with

    perl -Mdiagnostics $(which configureBclToFastq.pl) -h

was not helpful.  A `perl_modules` module is required to run this, because `XML::Simple` is required, but they all report a syntax error starting around these lines:

```perl
sub _validateEland
{
    my $self = shift;
    my ($project, $sample, $lane, $barcode, $reference) = @_;
    for my $variable (qw(ELAND_FASTQ_FILES_PER_PROCESS))
    {
        $self->_validateExistence($variable, $project, $sample, $lane, $barcode, $reference);
    }
    for my $directory (qw(ELAND_GENOME))
    {
        $self->_validateDirectory($directory, $project, $sample, $lane, $barcode, $reference);
    }
}
```

When running a small example, I was finally able to identify the problem:

```perl
#!/usr/bin/env perl

#use strict;
#use warnings;

for my $v qw(a b c d)
{
    print "$v -\n";
}
```

With the current system perl on rackham (5.16.3) we get

    Use of qw(...) as parentheses is deprecated at t.pl line 6.

The `for` lines were using `qw()` without surrounding parentheses.  With any of the module perls, this was just a syntax error.  With 5.26.2, we see

    syntax error at t.pl line 6, near "$v qw(a b c d)"

This was not helpful, but some google on the 'deprecated' message turned up the problem.  Seems like `-Mdiagnostics` should have been more helpful.

