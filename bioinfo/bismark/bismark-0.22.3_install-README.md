bismark/0.22.3
========================

<https://github.com/FelixKrueger/Bismark>

Used under license:
GPL v3


Structure creating script (makeroom_bismark_0.22.3.sh) moved to /sw/bioinfo/bismark/makeroom_0.22.3.sh

LOG
---


    VERSION=0.22.3
    TOOL=bismark
    makeroom.sh -f -t $TOOL -v $VERSION -c bioinfo -s misc -w https://github.com/FelixKrueger/Bismark -l 'GPL v3' -d 'Bismark is a program to map bisulfite treated sequencing reads to a genome of interest and perform methylation calls in a single step.'
    ./makeroom_bismark_${VERSION}.sh

    source SOURCEME_bismark_${VERSION}
    cd $SRCDIR
    wget https://github.com/FelixKrueger/Bismark/archive/refs/tags/${VERSION}.tar.gz
    tar xzf ${VERSION}.tar.gz
    rmdir $PREFIX
    mv Bismark-${VERSION} $PREFIX
