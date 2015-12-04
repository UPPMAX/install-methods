
    VERSION=150803
    cd /sw/apps/bioinfo
    mkdir -p prank
    cd prank
    mkdir $VERSION
    cd $VERSION
    VERSIONDIR=$PWD
    mkdir -p milou src

Make BppAncestor.  These steps take a while, and can be performed by running
the **build-cpp.sh** script, which should be updated with the prank version
prior to running.

    cd milou
    PREFIX=$PWD
    cd ../src
    mkdir bppsuite
    cd bppsuite
    git clone http://biopp.univ-montp2.fr/git/bpp-core
    git clone http://biopp.univ-montp2.fr/git/bpp-seq
    git clone http://biopp.univ-montp2.fr/git/bpp-phyl
    git clone http://biopp.univ-montp2.fr/git/bpp-popgen
    git clone http://biopp.univ-montp2.fr/git/bppsuite

    module load build-tools cmake/2.8.12.2 gcc/4.9.2 doxygen/1.8.9.1

    cd bpp-core
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_LIBRARY_PATH=$PREFIX/lib -DCMAKE_INCLUDE_PATH=$PREFIX/include -D BUILD_TESTING=FALSE -DCMAKE_EXE_LINKER_FLAGS=-static ./
    make && make install
    cd ../bpp-seq/
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_LIBRARY_PATH=$PREFIX/lib -DCMAKE_INCLUDE_PATH=$PREFIX/include -D BUILD_TESTING=FALSE -DCMAKE_EXE_LINKER_FLAGS=-static ./
    make && make install
    cd ../bpp-phyl/
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_LIBRARY_PATH=$PREFIX/lib -DCMAKE_INCLUDE_PATH=$PREFIX/include -D BUILD_TESTING=FALSE -DCMAKE_EXE_LINKER_FLAGS=-static ./
    make && make install
    cd ../bpp-popgen/
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_LIBRARY_PATH=$PREFIX/lib -DCMAKE_INCLUDE_PATH=$PREFIX/include -D BUILD_TESTING=FALSE -DCMAKE_EXE_LINKER_FLAGS=-static ./
    make && make install
    cd ../bppsuite/
    cmake . -DCMAKE_PREFIX_PATH=$PREFIX -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_EXE_LINKER_FLAGS=-static -DBUILD_STATIC=true
    make && make install

This creates milou/{bin,lib,share,include}.  We need bin (for executables) and
share (for man pages).

Now to build prank itself and copy the executable and man page into directories
already created by the bppancestor build above.

    cd $VERSIONDIR/src
    wget http://wasabiapp.org/download/prank/prank.source.$VERSION.tgz
    tar xzf prank.source.$VERSION.tgz 
    cd prank-msa/src
    module load gcc/4.9.2
    make
    cp prank $VERSIONDIR/milou/bin
    cp prank.1 $VERSIONDIR/milou/share/man/man1

Make sure the mf file adds

    prepend-path  MANPATH    /sw/apps/bioinfo/prank/150803/milou/share/man
    prepend-path  PATH       /sw/apps/bioinfo/prank/150803/milou/bin

and also loads exonerate and MAFFT.

    module load exonerate/2.2.0
    module load MAFFT/7.245

