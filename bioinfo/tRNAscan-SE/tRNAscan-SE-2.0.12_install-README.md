tRNAscan-SE/2.0.12
==================

<http://lowelab.ucsc.edu/tRNAscan-SE/>

Used under license:
GPLv3


Structure creating script (makeroom_tRNAscan-SE_2.0.12.sh) moved to /sw/bioinfo/tRNAscan-SE/makeroom_2.0.12.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "tRNAscan-SE" "-v" "2.0.12" "-w" "http://lowelab.ucsc.edu/tRNAscan-SE/" "-d" "Improved Detection and Functional Classification of Transfer RNA Genes" "-l" "GPLv3"
    ./makeroom_tRNAscan-SE_2.0.12.sh
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

    for F in $(file * | grep 'Perl script' | cut -f1 -d:) ; do sed -i '1i#!/usr/bin/env perl' "$F" ; done
    head -n 2 $(file * | grep 'Perl script' | cut -f1 -d:)

Be sure to load perl/5.26.2 in the mf file, and update `PERL5LIB`.

    makeroom.sh -f -t "tRNAscan-SE" -v "2.0.12" -w "http://lowelab.ucsc.edu/tRNAscan-SE/" -d "Improved Detection and Functional Classification of Transfer RNA Genes" -l "GPLv3"
    ./makeroom_tRNAscan-SE_2.0.12.sh 
    source /sw/bioinfo/tRNAscan-SE/SOURCEME_tRNAscan-SE_2.0.12
    cd $SRCDIR

    wget --no-check-certificate http://trna.ucsc.edu/software/trnascan-se-2.0.12.tar.gz
    tar xf trnascan-se-2.0.12.tar.gz 
    cd tRNAscan-SE-2.0/

Check installation instructions.

    cat INSTALL 

Get infernal.

    cd $SRCDIR
    wget http://eddylab.org/infernal/infernal-1.1.5.tar.gz
    tar xf infernal-1.1.5.tar.gz 
    ml gcc/12.3.0
    ml perl/5.32.1
    cd infernal-1.1.5/
    echo $PREFIX
    ./configure --prefix=$PREFIX
    make && make check && make install
    ( cd hmmer && make install )
    ( cd easel && make install )

Now build tRNAscan.

    cd $SRCDIR

    cd tRNAscan-SE-2.0/
    ./configure --prefix=$PREFIX
    make
    make install

The seed alignments available at the tRNAscan-SE website were used to build the
included models, and are not needed for the installation.

See if perl is properly handled.

    cd $PREFIX/bin
    head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)

It is not.  "Better" than 2.0.9 by hardcoding the path to the perl, which works
for python which finds modules via relative locations.  BUT perl doesn't do
that.  It is better to use /usr/bin/env and load a perl module in the mf file.

    for F in $(file * | grep 'Perl script' | cut -f1 -d:) ; do sed -i '1i#!/usr/bin/env perl' "$F" ; done
    head -n 2 $(file * | grep 'Perl script' | cut -f1 -d:)

Be sure to load perl/5.32.1 in the mf file, and update `PERL5LIB`.

