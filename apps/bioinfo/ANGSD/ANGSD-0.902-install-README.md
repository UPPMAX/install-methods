
    TOOL=/sw/apps/bioinfo/ANGSD/
    cd $TOOL
    VERSION=0.902
    mkdir $VERSION
    CLUSTER=milou
    mkdir $CLUSTER src
    cd src/
    git clone https://github.com/samtools/htslib.git
    git clone https://github.com/ANGSD/angsd.git 
    cd angsd/
    module load gcc/4.9.2
    make
    cp angsd ../../milou
    cp -avp R ../../milou
    cd misc
    cp NGSadmix contamination contamination2 emOptim2 msToGlf printIcounts realSFS smartCount splitgl supersim thetaStat ../../../milou/

