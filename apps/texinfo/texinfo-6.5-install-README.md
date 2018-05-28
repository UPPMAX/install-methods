texinfo/6.5
===========

<https://www.gnu.org/software/texinfo/>

The HTML and info versions of R package documentation cannot be built without
texinfo.

Log
---

    VERSION=6.5
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps
    mkdir -p texinfo
    cd texinfo
    mkdir $VERSION
    cd $VERSION
    mkdir mf
    mkdir src $CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    cd src
    wget http://ftp.gnu.org/gnu/texinfo/texinfo-${VERSION}.tar.gz
    tar xzf texinfo-${VERSION}.tar.gz 
    cd texinfo-${VERSION}/
    ./configure --prefix=$PFX
    make
    make install
    cd ..
    rm -rf texinfo-${VERSION}

Use mf file from 6.0.

