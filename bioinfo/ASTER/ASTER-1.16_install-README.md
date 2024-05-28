ASTER/1.16
========================

<https://github.com/chaoszhang/ASTER>

Used under license:
GNU AFFERO GENERAL PUBLIC LICENSE v3
<https://github.com/chaoszhang/ASTER?tab=AGPL-3.0-1-ov-file#readme>

Structure creating script (makeroom_ASTER_1.16.sh) moved to /sw/bioinfo/ASTER/makeroom_1.16.sh

LOG
---

This builds with `-march=native` so we need separate rackham/bianca/miarka and snowy versions.

    makeroom.sh -t ASTER -v 1.16 -c bioinfo -s phylogeny -w https://github.com/chaoszhang/ASTER -d 'Accurate Species Tree EstimatoR series: a family of optimation algorithms for species tree inference implemented in C++ (including ASTRAL-Pro & Weighted ASTRAL)' -l "GNU AFFERO GENERAL PUBLIC LICENSE v3" -L 'https://github.com/chaoszhang/ASTER?tab=AGPL-3.0-1-ov-file#readme'
    ./makeroom_ASTER_1.16.sh 
    source /sw/bioinfo/ASTER/SOURCEME_ASTER_1.16
    cd $SRCDIR
    wget https://github.com/chaoszhang/ASTER/archive/refs/tags/v1.16.tar.gz
    ll $VERSIONDIR
    rm $VERSIONDIR/snowy
    mkdir $VERSIONDIR/snowy
    ll $VERSIONDIR

Build on rackham.

    module load gcc/13.2.0

    cd $SRCDIR
    [[ -d ASTER-$VERSION ]] || tar xf v1.16.tar.gz 
    cd ASTER-1.16/
    make clean
    make
    cp -av bin $PREFIX/
    make clean

Now build on snowy.

    interactive -M snowy -n 1 -t 15:00 --qos=short -A staff

We reload our SOURCEME to get PREFIX to be cluster-specific.

    source /sw/bioinfo/ASTER/SOURCEME_ASTER_1.16

    module load gcc/13.2.0

    cd $SRCDIR
    [[ -d ASTER-$VERSION ]] || tar xf v1.16.tar.gz 
    cd ASTER-1.16/
    make clean
    make
    cp -av bin $PREFIX/
    make clean

The mf file needs just $modroot/bin added to PATH.
