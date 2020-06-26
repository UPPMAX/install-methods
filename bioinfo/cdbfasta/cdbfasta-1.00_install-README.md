cdbfasta/1.00
========================

<https://github.com/gpertea/cdbfasta>

Used under license:
Artistic 2.0

Structure creating script (makeroom_cdbfasta_1.00.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/cdbfasta/makeroom_1.00.sh

LOG
---

    TOOL=cdbfasta
    VERSION=1.00
    makeroom.sh -f" -s "misc" -t "${TOOL}" -v "${VERSION}" -w "https://github.com/gpertea/cdbfasta" -l "Artistic 2.0" -d "Constant DataBase tools for indexing and retrieving records from multi-FASTA or similarly structured files"
    ./makeroom_${TOOL}_${VERSION}.sh
    cd /sw/bioinfo/$TOOL

    source SOURCEME_cdbfasta_1.00 
    cd 1.00/
    cd src/
    git clone https://github.com/gpertea/cdbfasta
    cd cdbfasta/
    module load gcc/9.3.0
    module load zlib/1.2.11
    mkdir $PREFIX/bin
    cp -av cdbfasta cdbyank $PREFIX/bin

Add `$modroot/bin` to `PATH`.
