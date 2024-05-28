clapack/3.2.1
=============

<https://www.netlib.org/clapack/>

Used under license:
Public domain


Structure creating script (makeroom_clapack_3.2.1.sh) moved to /sw/libs/clapack/makeroom_3.2.1.sh

LOG
---

Here we move the unpacked source tarball to PREFIX and build there, then lift some files out, most of the libraries with new names, as symlinks into `lib/` and `include/` directories.  The source tree wants to be used directly by e.g., DivE and probably others.  There doesn't seem to be a standard discipline for how to install these, so I'm following what DivE expects and also a bit of common sense. It's possible I've missed something or make a bonked decision.

    makeroom.sh -t clapack -v 3.2.1 -c libs -w https://www.netlib.org/clapack/ -l "Public domain" -d "C language interface to LAPACK library"
    ./makeroom_clapack_3.2.1.sh 
    source /sw/libs/clapack/SOURCEME_clapack_3.2.1 && cd $SRCDIR

The latest CLAPACK is 3.2.1 (https://www.netlib.org/clapack/) so we'll copy our tarball over from the lapack/3.6.1 source tree.

    cp -av ../../../lapack/3.6.1/src/clapack.tgz .

    tar xf clapack.tgz 
    mv CLAPACK-3.2.1 $PREFIX/
    cd $PREFIX/CLAPACK-3.2.1

    ln -s make.inc.example make.inc
    make blaslib
    make f2clib
    make
    make cblaswrap fblaswrap

    cd $PREFIX
    mkdir lib
    mkdir include

    cd $PREFIX/lib

    ln -s ../CLAPACK-3.2.1/tmglib_LINUX.a libtmg.a
    ln -s ../CLAPACK-3.2.1/blas_LINUX.a libblaswr.a
    ln -s ../CLAPACK-3.2.1/lapack_LINUX.a liblapack.a
    ln -s ../CLAPACK-3.2.1/libcblaswr.a .
    ln -s ../CLAPACK-3.2.1/libfblaswr.a .
    ln -s ../CLAPACK-3.2.1/F2CLIBS/libf2c.a .

    cd $PREFIX/include

    ln -s ../CLAPACK-3.2.1/INCLUDE/*.h .


mf file
-------

In the mf file, we need to define `CPATH` and `CPLUS_INCLUDE_PATH`, as well as `LIBRARY_PATH` (everything's static) and the additional variable `CLAPACKPATH` to be `$modroot/CLAPACK-3.2.1`.  This is used by DivE and possibly others.


