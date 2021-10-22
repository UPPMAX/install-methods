canu/2.2
========================

<http://canu.readthedocs.org/>

Used under license:
Various


Structure creating script (makeroom_canu_2.2.sh) moved to /sw/bioinfo/canu/makeroom_2.2.sh

LOG
---

    TOOL=canu
    VERSION=2.2
    cd /sw/bioinfo/$TOOL

    makeroom.sh -f -t $TOOL -v $VERSION -w "http://canu.readthedocs.org/" -l "Various" -d "a fork of the Celera Assembler\, designed for high-noise single-molecule sequencing \(such as the PacBio RS II/Sequel or Oxford Nanopore MinION\)"
    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}
    cd $SRCDIR

    module load git/2.28.0

    git clone https://github.com/marbl/canu.git
    cd canu
    git reset --hard af9c6e7
    cd src/
    module load gcc/9.3.0
    module load zlib/1.2.11
    make 
    cd ..
    mv bin/ lib/ obj/ share/ $PREFIX/.


Now, add a line to `canu.defaults` so that a grid engine won't be used by default.

    vi $PREFIX/bin/canu.defaults

Add the line

    useGrid=false


