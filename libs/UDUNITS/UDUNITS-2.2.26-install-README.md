UDUNITS/2.2.26
==============

Looks like a nice units-handling library.  Required before installing the
'units' R package (installed in `R_packages/3.5.0`).

Built fine with the default gcc on the system.

<https://www.unidata.ucar.edu/software/udunits/>

LOG
---

    VERSION=2.2.26
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/libs
    mkdir UDUNITS
    cd UDUNITS
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL; done
    mkdir src
    cd src
    wget ftp://ftp.unidata.ucar.edu/pub/udunits/udunits-$VERSION.tar.gz
    tar xzf udunits-$VERSION.tar.gz 
    cd udunits-$VERSION
    ./configure --prefix=$PFX
    make
    make install

The mf file is copied from PROJ.4, but doesn't include pkg-config support or a man page.
It does include some INFO pages, as well as statically-built libraries.

    cd /sw/libs/UDUNITS
    mkdir mf
    cd mf
    cp ../../PROJ.4/mf/4.9.2 2.2.26
    vi 2.2.26 
