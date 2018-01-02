cramtools/3.0
=============

LOG
---

    TOOL=/sw/apps/bioinfo/cramtools
    VERSION=3.0
    mkdir -p $TOOL
    cd $TOOL
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir src
    cd src
    wget https://github.com/enasequence/cramtools/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    mv cramtools-${VERSION} ../rackham
    cd ../rackham/
    ln -s cramtools-${VERSION}.jar cram.jar
    cd ..
    for C in milou irma bianca ; do ln -s rackham $C; done

