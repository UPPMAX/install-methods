tRNAscan-SE/2.0.9
=================

<http://lowelab.ucsc.edu/tRNAscan-SE/>

Used under license:
GPLv3


Structure creating script (makeroom_tRNAscan-SE_2.0.9.sh) moved to /sw/bioinfo/tRNAscan-SE/makeroom_2.0.9.sh

LOG
---

It uses a temporary directory, but cues off of `TMPDIR` if it is set, which it is by SLURM to `SNIC_TMP` within jobs, thank goodness.


    makeroom.sh -f -t "tRNAscan-SE" -v "2.0.9" -w "http://lowelab.ucsc.edu/tRNAscan-SE/" -d "Improved Detection and Functional Classification of Transfer RNA Genes" -l "GPLv3"
    ./makeroom_tRNAscan-SE_2.0.9.sh
    cd /sw/bioinfo/tRNAscan-SE
    source SOURCEME_tRNAscan-SE_2.0.9
    cd $SRCDIR
    ml gcc/9.3.0
    ml perl/5.26.2

We need to install Eddy lab infernal in the same directory, according to the
installation instructions.  It asks for 1.1.2, hopefully 1.1.4 works as well.
Standard install for infernal.

    wget http://eddylab.org/infernal/infernal-1.1.4.tar.gz
    tar xf infernal-1.1.4.tar.gz 
    cd infernal-1.1.4/
    ./configure --prefix=$PREFIX
    make && make check && make install
    ( cd hmmer && make install )
    ( cd easel && make install )

Now install tRNAscan-SE itself.

    cd $SRCDIR
    wget http://trna.ucsc.edu/software/trnascan-se-2.0.9.tar.gz
    tar xf trnascan-se-2.0.9.tar.gz 
    cd tRNAscan-SE-2.0/
    ./configure --prefix=$PREFIX
    make
    make install
    cd $PREFIX

Take a look around.  Update directory needed for `PERL5LIB` to `$modroot/lib/tRNAscan-SE`.

And, do we need to fix the `#!` lines for the perl scripts?

    cd $PREFIX/bin
    head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)

Yes.

    for F in $(file * | grep 'Perl script' | cut -f1 -d:) ; do sed -i 's,^#! */usr/bin/perl.*$,#!/usr/bin/env perl,' "$F" ; done
    head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)

Be sure to load perl/5.26.2 in the mf file, and update `PERL5LIB`.
