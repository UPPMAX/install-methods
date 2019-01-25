Kraken/1.0
==========

    TOOL=/sw/apps/bioinfo/Kraken
    VERSION=1.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir -p $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f kraken-${VERSION}.tgz ]] || wget https://ccb.jhu.edu/software/kraken/dl/kraken-${VERSION}.tgz
    rm -rf kraken-$VERSION
    tar xzf kraken-${VERSION}.tgz 
    cd kraken-$VERSION
    module load gcc/6.3.0
    ./install_kraken.sh $PFX
    cd ..
    rm -rf kraken-$VERSION


New developments
----------------

Kraken build doesn't work at the moment (2017/11/03), it dies trying to download the viral sequences.

