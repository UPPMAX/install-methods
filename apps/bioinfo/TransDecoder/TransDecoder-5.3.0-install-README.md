#TransDecoder/5.3.0
#==================

#<http://transdecoder.github.io/>

#LOG

    VERSION=5.3.0
    CLUSTER=${CLUSTER:?CCLUSTER must be set}
    TOOL=/sw/apps/bioinfo/TransDecoder
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir src
    cd src/
    wget https://github.com/TransDecoder/TransDecoder/archive/TransDecoder-v${VERSION}.tar.gz
    tar xzf TransDecoder-v${VERSION}.tar.gz 
    mv TransDecoder-TransDecoder-v${VERSION} ../$CLUSTER
    cd ../$CLUSTER
    module load perl/5.24.1
    module load perl_modules/5.24.1
    module load bioinfo-tools blast/2.7.1+
    module load hmmer/3.2.1
    make
    make test
