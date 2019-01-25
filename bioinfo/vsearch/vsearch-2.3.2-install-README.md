vsearch 2.3.2
=============

Open-source replacement for usearch.

<https://github.com/torognes/vsearch>

LOG
---

    cd /sw/apps/bioinfo/
    mkdir vsearch
    cd vsearch/
    VERSION=2.3.2
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    P=$PWD  # getting prefix directory
    cd ../src_$CLUSTER
    wget https://github.com/torognes/vsearch/archive/v${VERSION}.tar.gz
    tar xvzf v${VERSION}.tar.gz
    cd vsearch-$VERSION
    module load gcc/6.2.0
    module load build-tools 
    ./autogen.sh 
    module load zlib/1.2.8
    module load bzip2/1.0.6
    ./configure --prefix=$P
    make
    make install
    cd $P/bin
    module unload gcc zlib bzip2
    ldd vsearch 

For mf file, borrow from phast and make sure `$modroot/share/man` is added to
`MANPATH`.  The doc pdf us in the tree but we leave that to the users to find.
