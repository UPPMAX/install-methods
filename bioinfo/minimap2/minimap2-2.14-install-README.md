#minimap2/2.4
# Uses pre-compiled binaries
#============

#<https://github.com/lh3/minimap2>


#LOG
#---

    TOOL=/sw/apps/bioinfo/minimap2
    VERSION=2.14
    CLUSTER=$PCLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir src
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    mkdir -p bin man/man1
    cd ../src
    [[ -f minimap2-${VERSION}.tar.bz2 ]] || wget https://github.com/lh3/minimap2/releases/download/v${VERSION}/minimap2-${VERSION}_x64-linux.tar.bz2
    tar xjf minimap2-${VERSION}_x64-linux.tar.bz2
    cd minimap2-${VERSION}_x64-linux
    cp -av minimap2 $PFX/bin/
    cp -av minimap2.1 $PFX/man/man1/
    cd ..
    rm -rf minimap2-${VERSION}

