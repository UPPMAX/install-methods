
    VERSION=3.2.1
    MODULE_VERSION=${VERSION}-intel
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/hmmer/
    mkdir -p $MODULE_VERSION
    cd $MODULE_VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f hmmer-${VERSION}.tar.gz ]] || wget http://eddylab.org/software/hmmer/hmmer-${VERSION}.tar.gz
    if [[ ! -d hmmer-${VERSION}_${CLUSTER} ]] ; then
        tar xzf hmmer-${VERSION}.tar.gz
        mv hmmer-${VERSION} hmmer-${VERSION}_${CLUSTER}
    fi
    cd hmmer-${VERSION}_${CLUSTER}
    make distclean

    module load intel/18.3 intelmpi/18.3
    ./configure --prefix=$PFX --enable-mpi
    make -j8
    make install
    cd easel
    make install

   cd /sw/apps/bioinfo/hmmer/$VERSION
   for c in $OTHERCLUSTERS; do
     ln -fs $CLUSTER $c
   done
