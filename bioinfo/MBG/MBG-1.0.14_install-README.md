MBG/1.0.14
==========

<https://github.com/maickrau/MBG>

Used under license:
MIT


Structure creating script (makeroom_MBG_1.0.14.sh) moved to /sw/bioinfo/MBG/makeroom_1.0.14.sh

LOG
---

    makeroom.sh -c bioinfo -s assembly -t MBG -v 1.0.14 -w https://github.com/maickrau/MBG -l "MIT" -d "Minimizer based sparse de Bruijn Graph constructor" -k "de-Bruijn-graph PacBio Oxford-Nanopore long-read"
    ./makeroom_MBG_1.0.14.sh 
    source /sw/bioinfo/MBG/SOURCEME_MBG_1.0.14
    cd $SRCDIR

    ml git/2.34.1
    ml zlib/1.2.12
    ml gcc/10.3.0

    git clone https://github.com/maickrau/MBG.git
    cd MBG
    git submodule update --init --recursive
    make bin/MBG

    ml purge
    ldd bin/MBG 

    cp -av bin $PREFIX/
