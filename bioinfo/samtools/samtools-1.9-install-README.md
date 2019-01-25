samtools 1.9
============

    VERSION=1.9
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    OTHERCLUSTERS="irma bianca snowy"
    cd /sw/apps/bioinfo/samtools/
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f samtools-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/samtools/releases/download/${VERSION}/samtools-${VERSION}.tar.bz2

    tar xjf samtools-${VERSION}.tar.bz2 
    mv samtools-${VERSION} samtools-${VERSION}-${CLUSTER}
    cd samtools-${VERSION}-${CLUSTER}/

    [[ "$(uname -n | cut -f1 -d'.')" == "milou-b" ]] && module load libcurl/7.45.0

    module load zlib/1.2.11
    ./configure --prefix=$PFX
    make
    make test
    make install
    
    cd ..
    rm -rf samtools-${VERSION}-${CLUSTER}/

    cd /sw/apps/bioinfo/samtools/$VERSION
    for C in $OTHERCLUSTERS; do
       ln -fs $CLUSTER $C
    done
