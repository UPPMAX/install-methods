JAGS/4.3.1
==========

<http://mcmc-jags.sourceforge.net/>

Used under license:
GPL v2


Structure creating script (makeroom_JAGS_4.3.1.sh) moved to /sw/apps/JAGS/makeroom_4.3.1.sh

LOG
---

    makeroom.sh "-f" "-c" "apps" "-t" "JAGS" "-v" "4.3.1" "-w" "http://mcmc-jags.sourceforge.net/" "-d" "Just Another Gibbs Sampler: MCMC library and app" "-l" "GPL v2"
    ./makeroom_JAGS_4.3.1.sh

There is a `jags` directory and a `jags_old` directory, but clearly never a
jags module.  Move them to `jags_old` and create the new module under `JAGS`.

    source /sw/apps/JAGS/SOURCEME_JAGS_4.3.1
    cd $SRCDIR

    wget https://downloads.sourceforge.net/project/mcmc-jags/JAGS/4.x/Source/JAGS-${VERSION}.tar.gz
    tar xvf JAGS-${VERSION}.tar.gz 
    cd JAGS-${VERSION}/
    view INSTALL 
    ./configure --help

Standard installation.  Build both static and shared libraries.  Skipping the
installation of cppunit, which is used to run C++ unit tests.

    module load gcc/10.3.0
    ./configure --prefix=$PREFIX --enable-static --enable-shared 
    make -j 10
    make install

Check if rpath embedded.

    cd $PREFIX/libexec
    ldd jags-terminal
    cd $PREFIX/lib
    ldd libjags.so
    ldd libjrmath.so
    cd $PREFIX/lib/pkgconfig
    ln -s jags.pc JAGS.pc

