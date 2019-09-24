PROJ.4/4.9.3
============

Cartographic Projections Library

<https://github.com/OSGeo/proj.4/wiki>


LOG
---

    TOOLVERSION=4.9.3
    INTELVERSION=18.3
    VERSION=4.9.3-intel${INTELVERSION}
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
    [[ -f ${VERSION}.tar.gz ]] || wget https://github.com/OSGeo/proj.4/archive/${TOOLVERSION}.tar.gz
    tar xzf ${TOOLVERSION}.tar.gz
    cd PROJ-${TOOLVERSION}
    module load intel/$INTELVERSION
    module load autoconf/2.69   automake/1.16.1   m4/1.4.17   libtool/2.4.6
    ./autogen.sh
    ./configure --prefix=$PREFIX
    make
    make install

Use mf from PROJ.4/4.9.3.

