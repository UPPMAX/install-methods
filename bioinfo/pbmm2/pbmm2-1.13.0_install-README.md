pbmm2/1.13.0
========================

<https://github.com/PacificBiosciences/pbmm2>

Used under license:
BSD 3


Structure creating script (makeroom_pbmm2_1.13.0.sh) moved to /sw/bioinfo/pbmm2/makeroom_1.13.0.sh

LOG
---
TOOL=pbmm2
VERSION=1.13.0

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t $TOOL -v $VERSION -w "https://github.com/PacificBiosciences/pbmm2"  -l "BSD 3" -d "pbmm2 is a SMRT C++ wrapper for minimap2's C API. Its purpose is to support native PacBio in- and output, provide sets of recommended parameters, generate sorted output on-the-fly, and postprocess alignments." -s alignment

    ./makeroom_pbmm2_1.13.0.sh
    source /sw/bioinfo/pbmm2/SOURCEME_pbmm2_1.13.0 && cd $SRCDIR
    wget https://github.com/PacificBiosciences/pbmm2/archive/refs/tags/v1.13.0.tar.gz
    tar xzvf v1.13.0.tar.gz
    cd pbmm2-1.13.0/
    wget https://github.com/PacificBiosciences/pbmm2/releases/download/v1.13.0/pbmm2
    chmod +x pbmm2
    rmdir $PREFIX
    cd ..
    cp -r pbmm2-1.13.0/ $PREFIX
    
