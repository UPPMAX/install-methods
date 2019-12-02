MUMmer/3.22
===========

Picked up 3.22 from <http://mummer.sourceforge.net/>

Rebuilt 2019/10/22 DGS.

LOG
---

    TOOL=MUMmer
    VERSION=3.22
    cd /sw/bioinfo/$TOOL
    mkdir $VERSION
    cd $VERSION
    PREFIX=$PWD/$CLUSTER
    #  do not make $CLUSTER directory, that will be the unpacked tarball
    for CL in irma bianca snowy milou ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    mkdir src
    cd src
    module load perl/5.18.4
    module load gcc/6.3.0
    wget https://downloads.sourceforge.net/project/mummer/mummer/${VERSION}/MUMmer${VERSION}.tar.gz
    tar xzf MUMmer${VERSION}.tar.gz
    mv MUMmer${VERSION} $PREFIX
    cd $PREFIX
    make clean
    make CFLAGS="-O3 -DSIXTYFOURBITS" CPPFLAGS="-O3 -DSIXTYFOURBITS" CXXFLAGS="-O3 -DSIXTYFOURBITS"

Now make the Perl scripts use the env mechanism.

    sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)

