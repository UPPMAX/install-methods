PROJ.4/4.9.3
============

Cartographic Projections Library

<https://github.com/OSGeo/proj.4/wiki>


LOG
---

    VERSION=4.9.3
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/libs
    mkdir PROJ.4
    cd PROJ.4/
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do test -L $CL || ln -s $CLUSTER $CL ; done
    PREFIX=$PWD/$CLUSTER
    mkdir -p src
    cd src
    [[ -f ${VERSION}.tar.gz ]] || wget https://github.com/OSGeo/proj.4/archive/${VERSION}.tar.gz
    tar xzf ${VERSION}.tar.gz
    cd PROJ-${VERSION}
    module load autoconf/2.69   automake/1.16.1   m4/1.4.17   libtool/2.4.6
    ./autogen.sh
    ./configure --prefix=$PREFIX
    make
    make install

Use mf from PROJ.4/4.9.2.

