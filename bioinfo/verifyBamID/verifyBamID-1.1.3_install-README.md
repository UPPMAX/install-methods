verifyBamID/1.1.3
=================

<https://github.com/statgen/verifyBamID>

Used under license:
GPL v3 and other open-source 'as is'

Structure creating script (makeroom_verifyBamID_1.1.3.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/verifyBamID/makeroom_1.1.3.sh

LOG
---

    TOOL=verifyBamID
    VERSION=1.1.3
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/statgen/verifyBamID -d "verifies whether the reads in particular file match previously known genotypes for an individual (or group of individuals), and checks whether the reads are contaminated as a mixture of two samples" -l "GPL v3 and other open-source 'as is'"
    ./makeroom_verifyBamID_${VERSION}.sh 
    source SOURCEME_verifyBamID_${VERSION} 

    cd $VERSIONDIR
    cd src
    wget https://github.com/statgen/verifyBamID/releases/download/v${VERSION}/verifyBamID
    file verifyBamID 
    chmod +x verifyBamID 
    ldd verifyBamID 
    cp -av verifyBamID $PREFIX/

