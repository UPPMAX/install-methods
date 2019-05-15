exonerate/2.4.0
===============

<https://www.ebi.ac.uk/about/vertebrate-genomics/software/exonerate>


LOG
---

Do not do a parallel build (`make -j10 ...`).  It won't work.

    VERSION=2.4.0
    cd /sw/bioinfo/exonerate/
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget http://ftp.ebi.ac.uk/pub/software/vertebrategenomics/exonerate/exonerate-${VERSION}.tar.gz
    tar xzf exonerate-$VERSION.tar.gz 
    cd exonerate-$VERSION
    module load gcc/4.9.4
    ./configure --prefix=$PFX --enable-pthreads --enable-utilities
    make && make install

