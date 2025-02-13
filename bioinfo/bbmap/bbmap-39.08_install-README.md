bbmap/39.08
===========

<https://jgi.doe.gov/data-and-tools/software-tools/bbtools/>

Used under license:
Public Domain


Thought about moving this to the name BBTools but that might be confusing to old users.

Structure creating script (makeroom_bbmap_39.08.sh) moved to /sw/bioinfo/bbmap/makeroom_39.08.sh

LOG
---

    makeroom.sh -f -t bbmap -v 39.08 -l "Public Domain" -w https://jgi.doe.gov/data-and-tools/software-tools/bbtools/ -d "a suite of fast, multithreaded bioinformatics tools designed for analysis of DNA and RNA sequence data" # https://downloads.sourceforge.net/project/bbmap/BBMap_39.08.tar.gz
    ./makeroom_bbmap_39.08.sh 
    source /sw/bioinfo/bbmap/SOURCEME_bbmap_39.08
    cd $SRCDIR
    wget https://downloads.sourceforge.net/project/bbmap/BBMap_39.08.tar.gz
    tar xf BBMap_39.08.tar.gz 
    rmdir $PREFIX && mv bbmap $PREFIX
