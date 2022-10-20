KING/2.2.9
========================

<https://www.kingrelatedness.com>

Used under license:
Custom
<https://kingrelatedness.com/Download.shtml>

Structure creating script (makeroom_KING_2.2.9.sh) moved to /sw/bioinfo/KING/makeroom_2.2.9.sh

LOG
---

    /home/matpiq/install-methods/makeroom.sh -t "KING" -v "2.2.9" -c "bioinfo" -w "https://www.kingrelatedness.com" -d "KING is a toolset that makes use of high-throughput SNP data typically seen in a genome-wide association study (GWAS) or a sequencing project. Applications of KING include family relationship inference and pedigree error checking, quality control, population substructure identification, forensics, gene mapping, etc." -u "rackham snowy bianca" -l "Custom" -L "https://kingrelatedness.com/Download.shtml" "-s" "misc"
    ./makeroom_KING_2.2.9.sh

KING was installed using the prebuilt binaries: https://www.kingrelatedness.com/Download.shtml:

    cd /sw/bioinfo/KING/2.2.9/src
    wget https://www.kingrelatedness.com/Linux-king.tar.gz
    tar -xzvf Linux-king.tar.gz
    mv king ../rackham/bin
