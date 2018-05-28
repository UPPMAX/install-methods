RepeatMasker/4.0.7
==================

<http://www.repeatmasker.org/>

Update 9-Oct-2017: vers2 patch for rmblast/2.6.0+

LOG
---

RepeatMasker/4.0.7 will have more sequence-match tools configured with it than 4.0.6.

    cd /sw/apps/bioinfo/RepeatMasker
    VERSION=4.0.7
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION

Don't make `$CLUSTER` because the unpacked RepeatMasker directory will become that

    mkdir src_$CLUSTER
    cd src_$CLUSTER
    wget http://www.repeatmasker.org/RepeatMasker-open-4-0-7.tar.gz
    tar xzf RepeatMasker-open-4-0-7.tar.gz 

Get the RepBase RepeatMasker edition following RepeatMasker instructions.
Downloading it from office Mac, and unpack.

    cd ../../aux_rackham/lib
    rsync -Pt douglasscofield@fb166.ebc.uu.se:Downloads/RepBaseRepeatMaskerEdition-20170127.tar.gz .
    cd ../../$VERSION/src_$CLUSTER/RepeatMasker/
    tar xvzf ../RepBaseRepeatMaskerEdition-20170127.tar.gz 

Now getting auxiliary programs, several of which Wes already has.

    cd /sw/apps/bioinfo/RepeatMasker/aux_rackham/

TRF, for CentOS 7 systems.

    cd /sw/apps/bioinfo/RepeatMasker/aux_rackham/TRF
    mkdir 4.09
    cd 4.09
    rsync -Pt douglasscofield@fb166.ebc.uu.se:Downloads/trf409.linux64 trf
    chmod +x trf
    cd ../..

Use the legacy edition linked against GLIBC 2.12 when building on milou.

    cd /sw/apps/bioinfo/RepeatMasker/aux/TRF
    mkdir 4.09-legacy
    cd 4.09-legacy
    rsync -Pt douglasscofield@fb166.ebc.uu.se:Downloads/trf409.legacylinux64 trf
    chmod +x trf
    touch legacy-glibc-2.12
    cd ../..

RMBlastn 2.6.0+, do NOT configure this to build with boost, it is slower.

    cd /sw/apps/bioinfo/RepeatMasker/aux_rackham/rmblast/
    RMBLAST_VERSION=2.6.0+
    mkdir $RMBLAST_VERSION
    cd $RMBLAST_VERSION
    RMB_PREFIX=$PWD
    cd ..
    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.6.0/ncbi-blast-2.6.0+-src.tar.gz
    wget http://www.repeatmasker.org/isb-2.6.0+-changes-vers2.patch.gz
    tar xzf ncbi-blast-2.6.0+-src.tar.gz 
    gunzip isb-2.6.0+-changes-vers2.patch.gz 
    cd ncbi-blast-2.6.0+-src/
    patch -p1 < ../isb-2.6.0+-changes-vers2.patch
    cd c++/
    module load gcc/6.3.0
    ./configure --with-mt --prefix=$RMB_PREFIX --without-debug --without-bdb --without-boost
    make -j 8
    make install

nseg, not actually needed here but for RepeatModeler (<http://www.repeatmasker.org/RepeatModeler.html>).

    cd /sw/apps/bioinfo/RepeatMasker/aux_rackham/
    mkdir nseg
    cd nseg
    lftp ftp://ftp.ncbi.nih.gov/pub/seg/nseg/

and download everything to current directory.  Then

    make

As for cross_match, use the one from `RepeatExplorer` here.

    cd /sw/apps/bioinfo/RepeatMasker/aux_rackham/
    cp -av /sw/apps/bioinfo/RepeatExplorer/cross_match .
    mv cross_match cross_match_src
    cd cross_match_src
    make
    cp cross_match ..

Now create `$CLUSTER` from the RepeatMasker directory and configure it with the
available sequence tools.  Note that it wants directories in which the tools can
be found, not direct paths to the tools.

    cd ..
    mv src_$CLUSTER/RepeatMasker $CLUSTER
    cd $CLUSTER/
    module load perl/5.18.4 perl_modules/5.18.4
    which perl
    ./configure 

Make it use the `env` method to find perl.  The default sequence search method
should be rmblastn.

Directory for TRF:

    /sw/apps/bioinfo/RepeatMasker/aux_rackham/TRF/4.09

Directory for cross_match:

    /sw/apps/bioinfo/RepeatMasker/aux_rackham/cross_match_src

Directory for RMBlast:

    /sw/apps/bioinfo/RepeatMasker/aux_rackham/rmblast/2.6.0+/bin

and Y to make RMBlast the default.

Directory for HMMER3.1:

    /sw/apps/bioinfo/hmmer/3.1b2/rackham/bin


Check the configuration, see if anything might be missed.

    diff -W $COLUMNS -y RepeatMaskerConfig.tmpl RepeatMaskerConfig.pm | less

And check the tree to see if anything else might need to have `#!` line fixed.
Note that module files (`*.pm`) do not need that fixed.

    find . -type f -exec grep -Hn -m1 '^#!.*perl' {} \; | grep -v '\.pm:' | grep -vF '#!/usr/bin/env'

There were several in the `util/` directory.

The mf from 4.0.6 is a start, but we need to load `perl/5.18.4` and `perl_modules/5.18.4`.

