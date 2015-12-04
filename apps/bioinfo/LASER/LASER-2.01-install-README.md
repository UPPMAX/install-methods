# LASER-2.01-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    LASER 2.01

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
    VERSION=2.01
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
    wget http://csg.sph.umich.edu/chaolong/LASER/LASER-2.01.tar.gz
    tar xvzf LASER-2.01.tar.gz
    cd LASER-2.01

Copy everything en masse over to executables directory.

    cp -av * $CLUSTERDIR/

Now make some modifications to some scripts.

    cd $CLUSTERDIR/pileup2seq
    vi pileup2seq.py

Change she-bang line to use /usr/bin/env python and ignore -B flag.  Discovered
this while working on a ticket (#110679) for 2.02.

Steal an mf from another project, we need to add $CLUSTERDIR/bin to PATH and load boost/1.55.0.

    cd $TOOL/mf
    cp /sw/apps/bioinfo/BEETL/mf/1.0.2 2.01
    vi 2.01

Add to PATH:

    $CLUSTERDIR
    $CLUSTERDIR/pileup2seq
    $CLUSTERDIR/vcf2geno

Create two environment variables

    setenv LASER $CLUSTERDIR
    setenv LASERDOC $CLUSTERDIR

Be a good neighbor.

    cd /sw/apps/bioinfo
    chgrp -hR sw LASER
    chmod -R g+wX,o+rX LASER
    find LASER -type d -exec chmod g+s {} \;

