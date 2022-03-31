CAMMiQ/20211015-6142150
========================

<https://github.com/algo-cancer/CAMMiQ>

Used under license:
MIT License


Structure creating script (makeroom_CAMMiQ_20211015-6142150.sh) moved to /sw/bioinfo/CAMMiQ/makeroom_20211015-6142150.sh

LOG
---

    makeroom.sh "-t" "CAMMiQ" "-v" "20211015-6142150" "-w" "https://github.com/algo-cancer/CAMMiQ" "-c" "bioinfo" "-l" "MIT License" "-d" "CAMMiQ is a software tool for microbial identification and quantification." "-s" "misc" "-f"
    ./makeroom_CAMMiQ_20211015-6142150.sh
    source /sw/bioinfo/CAMMiQ/SOURCEME_CAMMiQ_20211015-6142150
    cd $SRCDIR

    module load git/2.34.1
    module load cmake/3.22.2
    module load gcc/6.3.0 

Use the installed CPLEX 12.9.0.

    CPLEX_DIR=/sw/apps/CPLEXOptimizationStudio/12.9.0/rackham
    git clone --recursive https://github.com/algo-cancer/CAMMiQ
    cd CAMMiQ/
    vi src/Makefile

The two `git clone ...` lines near the end, add an option so they are `git clone --recursive ...` 

    ./install_CAMMiQ.sh --cplex-dir $CPLEX_DIR

This build process will place the `cammiq` executable in the current directory.  Make sure it can find its libraries.

    ml purge
    ldd cammiq

Run it, and install

    ./cammiq --help

    mkdir $PREFIX/bin
    cp -av cammiq $PREFIX/bin/
