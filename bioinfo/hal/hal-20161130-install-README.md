HAL (Hierarchical Alignment Format) 20151218
============================================

No official versions, so giving version as date of `git clone`.

    TOOLDIR=/sw/apps/bioinfo/hal
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    VERSION=20161130
    VERSIONDIR=$TOOLDIR/$VERSION
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $VERSION
    mkdir -p src_$CLUSTER
    cd src_$CLUSTER
    #  git clone git://github.com/glennhickey/hal.git
    module load git/2.10.2
    module load python/2.7.6
    module load gcc/5.3.0
    git clone https://github.com/ComparativeGenomicsToolkit/hal.git

Install hdf5, the latest version 1.8.16.

    mkdir $CLUSTERDIR/hdf5
    wget https://www.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.16/src/hdf5-1.8.16.tar.gz
    tar xzf hdf5-1.8.16.tar.gz 
    cd hdf5-1.8.16/
    ./configure --enable-cxx --prefix=$CLUSTERDIR/hdf5
    make
    make install
    export h5prefix=-prefix=$CLUSTERDIR/hdf5
    export PATH=$CLUSTERDIR/hdf5/bin:$PATH
    export LD_RUN_PATH=/sw/apps/bioinfo/hal/$VERSION/$CLUSTER/hdf5/lib:$LD_RUN_PATH
    cd ..

Install sonLib at same level as `hal/`.

    git clone git://github.com/benedictpaten/sonLib.git
    pushd sonLib && make && popd

Get CLAPACK and install at same level as `hal/`.

    wget http://www.netlib.org/clapack/clapack.tgz
    tar xzf clapack.tgz 
    mv CLAPACK-3.2.1 clapack
    cd clapack/
    cp make.inc.example make.inc && make f2clib && make blaslib && make lib
    export CLAPACKPATH=`pwd`
    cd ..

Build using phast, but use the existing `phast/1.4` module instead of building
from scratch.

    export PHAST=/sw/apps/bioinfo/phast/1.4/src_$CLUSTER/phast

Now update build options, some bug fixes and some to get around old usage in
phast code.

    cd $VERSIONDIR/src_$CLUSTER/hal

These are the diffs, first of `include.mk` so that it uses `PHAST` and
`CLAPACKPATH`, and then of `modify/Makefile` to actually use these directories
if they are set (using Gnu make `?=`), and to include the `-fpermissive` flag
to get around phast interchanging `void*` and `char*`.

    milou-b: /pica/sw/apps/bioinfo/hal/20151218/src/hal $ git diff
    diff --git a/include.mk b/include.mk
    index 871667c..01699c7 100644
    --- a/include.mk
    +++ b/include.mk
    @@ -55,8 +55,8 @@ endif

     #      Local Linux install (phast and clapack sister dirs to hal/)
     #      (note CLAPACKPATH not needed in Mac)
    -       PHAST=../../phast
    -       CLAPACKPATH=../../clapack
    +       PHAST ?= ../../phast
    +       CLAPACKPATH ?= ../../clapack

     #      Melissa's version of the above
     #      PHAST=/home/mt269/phast
    diff --git a/modify/Makefile b/modify/Makefile
    index 5a9eed8..385ef19 100644
    --- a/modify/Makefile
    +++ b/modify/Makefile
    @@ -1,8 +1,8 @@
     rootPath = ../
     include ../include.mk

    -phastCflags = -I../../phast/include -I../../clapack/INCLUDE -I../../phast/src/lib/pcre
    -phastLinkflags = ../../phast/lib/libphast.a ../../phast/lib/liblapack.a ../../phast/lib/libblaswr.a ../../clapack/F2CLIBS/libf2c.a
    +phastCflags = -I${PHAST}/include -I${CLAPACKPATH}/INCLUDE -I${PHAST}/src/lib/pcre -fpermissive
    +phastLinkflags = ${PHAST}/lib/libphast.a ${PHAST}/lib/liblapack.a ${PHAST}/lib/libblaswr.a ${CLAPACKPATH}/F2CLIBS/libf2c.a
     libHeaders = $(wildcard inc/*.h )
     libTestsCommon = ${rootPath}/api/tests/halAlignmentTest.cpp
     libTestsCommonHeaders = ${rootPath}/api/tests/halAlignmentTest.h ${rootPath}/api/tests/allTests.h

Now build, we should be in `$VERSIONDIR/src_$CLUSTER/hal/`.

    make

Copy over to the install directory.

    cd ..
    cp -avL hal sonLib $CLUSTERDIR/
    cd $CLUSTERDIR
    rm -rf hal/.git

Now, in mf add `$CLUSTERDIR` to `PYTHONPATH`, and `$CLUSTERDIR/hal/bin` to `PATH`.  Also, load `python/2.7.6` for the API.

Set these for testing, as well.  To test:

    cd $VERSIONDIR/src_$CLUSTER/hal
    make test

I got some failures in `api/test`:

    ...
    Running test case halValidateSmallTest
    Running test case halValidateMediumTest
    ........................FFF....F.............

    There were 4 failures:
    1) halColumnIteratorGapTest: tests/halColumnIteratorTest.cpp:596: assert failed
    2) halColumnIteratorMultiGapTest: tests/halColumnIteratorTest.cpp:755: assert failed
    3) halColumnIteratorMultiGapInvTest: tests/halColumnIteratorTest.cpp:955: assert failed
    4) halRearrangementInsertionTest: tests/halRearrangementTest.cpp:246: assert failed

    !!!FAILURES!!!
    Runs: 45 Passes: 41 Fails: 4
    ...
