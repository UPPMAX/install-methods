
    TOOL=/sw/apps/bioinfo/ANGSD
    VERS=0.915
    INST=$TOOL/$VERS/$CLUSTER
    mkdir -p $INST/{bin,misc}
    cd $TOOL/$VERS
    mkdir src
    cd src
    git clone https://github.com/samtools/htslib.git
    git clone https://github.com/ANGSD/angsd.git 
    module load gcc/4.9.2
    cd htslib
    make
    cd ../angsd
    make HTSSRC=../htslib
    cp angsd $INST/bin/
    cp -rp R doc scripts $INST/
    find misc -type f -perm +1 -exec cp {} $INST/misc/ \;

