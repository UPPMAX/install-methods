infernal/1.1.2
==============

Following build instructions in <http://eddylab.org/infernal/Userguide.pdf>,
but it does not mention installing the easel (`esl-*`) executables so install
those too.

Not buildling MPI-enabled versions; for that, do `./configure --enable-mpi ...`.

LOG
---

    VERSION=1.1.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/infernal/
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ..
    mkdir src
    cd src
    [[ -f infernal-${VERSION}.tar.gz ]] || wget http://eddylab.org/infernal/infernal-${VERSION}.tar.gz
    tar xzf infernal-${VERSION}.tar.gz 
    cd infernal-${VERSION}/
    module load gcc/6.3.0
    ./configure --prefix=$PFX
    make -j8
    make check
    make install
    cd easel/
    make install
    cd ../..
    rm -rf infernal-${VERSION}

