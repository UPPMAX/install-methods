NgsRelate/2.0
========================

<https://github.com/ANGSD/NgsRelate>

Used under license:
GPL v2 license


Structure creating script (makeroom_NgsRelate_2.0.sh) moved to /sw/bioinfo/NgsRelate/makeroom_2.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "NgsRelate" -v "2.0" -w "https://github.com/ANGSD/NgsRelate" -c "bioinfo" -l "GPL v2 license" -d "Infers relatedness\, inbreeding coefficients and many other summary statistics for pairs of individuals from low coverage Next Generation Sequencing \(NGS\) data by using genotype likelihoods instead of called genotypes.\" -x "INSTALL" -s "misc"
    ./makeroom_NgsRelate_2.0.sh
    cd $SRCDIR

    git clone --recursive https://github.com/SAMtools/htslib
    git clone https://github.com/ANGSD/ngsRelate
    cd htslib/;make -j2;cd ../ngsRelate;make HTSSRC=../htslib/

#alternative not working
    git clone https://github.com/ANGSD/ngsRelate
    ml htslib/1.12 gcc/9.3.0
    cd ngsRelate
    make HTSSRC=$HTSLIB_ROOT/libexec/htslib
