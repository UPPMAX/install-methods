LASER/2.04
=====

LASER: Locating Ancestry from SEquence Reads
------

C Wang*, X Zhan*, J Bragg-Gresham, HM Kang, D Stambolian, E Chew, K Branham, J
Heckenlively, The FUSION Study, RS Fulton, RK Wilson, ER Mardis, X Lin, A
Swaroop, S Zöllner, GR Abecasis (2014)  Ancestry estimation and control of
population stratification for sequence-based association studies. Nature
Genetics, 46: 409-415.

<http://csg.sph.umich.edu/chaolong/LASER/>


LOG
---

    TOOL=/sw/apps/bioinfo/LASER
    VERSION=2.04
    TOOLDIR=$TOOL/$VERSION
    CLUSTER={$CLUSTER?:CLUSTER must be set}
    PFX=$TOOLDIR/$CLUSTER
    mkdir -p $PFX
    cd $TOOL
    mkdir -p mf
    cd $TOOLDIR
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget http://csg.sph.umich.edu/chaolong/LASER/LASER-${VERSION}.tar.gz
    tar xvzf LASER-${VERSION}.tar.gz
    cd LASER-${VERSION}
    cp -av * $PFX/

Now make some modifications to some scripts.

    cd $PFX/pileup2seq
    vi pileup2seq.py
    chmod +x pileup2seq.py

Change she-bang line to use /usr/bin/env python and ignore -B flag.

We should be able to use the mf from 2.01.

    cd $TOOL/mf
    ln -s 2.01 2.02

The mf should add the following to PATH:

    prepend-path  PATH      $modroot/vcf2geno
    prepend-path  PATH      $modroot/pileup2seq
    prepend-path  PATH      $modroot
    setenv        LASER     $modroot
    setenv        LASERDOC  $modroot

