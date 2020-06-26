beagle/2.1.2
============

General purpose library for evaluating the likelihood of sequence evolution on trees.

<https://github.com/beagle-dev/beagle-lib>


LOG
---

This is 4 years old, so do **not** load the latest autoconf/automake/m4
modules.  Build docs, OpenMP library versions, and disable OpenCL and CUDA.

    TOOL=beagle
    VERSION=2.1.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/bioinfo/$TOOL
    cd /sw/bioinfo/$TOOL
    mkdir $VERSION
    cd $VERSION
    rm -rf $CLUSTER
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ..
    mkdir src
    cd src
    module load gcc/4.9.4
    module load doxygen/1.8.11 texlive/2016
    [[ -f beagle_release_${VERSION//./_}.tar.gz ]] || wget https://github.com/beagle-dev/beagle-lib/archive/beagle_release_${VERSION//./_}.tar.gz
    [[ -d beagle-lib-beagle_release_${VERSION//./_} ]] && rm -rf beagle-lib-beagle_release_${VERSION//./_}
    tar xzf beagle_release_${VERSION//./_}.tar.gz
    cd beagle-lib-beagle_release_${VERSION//./_}
    ./autogen.sh
    ./configure --enable-openmp --enable-doxygen-pdf --without-cuda --without-opencl --prefix=$PFX
    make
    make doxygen-doc
    make install
    cp -av doc $PFX/
    cd ..
    rm -rf beagle-lib-beagle_release_${VERSION//./_}

Now that we're building the docs, don't forget to prepend `$modroot/doc/man` to `MANPATH` and to set `BEAGLE_DOC` to `$modroot/doc`.

