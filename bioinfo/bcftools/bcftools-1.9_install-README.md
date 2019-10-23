bcftools/1.9
============

<http://www.htslib.org/doc/bcftools.html>

Used under license:
MIT/Expat or GPL v3

Structure creating script (makeroom_bcftools_1.9.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/bcftools/makeroom_1.9.sh


Holds the bcf/vcf commands which were in the old htslib. Associated with samtools and htslib.
<http://www.htslib.org/download/>


Simple installation with system version tools. Could be redone with newer compiler.
Note that the GSL option was not added due to complicated issues on Milou (related to ATLAS).
May try again later, if needed.


LOG
---

    TOOL=bcftools
    VERSION=1.9
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w http://www.htslib.org/doc/bcftools.html -l "MIT/Expat or GPL v3" -d "Tools for working with variant files"
    ./makeroom_bcftools_1.9.sh 

    source SOURCEME_bcftools_1.9 
    cd $VERSION/src
    [[ -f bcftools-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/bcftools/releases/download/${VERSION}/bcftools-${VERSION}.tar.bz2
    tar xjf bcftools-${VERSION}.tar.bz2
    cd bcftools-${VERSION}
    module load zlib/1.2.11
    ./configure --prefix=$PREFIX
    make -j 4
    make test
    make install

