NextGenMap/0.5.5
================

<http://cibiv.github.io/NextGenMap/>

Used under license:
MIT
<https://github.com/Cibiv/NextGenMap/blob/master/LICENSE>

Structure creating script (makeroom_NextGenMap_0.5.5.sh) moved to /sw/bioinfo/NextGenMap/makeroom_0.5.5.sh

Built with EasyBuild toolchains, then later RPATH info updated in executables.


LOG
---

    makeroom.sh -f -t NextGenMap -v 0.5.5 -w http://cibiv.github.io/NextGenMap/ -l "MIT" -L https://github.com/Cibiv/NextGenMap/blob/master/LICENSE -d "flexible highly sensitive short read mapping tool that handles much higher mismatch rates than comparable algorithms while still outperforming them in terms of runtime"
    ./makeroom_NextGenMap_0.5.5.sh
    source /sw/bioinfo/NextGenMap/SOURCEME_NextGenMap_0.5.5 && cd $SRCDIR
    wget https://github.com/Cibiv/NextGenMap/archive/refs/tags/v0.5.5.tar.gz

### snowy-gpu

Now build on a snowy gpu node first.

    cd $PREFIX
    rm -f snowy bianca
    mkdir snowy
    ln -s snowy bianca
    ssh s160
    cd /sw/EasyBuild/
    source source-me-for-EasyBuild-4.5.1-snowy-gpu
    cd $SRCDIR
    tar xf v0.5.5.tar.gz
    mv NextGenMap-0.5.5 NextGenMap-0.5.5_EB-snowy-gpu
    module load CMake/3.18.4-GCCcore-10.2.0
    module load fosscuda/2020b
    cd NextGenMap-0.5.5_EB-snowy-gpu
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX ..
    make
    make install

This doesn't ultimately install the tool.  We must handle that by hand.

    cd ../bin
    cp -av ngm-0.5.5 $PREFIX/bin

Check the path usage and use patchelf to fix it up.

    cd $PREFIX/bin
    ldd ngm-core
    ldd ngm-core-debug
    ldd ngm-utils
    ldd ngm-utils-debug
    module load patchelf/0.12-GCCcore-10.2.0
    patchelf --set-rpath /sw/EasyBuild/snowy-gpu/software/CUDAcore/11.1.1/lib:/sw/EasyBuild/snowy-gpu/software/GCCcore/10.2.0/lib64 ngm-core
    patchelf --set-rpath /sw/EasyBuild/snowy-gpu/software/CUDAcore/11.1.1/lib:/sw/EasyBuild/snowy-gpu/software/GCCcore/10.2.0/lib64 ngm-core-debug
    patchelf --set-rpath /sw/EasyBuild/snowy-gpu/software/GCCcore/10.2.0/lib64 ngm-utils
    patchelf --set-rpath /sw/EasyBuild/snowy-gpu/software/GCCcore/10.2.0/lib64 ngm-utils-debug



### rackham

Now build for rackham.


    source /sw/bioinfo/NextGenMap/SOURCEME_NextGenMap_0.5.5
    cd /sw/EasyBuild/
    source source-me-for-EasyBuild-4.5.1-rackham
    cd $SRCDIR
    tar xf v0.5.5.tar.gz
    mv NextGenMap-0.5.5 NextGenMap-0.5.5_EB-rackham
    module load CMake/3.18.4-GCCcore-10.2.0
    module load foss/2020b
    cd NextGenMap-0.5.5_EB-rackham
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX ..
    make
    make install
    cd ../bin
    cp -av ngm-0.5.5 $PREFIX/bin

Rackham does not have OpenCL active but does have system-installed OpenCL libraries, and these were linked into the executable.
Use patchelf to fix RPATH up.

    cd $PREFIX/bin
    module load patchelf/0.12-GCCcore-10.2.0
    patchelf --set-rpath /sw/EasyBuild/snowy-gpu/software/CUDAcore/11.1.1/lib:/sw/EasyBuild/snowy-gpu/software/GCCcore/10.2.0/lib64 ngm-core
    patchelf --set-rpath /sw/EasyBuild/snowy-gpu/software/CUDAcore/11.1.1/lib:/sw/EasyBuild/snowy-gpu/software/GCCcore/10.2.0/lib64 ngm-core-debug
    patchelf --set-rpath /sw/EasyBuild/snowy-gpu/software/GCCcore/10.2.0/lib64 ngm-utils
    patchelf --set-rpath /sw/EasyBuild/snowy-gpu/software/GCCcore/10.2.0/lib64 ngm-utils-debug


