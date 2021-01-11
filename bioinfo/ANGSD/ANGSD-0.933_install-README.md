ANGSD/0.933
===========

<https://github.com/ANGSD/angsd>

Used under license:

Structure creating script (makeroom_ANGSD_0.933.sh) moved to /sw/bioinfo/ANGSD/makeroom_0.933.sh

LOG
---

    TOOL=ANGSD
    VERSION=0.933
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t "$TOOL" -v "$VERSION" -w "https://github.com/ANGSD/angsd" -d "software for analyzing next generation sequencing data"
    ./makeroom_ANGSD_0.933.sh
    source SOURCEME_ANGSD_0.933
    cd $SRCDIR
    [[ -f ${VERSION}.tar.gz ]] || wget https://github.com/ANGSD/angsd/archive/${VERSION}.tar.gz
    rm -rf angsd-${VERSION}
    tar xzf ${VERSION}.tar.gz
    cd angsd-${VERSION}

    module load bzip2/1.0.6
    module load xz/5.2.2
    module load gcc/9.3.0
    module load zlib/1.2.11
    module load bioinfo-tools
    module load htslib/1.10

    make

    mkdir $PREFIX/bin
    cp angsd $PREFIX/bin/
    cp -rp R doc scripts $PREFIX/

Copy over executables from `misc/` directory, and fix python `#!` line.

    mkdir $PREFIX/misc
    find misc -type f -perm /1 -exec cp {} $PREFIX/misc/ \;
    sed -i 's,/usr/bin/python,/usr/bin/env python,' $PREFIX/misc/*.py

