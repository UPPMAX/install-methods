mrbayes/3.2.7a-gpu
========================

<https://github.com/NBISweden/MrBayes>

Used under license:
GPL v3 license
<>

Structure creating script (makeroom_mrbayes_3.2.7a-gpu.sh) moved to /sw/bioinfo/mrbayes/makeroom_3.2.7a-gpu.sh

LOG
---

    TOOL=mrbayes
    VERSION=3.2.7a-gpu
    CLUSTER=snowy
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/mrbayes/3.2.7a-gpu/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "mrbayes" -v "3.2.7a-gpu" -w "https://github.com/NBISweden/MrBayes" -c "bioinfo" -l "GPL v3 license" -d "A program for Bayesian inference and model choice across a wide range of phylogenetic and evolutionary models." -u "snowy" -x "INSTALL" -f
    ./makeroom_mrbayes_3.2.7a-gpu.sh
    
#---ONLY ON SNOWY!-----
    source SOURCEME_mrbayes_3.2.7a-gpu

    cd $SRCDIR
    ml git/2.28.0
    git clone --depth=1 https://github.com/NBISweden/MrBayes.git
    cd MrBayes
    mkdir -p build-$CLUSTER
    cd build-$CLUSTER
    
    ml bioinfo-tools
    ml beagle/3.1.2
    ml texlive/2019 
    source /sw/EasyBuild/source-me-for-EasyBuild-4.3.2-snowy
#important that the above source is done after the other ml:s. Otherwise the modules are not found
    ml fosscuda/2019b
    ../configure --with-beagle=$BEAGLE_ROOT --with-readline --without-mpi --prefix=$PREFIX
    make -j 10
    make install
    cd $PREFIX/bin
    ./mb

     


