MakeHub/1.0.5-20200210-1ecd6bb
==============================

<https://github.com/Gaius-Augustus/MakeHub>

Used under license:
GPL v3

Structure creating script (makeroom_MakeHub_1.0.5-20200210-1ecd6bb.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/MakeHub/makeroom_1.0.5-20200210-1ecd6bb.sh

LOG
---

    TOOL=MakeHub
    TOOLVERSION=1.0.8
    COMMIT=31cc299
    COMMITDATE=20240217
    VERSION=$TOOLVERSION-$COMMITDATE-$COMMIT
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    makeroom.sh -f -s "annotation" -t "MakeHub" -v "$VERSION" -w "https://github.com/Gaius-Augustus/MakeHub" -l "GPL v3" -d "Fully automated generation of UCSC assembly hubs"
    ./makeroom_MakeHub_${VERSION}.sh
    source /sw/bioinfo/MakeHub/SOURCEME_MakeHub_${VERSION}
    cd $SRCDIR
    ml git/2.34.1
    git clone https://github.com/Gaius-Augustus/MakeHub
    rmdir $PREFIX
    mv MakeHub $PREFIX
    cd $PREFIX
    git reset --hard $COMMIT
    ml -git
    ml bioinfo-tools
    ml augustus/3.5.0-20231223-33fc04d
    ln -s $(which bam2wig) .
    ml -augustus

Now install virtualenv and biopython in it.

    cd $PREFIX
    ml python/3.11.8
    virtualenv venv
    source venv/bin/activate
    which pip3
    which python3
    ml -python

We will install biopython. Any others?

    grep import *.py

Nope, just biopython.

    pip3 install biopython

Now reset the python in the local scripts to be our venv python.

    head *.py
    sed -i -e '1i#!'"$(which python3)" *.py
    head *.py

In the mf file, load samtools/1.19 and ucsc-utilities/v421

We don't load augustus/3.5.0-20231223-33fc04d, rather the symlink created above gives us access to its `bam2wig`.

