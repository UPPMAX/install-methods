KAT/2.3.4
=========

K-mer Analysis Toolkit

<https://github.com/TGAC/KAT>

LOG
---

Continue.

    VERSION=2.3.4
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir -p KAT
    cd KAT
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    [[ -f kat-${VERSION}.tar.gz ]] || wget https://github.com/TGAC/KAT/releases/download/Release-${VERSION}/kat-${VERSION}.tar.gz
    tar xzf kat-${VERSION}.tar.gz 
    cd kat-${VERSION}/
    module load gcc/6.3.0
    module load boost/1.63.0_gcc6.3.0
    module load python/3.5.0
    ./configure --prefix=$PFX --with-boost=/sw/apps/build/boost/1.63.0_gcc6.3.0/$CLUSTER
    make
    make install

Now make sure the executables can find their libraries.  After installation,
the executables could not find two shared objects; the .so for python, and the
C++ libraries for kat_jellyfish.  Add directories for both to `LD_LIBRARY_PATH`
at the end of the module file. Use `$gccversion` and `$pythonversion`
variables for consistency.

    # Pick up the python .so, it is linked into the kat executable.

    prepend-path    LD_LIBRARY_PATH   /sw/comp/python/${pythonversion}_${Cluster}/lib

    # kat_jellyfish doesn't have RPATH properly set, so show it the C++ libraries

    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/${gccversion}_${Cluster}/lib64
    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/${gccversion}_${Cluster}/lib

Load the module and make sure it works.

    module unload boost gcc python
    module load bioinfo-tools KAT/$VERSION
    ldd $(which kat) $(which kat_jellyfish)
    kat
    kat_jellyfish
