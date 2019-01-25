anfo/0.98
=========

<https://bioinf.eva.mpg.de/anfo/>

An old tool built for kalkyl that never worked for milou because of broken
RPATH information.

Efforts to rebuild from scratch did not go smoothly, perhaps because of old
versions of compilers, so to save time I have decided to update the RPATH info
within the anfo/0.98 executables already built for kalkyl.  Elk and protobuf
were placed in a personal directory owned by the person who built these several
years ago, so rebuild and install both here.

Just found a newer source tree at <https://github.com/mpieva/anfo> that might
solve some of the build problems, but unless this is requested I will not
install it.

**NOTE** parallel makes don't work for these.

LOG
---

    cd /sw/apps/bioinfo/anfo
    mkdir -p 0.98/milou
    cd 0.98/milou
    PFX=$PWD
    cd ../..
    cd 0.98_kalkyl
    mv * $PFX/
    cd ..
    rmdir 0.98_kalkyl

Set up and install the protobuf and elk requirements.

    cd $PFX/..
    mkdir src
    cd src/

    wget https://bioinf.eva.mpg.de/anfo/protobuf-2.2.0a.tar.bz2
    tar xjf protobuf-2.2.0a.tar.bz2 
    cd protobuf-2.2.0a/
    ./configure --prefix=$PFX
    make
    make install
    cd ..

    wget https://bioinf.eva.mpg.de/anfo/elk-3.99.7.tar.bz2
    tar xjf elk-3.99.7.tar.bz2 
    cd elk-3.99.7/
    ./configure --prefix=$PFX
    make
    make install
    cd ..

Adjust the RPATH info for the already-built executables.  The path to add to
RPATH is `$PFX/lib`.

    cd $PFX/lib
    module load patchelf/0.8
    patchelf --print-rpath libanfo.so.0.0.0
    patchelf --set-rpath /sw/comp/gcc/4.4.4/lib/../lib64:$PFX/lib libanfo.so.0.0.0
    ldd libanfo.so.0.0.0
    cd ../bin/
    patchelf --print-rpath anfo
    patchelf --set-rpath /sw/comp/gcc/4.4.4/lib/../lib64:$PFX/lib anfo
    patchelf --set-rpath /sw/comp/gcc/4.4.4/lib/../lib64:$PFX/lib anfo-tool 
    patchelf --set-rpath /sw/comp/gcc/4.4.4/lib/../lib64:$PFX/lib dnaindex 
    patchelf --set-rpath /sw/comp/gcc/4.4.4/lib/../lib64:$PFX/lib elk
    patchelf --set-rpath /sw/comp/gcc/4.4.4/lib/../lib64:$PFX/lib fa2dna 
    patchelf --set-rpath /sw/comp/gcc/4.4.4/lib/../lib64:$PFX/lib protoc 
    ldd anfo anfo-tool dnaindex elk fa2dna protoc 
    ./anfo

