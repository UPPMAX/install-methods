BEDOPS/2.4.39
========================

<https://bedops.readthedocs.io>

Used under license:
GPL v2

Structure creating script (makeroom_BEDOPS_2.4.39.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/BEDOPS/makeroom_2.4.39.sh

LOG
---


Just download Linux x86_64 binaries.


    TOOL=BEDOPS
    VERSION=2.4.39
    /home/douglas/bin/makeroom.sh -f" -t "${TOOL}" -v "${VERSION}" -w "https://bedops.readthedocs.io" -l "GPL v2" -d "suite of tools to address common questions raised in genomic studies"
    ./makeroom_${TOOL}_$(VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    cd $VERSIONDIR
    cd src

    wget https://github.com/bedops/bedops/releases/download/v${VERSION}/bedops_linux_x86_64-v${VERSION}.tar.bz2
    tar xvjf bedops_linux_x86_64-v${VERSION}.tar.bz2
    mv bin $PREFIX/

