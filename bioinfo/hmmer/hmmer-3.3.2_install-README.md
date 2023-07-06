hmmer/3.3.2
========================

<http://>

Used under license:



Structure creating script (makeroom_hmmer_3.3.2.sh) moved to /sw/bioinfo/hmmer/makeroom_3.3.2.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "hmmer" "-v" "3.3.2" "-f"
    ./makeroom_hmmer_3.3.2.sh
    
    # Load modules
    module load gcc/12.3.0

    # Download
    cd $SRCDIR
    wget http://eddylab.org/software/hmmer/hmmer-${VERSION}.tar.gz
    tar xfvz hmmer-${VERSION}.tar.gz --strip-components=1

    # Install
    ./configure --prefix=$PREFIX 
    make -j 10
    make check
    make install

    # Test
    #I did the tutorial in http://eddylab.org/software/hmmer/Userguide.pdf. No problems on snowy either.
    cd $SRCDIR/tutorial








    VERSION=3.2.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/hmmer/
    mkdir -p $VERSION
    cd $VERSION
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

    module load gcc/8.2.0 module load openmpi/3.1.1
    ./configure --prefix=$PFX --enable-mpi
    make -j8
    make install
    cd easel
    make install

   cd /sw/apps/bioinfo/hmmer/$VERSION
   for c in $OTHERCLUSTERS; do
     ln -fs $CLUSTER $c
   done
