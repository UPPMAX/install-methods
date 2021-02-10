mrbayes/3.2.7a-mpi
========================

<https://github.com/NBISweden/MrBayes>

Used under license:
GPL v3 license
<>

Structure creating script (makeroom_mrbayes_3.2.7a-mpi.sh) moved to /sw/bioinfo/mrbayes/makeroom_3.2.7a-mpi.sh

LOG
---

    TOOL=mrbayes
    VERSION=3.2.7a-mpi
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/mrbayes/3.2.7a-mpi/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "mrbayes" -v "3.2.7a-mpi" -w "https://github.com/NBISweden/MrBayes" -c "bioinfo" -l "GPL v3 license" -d "A program for Bayesian inference and model choice across a wide range of phylogenetic and evolutionary models." -x "INSTALL" -f
    ./makeroom_mrbayes_3.2.7a-mpi.sh
    source SOURCEME_mrbayes_3.2.7a-mpi

    cd $VERSIONDIR
    rm -rf snowy bianca irma
    mkdir snowy
    ln -s snowy bianca
    ln -s snowy irma

    cd $SRCDIR
    ml git/2.28.0
    git clone --depth=1 https://github.com/NBISweden/MrBayes.git
    ml gcc/8.3.0

    ml bioinfo-tools
    ml beagle/3.1.2
    ml texlive/2019
    ml openmpi/3.1.3
    cd MrBayes

    mkdir -p build-$CLUSTER
    cd build-$CLUSTER
    export CPATH=$MPI_ROOT/include:$CPATH
    export LIBRARY_PATH=$MPI_ROOT/lib:$LIBRARY_PATH

    MPICC=$(which mpicc)
    ../configure --with-beagle=$BEAGLE_ROOT --with-readline --with-mpi=$(with mpicc) --prefix=$PREFIX
    make -j 10
    make install
    cd $PREFIX/bin
    ./mb

#----- other installation from snowy-----
# start here:
    source SOURCEME_mrbayes_3.2.7a-mpi
    cd $SRCDIR
# then continue as above from     ml bioinfo-tools
# until     cd build-$CLUSTER   then
    source /sw/EasyBuild/source-me-for-EasyBuild-4.3.2-snowy
 #important that the above source is done after the other ml:s. Otherwise the modules are not found
    ml fosscuda/2019b
# then continue from ../configure ...

