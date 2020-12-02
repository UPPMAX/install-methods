MEMEsuite/5.0.1
===============

The MEME Suite: Motif-based sequence analysis tools


<http://meme-suite.org/tools/meme>


LOG
---

    TOOL=MEMEsuite
    VERSION=5.0.1
    cd /sw/bioinfo
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do test -L $CL || ln -sf $CLUSTER $CL ; done
    PREFIX=$PWD/rackham
    cd src/
    wget http://meme-suite.org/doc/download.html/
    module load gcc/9.2.0 openmpi/3.1.3  # these are available on all clusters
    module load perl/5.18.4 perl_modules/5.18.4
    module load python/2.7.15
    tar xzf meme_5.0.1_1.tar.gz 
    cd meme-5.0.1/
    ./configure --prefix=$PREFIX --with-url=http://meme-suite.org
    make
    make test
    make install

As Linus also found, 2 failed tests related to some diff with a .tsv table and .html.

