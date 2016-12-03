JAGS 4.2.0
==========

Just Another Gibbs Sampler: MCMC library and app

<http://mcmc-jags.sourceforge.net/>

LOG
---

    cd /sw/apps/

There is a `jags` directory and a `jags_old` directory, but clearly never a
jags module.  Move them to `jags_old` and create the new module under `JAGS`.

    mkdir -p JAGS/old && mv jags jags_old JAGS/old
    cd JAGS/
    VERSION=4.2.0
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    P=$PWD  # for ./configure --prefix=$P
    cd ../src_$CLUSTER
    wget http://downloads.sourceforge.net/project/mcmc-jags/JAGS/4.x/Source/JAGS-${VERSION}.tar.gz
    tar xvf JAGS-${VERSION}.tar.gz 
    cd JAGS-${VERSION}/
    view INSTALL 
    ./configure --help

Standard installation.  Build both static and shared libraries.  Skipping the
installation of cppunit, which is used to run C++ unit tests.

    module load gcc/5.4.0
    ./configure --prefix=$P --enable-static --enable-shared 
    make -j 4
    make install

Check if rpath embedded.

    cd $P/libexec
    ldd jags-terminal
    cd $P/lib
    ldd libjags.so
    ldd libjrmath.so

Yes in for `gcc/5.4.0` in the `.so`, and `jags-terminal` executable also contains rpath for the jags `.so`.

Allow `pkg-config` to recognise JAGS in addition to the default jags as the package name.

    cd $P/lib/pkgconfig
    ln -s jags.pc JAGS.pc


Redo for tintin.  Do not use `-j 4` on make.

Use mf file from `pcre/8.38`.  Make sure pkgconfig file can be found.

