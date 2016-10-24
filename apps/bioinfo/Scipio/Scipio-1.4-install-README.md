Scipio 1.4
==========

<http://www.webscipio.org/>

LOG
---

    cd /sw/apps/bioinfo/
    mkdir Scipio
    cd Scipio/
    mkdir 1.4
    mkdir mf
    cd 1.4
    mkdir milou
    mkdir src_milou
    cd src_milou/

Download to own computer and rsync over

    unzip scipio-1.4.zip 
    cd scipio-1.4/
    chmod -x documentation.1.4.pdf 
    head -n 1 *.pl

Requires BioPerl and YAML and blat.  YAML is not available for system perl, so
must use `perl/5.18.4`.  Must change to `#!/usr/bin/env perl`.

    vi *.pl

    module load bioinfo-tools
    module load BioPerl/1.6.924_Perl5.18.4
    module list

Loads perl and perl_modules along with BioPerl.

    perl -c scipio.1.4.1.pl 
    perl -c yaml2gff.1.4.pl 
    perl -c yaml2log.1.4.pl 

    cp -av * ../../milou/
    cd ../../milou/
    ln -s scipio.1.4.1.pl scipio.pl 
    ln -s yaml2gff.1.4.pl yaml2gff.pl 
    ln -s yaml2log.1.4.pl yaml2log.pl 
    cd ../../mf/

Start with Roary mf file.

    cp /sw/mf/common/bioinfo-tools/misc/Roary/3.6.2 1.4

Only load BioPerl, and since it's an older tool, the older `blat/34`.

