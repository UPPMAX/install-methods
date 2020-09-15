MERLIN/1.1.2
============

<https://csg.sph.umich.edu/abecasis/Merlin/>

MERLIN uses sparse trees to represent gene flow in pedigrees and is one of the
fastest pedigree analysis packages around (Abecasis et al, 2002)

Originally installed the precompiled versions (procedure at the end of the
file) but those required 32-bit libz and libstdc++.


LOG
---

    TOOL=MERLIN
    VERSION=1.1.2
    cd /sw/bioinfo/$TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir src rackham
    PREFIX=$PWD/rackham
    for CL in snowy irma bianca ; do test -L $CL || ln -s rackham $CL ; done
    cd src/
    wget https://csg.sph.umich.edu/abecasis/Merlin/download/merlin-1.1.2.tar.gz
    tar xzf merlin-1.1.2.tar.gz 
    cd merlin-1.1.2/
    make all
    make install INSTALLDIR=$PREFIX







To install the precompiled 32-bit binaries
------------------------------------------

    CLUSTER=rackham
    OTHERCLUSTERS="bianca irma"
    TOOL=MERLIN
    VERSION=1.1.2
    SWROOT=/sw/apps/bioinfo
    INSTALLDIR=$SWROOT/$TOOL/$VERSION/$CLUSTER

    mkdir -p $SWROOT/$TOOL/{$VERSION,src}
    cd $SWROOT/$TOOL/src

    # I used precompiled version
    wget http://csg.sph.umich.edu/abecasis/merlin/download/Linux-merlin.tar.gz
    tar xzf Linux-merlin.tar.gz
    mv merlin-1.1.2 ../$VERSION/$CLUSTER

    cd $SWROOT/$TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done

    chgrp sw -R $SWROOT/$TOOL/$VERSION
    chmod g+rwx -R $SWROOT/$TOOL/$VERSION


