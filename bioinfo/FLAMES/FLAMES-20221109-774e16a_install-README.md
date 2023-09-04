FLAMES/20221109-774e16a
========================

<https://github.com/LuyiTian/FLAMES>

Used under license:
GPL v3


Structure creating script (makeroom_FLAMES_20221109-774e16a.sh) moved to /sw/bioinfo/FLAMES/makeroom_20221109-774e16a.sh

LOG
---

    makeroom.sh "-c" "bioinfo" "-s" "misc" "-t" "FLAMES" "-v" "20221109-774e16a" "-w" "https://github.com/LuyiTian/FLAMES" "-d" "Full-length transcriptome splicing and mutation analysis" "-l" "GPL v3"
    ./makeroom_FLAMES_20221109-774e16a.sh
    source /sw/bioinfo/FLAMES/SOURCEME_FLAMES_20221109-774e16a

Get software.

    cd $PREFIX
    ml git/2.34.1

    git clone --recursive https://github.com/LuyiTian/FLAMES

Create venv and install python packages.

    ml python/3.10.8
    virtualenv venv
    venv/bin/pip3 install editdistance
    source venv/bin/activate
    which pip3
    pip3 install numpy
    pip3 install pysam

Load bioinfo prerequisites.

    ml bioinfo-tools
    ml samtools/1.17
    ml minimap2/2.24-r1122

Prepare FLAMES scripts for use in place, specifically to use the venv's python.

    ln -s $PREFIX/FLAMES/python/* .
    chmod +x *.json
    sed -i "1i #!$(which python)" *.py

Compile `match_cell_barcode` locally and provide it.

    ml gcc/12.3.0
    cd $PREFIX
    cd FLAMES/src
    g++ -std=c++11 -lz -O2 -o bin/match_cell_barcode ssw/ssw_cpp.cpp ssw/ssw.c match_cell_barcode.cpp kseq.h edit_dist.cpp
    cd $PREFIX/bin
    ln -s $PREFIX/FLAMES/src/bin/match_cell_barcode .

Add $modroot/bin ($PREFIX/bin) to PATH.  In mf:

    prepend-path PATH $modroot/bin

Test data
