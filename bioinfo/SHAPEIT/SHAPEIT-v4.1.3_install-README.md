SHAPEIT/v4.1.3
========================

<https://github.com/odelaneau/shapeit4>

Used under license:
MIT

Structure creating script (makeroom_SHAPEIT_v4.1.3.sh) moved to /sw/bioinfo/SHAPEIT/makeroom_v4.1.3.sh


LOG
---

Build from tagged github archive.  It needs some rework in the makefile

    TOOL=SHAPEIT
    VERSION=v4.1.3
    cd /sw/bioinfo/SHAPEIT/
    makeroom.sh -f -t $TOOL -v $VERSION -l MIT -w https://github.com/odelaneau/shapeit4 -d "fast and accurate method for estimation of haplotypes (aka phasing) for SNP array and sequencing data; version 4 is a refactored and improved version of the SHAPEIT algorithm with multiple key additional features"
    ./makeroom_SHAPEIT_v4.1.3.sh 
    source SOURCEME_SHAPEIT_v4.1.3 
    cd v4.1.3/
    cd src/
    wget https://github.com/odelaneau/shapeit4/archive/v4.1.3.tar.gz
    tar xzf v4.1.3.tar.gz 
    cd shapeit4-4.1.3/

Load the modules required for building

    module load boost/1.70.0_gcc9.1.0
    module load gcc/9.3.0
    module load zlib/1.2.11
    module load bioinfo-tools htslib/1.9
    module load libcurl/7.45.0

Now edit the makefile.  This is a `diff` of the original tree and the modified
tree.  Only `makefile` is modified.  We use `HTSLIB_ROOT` and `BOOST_ROOT`, and
`-march=native`, and additional dynamic libraries because of htslib curl
support.

    diff shapeit4-4.1.3_orig/makefile shapeit4-4.1.3/makefile
    5,6c5,9
    < HTSLIB_INC=$(HOME)/Tools/htslib-1.9
    < HTSLIB_LIB=$(HOME)/Tools/htslib-1.9/libhts.a
    ---
    > #UPPMAX
    > HTSLIB_INC=$(HTSLIB_ROOT)/include/htslib
    > HTSLIB_LIB=$(HTSLIB_ROOT)/lib/libhts.a
    > #HTSLIB_INC=$(HOME)/Tools/htslib-1.9
    > #HTSLIB_LIB=$(HOME)/Tools/htslib-1.9/libhts.a
    9,11c12,18
    < BOOST_INC=/usr/include
    < BOOST_LIB_IO=/usr/lib/x86_64-linux-gnu/libboost_iostreams.a
    < BOOST_LIB_PO=/usr/lib/x86_64-linux-gnu/libboost_program_options.a
    ---
    > #UPPMAX
    > BOOST_INC=$(BOOST_ROOT)/include
    > BOOST_LIB_IO=$(BOOST_ROOT)/lib/libboost_iostreams.a
    > BOOST_LIB_PO=$(BOOST_ROOT)/lib/libboost_program_options.a
    > #BOOST_INC=/usr/include
    > #BOOST_LIB_IO=/usr/lib/x86_64-linux-gnu/libboost_iostreams.a
    > #BOOST_LIB_PO=/usr/lib/x86_64-linux-gnu/libboost_program_options.a
    24c31,32
    < #CXXFLAG=-O3 -march=native
    ---
    > #UPPMAX
    > CXXFLAG=-O3 -march=native
    26c34
    < CXXFLAG=-O3 -mavx2 -mfma 
    ---
    > #CXXFLAG=-O3 -mavx2 -mfma 
    32c40,42
    < DYN_LIBS=-lz -lbz2 -lm -lpthread -llzma
    ---
    > #DYN_LIBS=-lz -lbz2 -lm -lpthread -llzma
    > #UPPMAX
    > DYN_LIBS=-lz -lbz2 -lm -lpthread -llzma -lcurl -lssl -lcrypto
    Common subdirectories: shapeit4-4.1.3_orig/maps and shapeit4-4.1.3/maps
    Common subdirectories: shapeit4-4.1.3_orig/obj and shapeit4-4.1.3/obj
    Common subdirectories: shapeit4-4.1.3_orig/src and shapeit4-4.1.3/src
    Common subdirectories: shapeit4-4.1.3_orig/test and shapeit4-4.1.3/test

Now build,

    make -j 3

and copy over to the `PREFIX`.

    cp -av bin $PREFIX/
    cd $PREFIX/bin
    rm .gitignore 
    ln -s shapeit4 shapeit

Make sure we can load it.

    module purge
    ldd shapeit4
    ./shapeit4

Since we use `-march=native`, we have to build separate for snowy, irma and
bianca.  Now ssh to **snowy-lr1** and do the build steps again.

    cd /sw/bioinfo/SHAPEIT
    source SOURCEME_SHAPEIT_v4.1.3 
    cd $VERSIONDIR
    rm -rf bianca irma snowy
    mkdir snowy && for CL in bianca irma ; do ln -s snowy $CL; done
    cd $SRCDIR
    cd shapeit4-4.1.3/
    module load boost/1.70.0_gcc9.1.0
    module load gcc/9.3.0
    module load zlib/1.2.11
    module load bioinfo-tools htslib/1.9
    module load libcurl/7.45.0
    make clean
    make -j 3
    cp -av bin $PREFIX/
    cd $PREFIX/bin
    rm -f .gitignore 
    ln -s shapeit4 shapeit
    module purge
    ldd shapeit4
    ./shapeit4

