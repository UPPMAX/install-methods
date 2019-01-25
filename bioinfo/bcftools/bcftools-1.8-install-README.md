bcftools 1.8
============

Holds the bcf/vcf commands which were in the old htslib. Associated with samtools and htslib.
<http://www.htslib.org/download/>


Simple installation with system version tools. Could be redone with newer compiler.
Note that the GSL option was not added due to complicated issues on Milou (related to ATLAS).
May try again later, if needed.


LOG
---

    VERSION=1.8
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

    module load zlib/1.2.11

    ./configure --prefix=$PFX
    make -j 4
    make test
    make install

    cd ..
    rm -rf bcftools-${VERSION}-${CLUSTER}
    cd ..
    cd ../mf
    ln -s 1.6 1.8
    cd ../1.8
    ln -s rackham irma
    ln -s rackham bianca
    cd ..
    cd /sw/apps/bioinfo
   rsync -n --del -Pa bcftools /mnt/sw/apps/bioinfo/
rsync --del -Pa bcftools /mnt/sw/apps/bioinfo/
cp -av ${VERSION} /sw/mf/common/bioinfo-tools/misc/bcftools/
