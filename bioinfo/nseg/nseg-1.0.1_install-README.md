nseg/1.0.1
========================

<ftp://ftp.ncbi.nih.gov/pub/seg/nseg>

Using the versioned source updated for modern compilers from

<https://github.com/jebrosen/nseg>

Used under license:
Public Domain

Structure creating script (makeroom_nseg_1.0.1.sh) moved to /sw/bioinfo/nseg/makeroom_1.0.1.sh

LOG
---

    TOOL=nseg
    VERSION=1.0.1
    cd /sw/bioinfo/
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w ftp://ftp.ncbi.nih.gov/pub/seg/nseg -l "Public Domain" -d "identifies and masks regions of low complexity in nucleic acid sequences" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/src/
    wget https://github.com/jebrosen/nseg/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz
    cd ${TOOL}-${VERSION}/
    make
    mv nmerge nseg $PREFIX
