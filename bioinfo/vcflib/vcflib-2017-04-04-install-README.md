vcflib 2017-04-04
=================

C++ library and utilities for manipulating VCF files.

<https://github.com/vcflib/vcflib>

LOG
---

    CLUSTER=${CLUSTER:?CLUSTER must be set}
    VERSION=2017-04-04
    cd /sw/apps/bioinfo/vcflib/
    mkdir -p $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in bianca irma ; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    cd src_$CLUSTER
    module load git/2.10.2
    git clone --recursive https://github.com/vcflib/vcflib.git
    cd vcflib/
    module load zlib/1.2.11 gcc/6.3.0
    make -j 4
    cp -av bin scripts $PFX/

