LINKS/1.8.7
========================

<https://github.com/bcgsc/links>

Used under license:
GPL v3

Structure creating script (makeroom_LINKS_1.8.7.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/LINKS/makeroom_1.8.7.sh

makeroom.sh invoked with:
/home/douglas/bin/makeroom.sh -f" -t "LINKS" -v "1.8.7" -s "assembly" -w "https://github.com/bcgsc/links" -l "GPL v3" -d "Long Interval Nucleotide K-mer Scaffolder"

LOG
---

    TOOL=LINKS
    VERSION=1.8.7
    cd /sw/bioinfo/LINKS/
    makeroom.sh -f -t $TOOL -v $VERSION -s assembly -w https://github.com/bcgsc/links -l "GPL v3" -d "Long Interval Nucleotide K-mer Scaffolder" 
    ./makeroom_LINKS_1.8.7.sh 
    source SOURCEME_LINKS_1.8.7 
    cd 1.8.7/
    cd src/
    wget https://github.com/bcgsc/LINKS/releases/download/v1.8.7/links_v1-8-7.tar.gz
    tar xzf links_v1-8-7.tar.gz 
    rmdir $PREFIX
    mv links_v1.8.7 $PREFIX
    cd $PREFIX

Now, do *not* redownload bloomfilter.  Just build the one in place.  Define `PERLCORE` to be the location of the module perl's `CORE/` directory.

    module load perl/5.26.2
    module load gcc/5.4.0
    module load swig/3.0.12

    PERLCORE=$(perl -e 'use Config; print $Config{archlib};')/CORE

    cd lib/bloomfilter/swig
    swig -Wall -c++ -perl5 BloomFilter.i
    g++ -c BloomFilter_wrap.cxx -I$PERLCORE -fPIC -Dbool=char -O3
    g++ -Wall -shared BloomFilter_wrap.o -o BloomFilter.so -O3

Update test.pl to use `env`.

    sed -i 's,^#!.*perl.*$,#!/usr/bin/env perl,' test.pl
    ./test.pl

Works, so do the same for tools and the LINKS scripts.

    cd $PREFIX/tools
    sed -i 's,^#!.*perl.*$,#!/usr/bin/env perl,' *.pl
    cd $PREFIX
    sed -i 's,^#!.*perl.*$,#!/usr/bin/env perl,' LINKS LINKS.pl

and test it.

    cd test
    ./runall.sh

In the mf file, `perl/5.26.2` must be loaded.
