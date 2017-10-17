TransDecoder/5.0.1
==================

<http://transdecoder.github.io/>

LOG

    VERSION=5.0.1
    CLUSTER=${CLUSTER:?CCLUSTER must be set}
    TOOL=/sw/apps/bioinfo/TransDecoder
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir src
    cd src/
    wget https://github.com/TransDecoder/TransDecoder/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    mv TransDecoder-${VERSION} ../$CLUSTER
    cd ../$CLUSTER
    module load perl/5.24.1
    module load perl_modules/5.24.1
    make
    make test
