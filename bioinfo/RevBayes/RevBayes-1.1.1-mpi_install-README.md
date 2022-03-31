RevBayes/1.1.1-mpi
========================

<https://github.com/revbayes/revbayes>

Used under license:
GNU General Public License v3.0


Structure creating script (makeroom_RevBayes_1.1.1-mpi.sh) moved to /sw/bioinfo/RevBayes/makeroom_1.1.1-mpi.sh

LOG
---

    TOOL=RevBayes
    VERSION=1.1.1-mpi

    makeroom.sh -t $TOOL -v $VERSION -w "https://github.com/revbayes/revbayes" -c "bioinfo" -l "GNU General Public License v3.0" -d "Bayesian phylogenetic inference using probabilistic graphical models and an interactive language." -s "phylogeny" -f

    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR

    wget https://github.com/revbayes/revbayes/archive/refs/tags/1.1.1.tar.gz
    tar xvf 1.1.1.tar.gz
    cd revbayes-1.1.1/projects/cmake/

    ml boost/1.78.0_gcc11.2.0_mpi4.1.2
    ml gcc/11.2.0
    ml openmpi/4.1.2
    ml  cmake/3.22.2

    ./build.sh -mpi true  -DCMAKE_INSTALL_PREFIX=$PREFIX
     
    mkdir $PREFIX/bin
    mv rb-mpi $PREFIX/bin
