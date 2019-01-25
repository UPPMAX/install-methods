GLPK installation
=================



    VERSION=4.65
    mkdir /sw/libs/glpk/$VERSION
    cd /sw/libs/glpk/$VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in snowy bianca irma ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget http://ftp.gnu.org/gnu/glpk/glpk-$VERSION.tar.gz
    tar -xvzf glpk-$VERSION.tar.gz
    cd glpk-$VERSION
    ./configure --prefix=$PFX
    make check && make install

