JAGS/4.3.0
==========

Just Another Gibbs Sampler: MCMC library and app

<http://mcmc-jags.sourceforge.net/>

LOG
---

    cd /sw/apps/

There is a `jags` directory and a `jags_old` directory, but clearly never a
jags module.  Move them to `jags_old` and create the new module under `JAGS`.

    cd JAGS/
    VERSION=4.3.0
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    wget http://downloads.sourceforge.net/project/mcmc-jags/JAGS/4.x/Source/JAGS-${VERSION}.tar.gz
    tar xvf JAGS-${VERSION}.tar.gz 
    cd JAGS-${VERSION}/
    view INSTALL 
    ./configure --help

Standard installation.  Build both static and shared libraries.  Skipping the
installation of cppunit, which is used to run C++ unit tests.

    module load gcc/7.3.0
    ./configure --prefix=$PFX --enable-static --enable-shared 
    make -j 10
    make install

Check if rpath embedded.

    cd $PFX/libexec
    ldd jags-terminal
    cd $PFX/lib
    ldd libjags.so
    ldd libjrmath.so
    cd $PFX/lib/pkgconfig
    ln -s jags.pc JAGS.pc

