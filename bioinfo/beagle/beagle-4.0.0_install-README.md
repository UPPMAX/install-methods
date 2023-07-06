beagle/4.0.0
============

<https://github.com/beagle-dev/beagle-lib>

Used under license:
GPL v3, LGPL v2.1


Structure creating script (makeroom_beagle_4.0.0.sh) moved to /sw/bioinfo/beagle/makeroom_4.0.0.sh

LOG
---

    makeroom.sh -f -t beagle -s phylogeny -v 4.0.0 -w https://github.com/beagle-dev/beagle-lib -d "general purpose library for evaluating the likelihood of sequence evolution on trees" -l "GPL v3, LGPL v2.1"
    ./makeroom_beagle_4.0.0.sh 
    source /sw/bioinfo/beagle/SOURCEME_beagle_4.0.0
    cd $SRCDIR

    wget https://github.com/beagle-dev/beagle-lib/archive/refs/tags/v4.0.0.tar.gz
    tar xf v4.0.0.tar.gz 
    cd beagle-lib-4.0.0/

### Build for rackham, miarka

    ml gcc/10.3.0
    ml java/OpenJDK_17+35
    ml cmake/3.26.3


    mkdir build_rackham
    cd build_rackham/

    cmake -DBUILD_CUDA=OFF -DBUILD_OPENCL=OFF -DCMAKE_INSTALL_PREFIX=$PREFIX ..
    make
    make test
    make install

Add RPATH to the libraries. For all, add directories for gcc/10.3.0. Additionally, for `libhmsbeagle-jni.so` add the library directory from this module. `LD_RUN_PATH` is set by gcc/10.3.0.

    cd $PREFIX/lib
    module load patchelf/0.10

    for L in libhmsbeagle-cpu-sse.so libhmsbeagle-cpu.so libhmsbeagle.so
    do
        patchelf --set-rpath $LD_RUN_PATH $L
    done
    patchelf --set-rpath $PWD:$LD_RUN_PATH libhmsbeagle-jni.so

    module purge
    ldd *.so


### Build for snowy, bianca

    ml gcc/10.3.0
    ml java/OpenJDK_17+35
    ml cmake/3.26.3

    mkdir build_snowy
    cd build_snowy/

Build on s166, which has T4 GPU.

    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
    make
    make test
    make install

    cd $PREFIX/lib
    module load patchelf/0.10

Fix up RPATH. Add the cuda and openCL libraries.

    for L in libhmsbeagle-cpu-sse.so libhmsbeagle-cpu.so libhmsbeagle-cuda.so libhmsbeagle-opencl.so libhmsbeagle.so
    do
        patchelf --set-rpath $LD_RUN_PATH $L
    done
    patchelf --set-rpath $PWD:$LD_RUN_PATH libhmsbeagle-jni.so

    module purge
    ldd *.so

