# LASER-2.02-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    LASER 2.02

DESCRIPTION
-----------

    LASER: Locating Ancestry from SEquence Reads

    C Wang*, X Zhan*, J Bragg-Gresham, HM Kang, D Stambolian, E Chew, K
    Branham, J Heckenlively, The FUSION Study, RS Fulton, RK Wilson, ER Mardis, X
    Lin, A Swaroop, S Zöllner, GR Abecasis (2014) Ancestry estimation and control
    of population stratification for sequence-based association studies. Nature
    Genetics, 46: 409-415 [link].


WEBSITE
-------

    http://csg.sph.umich.edu/chaolong/LASER/

MODULE REQUIREMENTS
-------------------

    None

LOG
---

    TOOL=/sw/apps/bioinfo/LASER
    VERSION=2.02
    TOOLDIR=$TOOL/$VERSION
    CLUSTER=milou
    CLUSTERDIR=$TOOLDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    mkdir -p mf
    cd $TOOLDIR
    ln -sf ./$CLUSTER halvan
    ln -sf ./$CLUSTER nestor
    ln -sf ./$CLUSTER tintin

Since precompiled executables seem to be fine, do not make
separate directory for tintin.

Now get source/binaries.

    mkdir src
    cd src
    wget http://csg.sph.umich.edu/chaolong/LASER/LASER-2.02.tar.gz
    tar xvzf LASER-2.02.tar.gz
    cd LASER-2.02

Copy everything en masse over to executables directory.

    cp -av * $CLUSTERDIR/

Now make some modifications to some scripts.

    cd $CLUSTERDIR/pileup2seq
    vi pileup2seq.py

Change she-bang line to use /usr/bin/env python and ignore -B flag.

We should be able to use the mf from 2.01.

    cd $TOOL/mf
    ln -s 2.01 2.02

The mf should add the following to PATH:

    $CLUSTERDIR
    $CLUSTERDIR/pileup2seq
    $CLUSTERDIR/vcf2geno

And create two environment variables:

    setenv LASER $CLUSTERDIR
    setenv LASERDOC $CLUSTERDIR

Finished with mf, now be a good neighbor.

    cd /sw/apps/bioinfo
    chgrp -hR sw LASER
    chmod -R g+wX,o+rX LASER
    find LASER -type d -exec chmod g+s {} \;

