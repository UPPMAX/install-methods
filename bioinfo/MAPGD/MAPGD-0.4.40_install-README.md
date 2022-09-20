MAPGD/0.4.40
========================

<https://github.com/LynchLab/MAPGD>

Used under license:
GPL


Structure creating script (makeroom_MAPGD_0.4.40.sh) moved to /sw/bioinfo/MAPGD/makeroom_0.4.40.sh

LOG
---

    /home/pmitev/GIT/install-methods/makeroom.sh "-t" "MAPGD" "-v" "0.4.40" "-c" "bioinfo" "-s" "misc" "-l" "GPL" "-d" "MAPGD is a series of related programs that estimate allele frequency, heterozygosity, Hardy-Weinberg disequilibrium, linkage disequilibrium and identity-by-descent (IBD) coefficients from population genomic data using a statistically rigorous maximum likelihood approach." "-w" "https://github.com/LynchLab/MAPGD"
    ./makeroom_MAPGD_0.4.40.sh
    cd $SRCDIR
    clone --recursive https://github.com/LynchLab/MAPGD.git
    cd MAPGD
    module load bioinfo-tools gcc/9.3.0 openmpi/3.1.5 htslib/1.14
    ./configure --prefix=$TOOLDIR/$VERSION/rackham
    make
    make install

