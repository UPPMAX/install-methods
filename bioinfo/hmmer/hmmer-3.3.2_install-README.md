hmmer/3.3.2
========================

<http://hmmer.org>

Used under license:
GPL


Structure creating script (makeroom_hmmer_3.3.2.sh) moved to /sw/bioinfo/hmmer/makeroom_3.3.2.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -t "hmmer" -v "3.3.2" -w "http://hmmer.org" -l "GPL" -d "HMMER is used for searching sequence databases for sequence homologs\, and for making sequence alignments. It implements methods using probabilistic models called profile hidden Markov models \(profile HMMs\)."
    ./makeroom_hmmer_3.3.2.sh

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
