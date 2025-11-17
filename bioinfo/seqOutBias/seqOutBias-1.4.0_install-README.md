seqOutBias/1.4.0
================

<https://guertinlab.github.io/seqOutBias>

Used under license:
BSD 3-clause


Structure creating script (makeroom_seqOutBias_1.4.0.sh) moved to /sw/bioinfo/seqOutBias/makeroom_1.4.0.sh

LOG
---

    makeroom.sh -t seqOutBias -v 1.4.0 -c bioinfo -s misc -w https://guertinlab.github.io/seqOutBias -d "Universal correction of enzymatic sequence bias" -l "BSD 3-clause"
    ./makeroom_seqOutBias_1.4.0.sh 

    source /sw/bioinfo/seqOutBias/SOURCEME_seqOutBias_1.4.0
    cd $SRCDIR
    wget https://github.com/guertinlab/seqOutBias/archive/refs/tags/v1.4.0.tar.gz
    tar xf v1.4.0.tar.gz 
    ml rust/1.43.1
    cd seqOutBias-1.4.0/
    cargo build --release
    ldd target/release/seqOutBias 
    target/release/seqOutBias 

    mkdir $PREFIX/bin
    cp -av target/release/seqOutBias $PREFIX/bin/

Load GenomeTools and ucsc-utilities as prerequisites.

