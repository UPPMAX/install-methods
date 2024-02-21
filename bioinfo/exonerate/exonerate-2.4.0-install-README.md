exonerate/2.4.0
===============

<https://www.ebi.ac.uk/about/vertebrate-genomics/software/exonerate>


LOG
---

Do two builds, one parallel and one not.  Also, compile native code for snowy, rackham, miarka.

    VERSION=2.4.0
    cd /sw/bioinfo/exonerate/
    mkdir $VERSION
    cd $VERSION
    mkdir rackham snowy miarka
    ln -s snowy bianca
    PREFIX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget http://ftp.ebi.ac.uk/pub/software/vertebrategenomics/exonerate/exonerate-${VERSION}.tar.gz
    tar xzf exonerate-$VERSION.tar.gz 
    mv exonerate-$VERSION exonerate-${VERSION}_${CLUSTER}
    module load gcc/9.3.0
    module load glib/2.72.1
    CFLAGS=-march=native ./configure --prefix=$PREFIX --enable-pthreads --enable-utilities
    make && make check && make install

Do for all of snowy, rackham, miarka. Make bianca a symlink to rackham.
