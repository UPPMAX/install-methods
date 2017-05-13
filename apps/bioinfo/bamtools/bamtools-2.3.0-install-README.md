bamtools/2.3.0
==============

    git clone git://github.com/pezmaster31/bamtools.git
    cd bamtools
    rm -rf .git
    cmake --version
    mkdir build
    cd build
    cmake ..
    make
    cd ..

For building on rackham, just copy the tree and build with the default gcc.

    module load gcc/5.3.0
    cd /sw/apps/bioinfo/bamtools/2.3.0/
    cp -a milou rackham
    cd rackham
    rm -rf build
    mkdir build
    cd build
    cmake ..
    make
    cd ../..
    ln -s ./rackham irma
    ln -s ./rackham bianca
