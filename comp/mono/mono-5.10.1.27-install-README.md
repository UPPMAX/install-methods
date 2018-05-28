mono/5.10.1.27
============


    VERSION=5.10.1.27
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir -p /sw/comp/mono
    cd /sw/comp/mono
    mkdir $VERSION
    cd $VERSION
    [[ "$CLUSTER" == "milou" ]] && { echo "cannot build on milou"; return; }
    [[ "$CLUSTER" == "rackham" ]] && for C in bianca irma ; do ln -s $CLUSTER $C; done
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget https://download.mono-project.com/sources/mono/mono-${VERSION}.tar.bz2
    tar xjf mono-${VERSION}.tar.bz2 
    cd mono-${VERSION}
    module load gcc/4.9.4
    ./configure --prefix=$PFX
    make -j8
    make install
