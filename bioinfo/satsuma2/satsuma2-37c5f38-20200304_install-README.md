satsuma2/37c5f38-20200304
========================

<https://github.com/bioinfologics/satsuma2>

Used under license:
GPL v3


Structure creating script (makeroom_satsuma2_37c5f38-20200304.sh) moved to /sw/bioinfo/satsuma2/makeroom_37c5f38-20200304.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "satsuma2" "-v" "37c5f38-20200304" "-w" "https://github.com/bioinfologics/satsuma2" "-c" "bioinfo" "-l" "GPL v3" "-d" "optimised version of Satsuma, a tool to reliably align large and complex DNA sequences providing maximum sensitivity (to find all there is to find), specificity (to only find real homology) and speed (to accomodate the billions of base pairs in vertebrate genomes)." "-x" "INSTALL" "-f"
    ./makeroom_satsuma2_37c5f38-20200304.sh
    source /sw/bioinfo/satsuma2/SOURCEME_satsuma2_37c5f38-20200304 && cd $TOOLDIR
    cd $SRCDIR
    [[ -d satsuma2 ]] || git clone https://github.com/bioinfologics/satsuma2
    cd satsuma2
    module load cmake/3.22.2
    module load gcc/9.3.0
    cmake .
    make
    cp -av bin $PREFIX/

