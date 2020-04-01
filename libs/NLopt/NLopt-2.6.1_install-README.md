NLopt/2.6.1
===========

<https://github.com/stevengj/nlopt>

Used under license:
MIT

Structure creating script (makeroom_NLopt_2.6.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/NLopt/makeroom_2.6.1.sh

LOG
---

    TOOL=NLopt
    VERSION=2.6.1
    CLUSTER=rackham
    TOOLDIR=/sw/libs/$TOOL
    VERSIONDIR=/sw/libs/$TOOL/$VERSION
    PREFIX=/sw/libs/$TOOL/$VERSION/$CLUSTER
    ./makeroom_NLopt_2.6.1.sh
    cd /sw/libs/$TOOL/$VERSION/src
    wget http://
    tar xvf 
    make

    TOOL=NLopt
    VERSION=2.6.1
    cd /sw/libs
    makeroom.sh -f -t $TOOL -v $VERSION -c libs -w https://github.com/stevengj/nlopt -d "NLopt is a library for nonlinear local and global optimization, for functions with and without gradient information. It is designed as a simple, unified interface and packaging of several free/open-source nonlinear optimization libraries." -l MIT 
    ./makeroom_NLopt_2.6.1.sh 
    cd NLopt/
    source SOURCEME_NLopt_2.6.1 
    cd 2.6.1/src/
    wget https://github.com/stevengj/nlopt/archive/v2.6.1.tar.gz
    tar xzf v${VERSION}.tar.gz
    cd nlopt-$VERSION
    mkdir build
    cd build
    module load cmake/3.13.2
    module load swig/3.0.7
    module load gcc/6.4.0
    module load python/3.7.2
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_VERBOSE_MAKEFILE:BOOL=TRUE ..
    make
    make install

The mf file should contain the standard library directories, except `lib64/`
instead of `lib/`.
