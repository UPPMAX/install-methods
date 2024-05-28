tabixpp/1.1.2
========================

<https://github.com/vcflib/tabixpp>

Used under license:
MIT


Structure creating script (makeroom_tabixpp_1.1.2.sh) moved to /sw/bioinfo/tabixpp/makeroom_1.1.2.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "tabixpp" "-v" "1.1.2" "-w" "https://github.com/vcflib/tabixpp" "-d" "C++ wrapper to tabix indexer" "-l" "MIT" "-s" "annotation"
    ./makeroom_tabixpp_1.1.2.sh


    # Download 
    cd $SRCDIR
    git clone https://github.com/vcflib/tabixpp --recurse-submodules
    cd tabixpp
    git checkout  v${VERSION}
    git reset --hard

    # Compile
    make -j 10
    make test

    #Copy to PREFIX
    cp $SRCDIR/tabixpp/* $PREFIX
