SHAPEIT/v3.r884.2
=================

LOG
---

Download dropbox'd zip file from desktop to src directory.

    cd /sw/bioinfo/SHAPEIT
    mkdir v3.r884.2 
    cd v3.r884.2 
    mkdir -p rackham
    PREFIX=$PWD/rackham
    for CL in snowy irma bianca ; do test -L $CL || ln -sf rackham $CL; done
    mkdir src
    cd src
    rsync -Pa douglasscofield@fb166.ebc.uu.se:Downloads/shapeit3.zip .
    unzip shapeit3.zip

Checking the executable shows that it expects to find some boost 1.60.0 libraries.

    ldd shapeit3.r884.2 

We do not have boost 1.60.0 installed, so I built it with gcc/5.3.0.  See
/sw/libs/boost/boost-1.60.0_gcc5.3.0-install-README.md.  Update the RPATH
information in the executable to find these libraries.

    module load patchelf
    patchelf --print-rpath shapeit3.r884.2 
    patchelf --set-rpath /sw/libs/boost/1.60.0_gcc5.3.0/rackham/lib:/sw/comp/gcc/5.3.0_rackham/lib64  shapeit3.r884.2 

Now move files into place and symlink shapeit

    cp -av LICENCE example $PREFIX
    mkdir -p $PREFIX/bin
    cp -av shapeit3.r884.2 $PREFIX/bin
    cd $PREFIX/bin
    chmod +x shapeit3.r884.2
    ln -s shapeit3.r884.2 shapeit3
    ln -s shapeit3.r884.2 shapeit

    cd /sw/bioinfo/SHAPEIT

    fixup .

