bismark/0.24.1
==============

<https://github.com/FelixKrueger/Bismark>

Used under license:
GPL v3


Structure creating script (makeroom_bismark_0.24.1.sh) moved to /sw/bioinfo/bismark/makeroom_0.24.1.sh

LOG
---

    VERSION=0.24.1
    TOOL=bismark
    makeroom.sh -f -t $TOOL -v $VERSION  -c bioinfo -s misc -w https://github.com/FelixKrueger/Bismark -l 'GPL v3' -d 'Bismark is a program to map bisulfite treated sequencing reads to a genome of interest and perform methylation calls in a single step.'
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    wget https://github.com/FelixKrueger/Bismark/archive/refs/tags/${VERSION}.tar.gz
    tar xf ${VERSION}.tar.gz 
    rmdir $PREFIX
    mv Bismark-${VERSION} $PREFIX
