bcftools 1.5
============

Holds the bcf/vcf commands which were in the old htslib. Associated with samtools and htslib.
<http://www.htslib.org/download/>


Simple installation with system version tools. Could be redone with newer compiler.
Note that the GSL option was not added due to complicated issues on Milou (related to ATLAS).
May try again later, if needed.


LOG
---

    VERSION=1.5
    CLUSTER+${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/bcftools
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f bcftools-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/bcftools/releases/download/${VERSION}/bcftools-${VERSION}.tar.bz2
    tar xjf bcftools-${VERSION}.tar.bz2
    mv bcftools-${VERSION} bcftools-${VERSION}-${CLUSTER}
    cd bcftools-${VERSION}-${CLUSTER}

For `htslib/1.5`and `samtools/1.5` there is a full configure and `make test`
available, and `bcftools/1.5` now has the same.

    module load zlib/1.2.11

    ./configure --prefix=$PFX
    make -j 4
    make test
    make install

