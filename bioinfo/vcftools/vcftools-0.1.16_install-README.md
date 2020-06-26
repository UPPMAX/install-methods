vcftools/0.1.16
========================

<https://github.com/vcftools/vcftools>

Used under license:
GPL v3

Structure creating script (makeroom_vcftools_0.1.16.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/vcftools/makeroom_0.1.16.sh

LOG
---

    TOOL=vcftools
    VERSION=0.1.16
    /home/douglas/bin/makeroom.sh -f" -t "${TOOL}" -v "${VERSION}" -w "https://github.com/vcftools/vcftools" -l "GPL v3" -d "set of tools written in Perl and C++ for working with VCF files"
    ./makeroom_${TOOL}_${VERSION}.sh

    cd /sw/bioinfo/$TOOL
    source SOURCEME_${TOOL}_${VERSION}

    cd $VERSIONDIR
    cd src
    [[ -f vcftools-${VERSION}.tar.gz ]] || wget https://github.com/vcftools/vcftools/releases/download/v${VERSION}/vcftools-${VERSION}.tar.gz
    tar xzf vcftools-${VERSION}.tar.gz 
    cd vcftools-${VERSION}
    module load zlib/1.2.11
    module load gcc/6.4.0
    ./configure --prefix=$PREFIX
    make -j5
    make install

