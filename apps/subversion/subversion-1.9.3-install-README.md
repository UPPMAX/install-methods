subversion 1.9.3
================

Built from source, downloaded from

<https://subversion.apache.org/download.cgi>

Log
---

Many prerequisites, but it tries to make it easy.  I did not concentrate on
making this subversion be a robust build-against system, but `LD_RUN_PATH`,
`PKG_CONFIG_PATH` etc are set so it should be possible.  I did not set `CPATH`
as the `include/` subdirectories were suffixed with `-1`, which seems odd.  I
figure `pkgconfig` should be able to get through that.

    cd /sw/apps/
    mkdir subversion
    cd subversion/
    mkdir -p 1.9.3/src
    cd 1.9.3/src/
    wget http://apache.mirrors.spacedump.net/subversion/subversion-1.9.3.tar.bz2
    tar xjf subversion-1.9.3.tar.bz2 
    cd subversion-1.9.3/
    view INSTALL 
    module load gcc/4.9.2

Included script to download dependencies.  Each must be configured and built
separately.

    bash -x ./get-deps.sh 
    rm -rf zlib  # use the system zlib
    wget http://archive.apache.org/dist/apr/apr-iconv-1.2.1.tar.bz2
    tar xjf apr-iconv-1.2.1.tar.bz2 
    export APR_ICONV_PATH=apr-iconv-1.2.1

    cd ../..
    mkdir milou
    ln -s ./milou nestor
    ln -s ./milou halvan
    ln -s ./milou tintin
    cd milou/
    D=$PWD
    echo $D

D is now our install directory, used for --prefix etc.  Use it while building
prerequisites.

    cd ../src/subversion-1.9.3/
    cd apr
    configure --prefix=$D
    make
    make install
    cd ..
    cd apr-util/
    ./configure --prefix=$D --with-apr=$D
    make
    make install
    cd ..
    cd apr-iconv-1.2.1/
    ./configure --prefix=$D --with-apr=$D
    make
    make install
    cd ..

Set up LD_RUN_PATH to pick up the libs we are installing.

    echo $LD_RUN_PATH
    OLD_LD_RUN_PATH=$LD_RUN_PATH
    export LD_RUN_PATH=/sw/apps/subversion/1.9.3/milou/lib:/sw/apps/subversion/1.9.3/milou/lib/iconv:$LD_RUN_PATH

serf uses the `scons` build system, and the system version is too old.  Build
scons from scratch.

    cd serf/
    wget http://prdownloads.sourceforge.net/scons/scons-local-2.3.0.tar.gz
    tar xvzf scons-local-2.3.0.tar.gz 
    ln -s scons.py scons
    ./scons APR=$D APU=$D PREFIX=$D
    ./scons install
    cd ..
    cd sqlite-amalgamation/
    gcc -O2 -o sqlite3 sqlite3.c shell.c -lpthread -ldl
    cp sqlite3 ../../../milou/bin/

Add the instructions for building sqlite3 to UPPMAX_BUILD.

In prepration for building subversion itself, set path to get the various
executables we have been creating.  We also need to load newer python and ruby
just to configure goes through OK.  We do not concentrate on a build-against
subversion so these APIs may not matter.

    export PATH=$D/bin:$PATH
    which sqlite3
    module load python/2.7.6
    module load ruby/2.0.0_p353
    ./configure --with-apr=$D --with-serf=$D --with-apr-util=$D --prefix=$D
    make
    make install

On a fresh shell, see if RPATH is set correctly.

    cd ../../milou/bin
    ldd svn

In the mf, set

    prepend-path  PATH              $modroot/bin
    prepend-path  LIBRARY_PATH      $modroot/lib
    prepend-path  LD_RUN_PATH       $modroot/lib
    prepend-path  MANPATH           $modroot/share/man
    prepend-path  PKG_CONFIG_PATH   $modroot/share/pkgconfig

