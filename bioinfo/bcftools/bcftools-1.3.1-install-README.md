# bcftools-1.3.1-install-README.md

bcftools
========

Holds the bcf/vcf commands which were in the old htslib. Associated with samtools and htslib.
<http://www.htslib.org/download/>


Simple installation with system version tools. Could be redone with newer compiler.
Note that the GSL option was not added due to complicated issues on Milou (related to ATLAS).
May try again later, if needed.


Installation
------------
    VERS=1.3.1
    TOOL=/sw/apps/bioinfo/bcftools
    mkdir -p $TOOL/$VERS/src
    cd $TOOL/$VERS/src

    _# if not already present_
    wget https://github.com/samtools/bcftools/releases/download/$VERS/bcftools-$VERS.tar.bz2

    _# for each cluster:_
    _# if already unpacked, could try "make clean" or just delete the old copy_
    tar xjf bcftools-$VERS.tar.bz2
    mkdir ../$CLUSTER
    cd bcftools-$VERS
    make
    make prefix=$tools/$VERS/$CLUSTER install
    

