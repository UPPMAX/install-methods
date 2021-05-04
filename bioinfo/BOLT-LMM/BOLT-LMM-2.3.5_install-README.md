BOLT-LMM/2.3.5
========================

<https://alkesgroup.broadinstitute.org/BOLT-LMM/BOLT-LMM_manual.html#x1-20001>

Used under license:
GPL v3 license
<>

Structure creating script (makeroom_BOLT-LMM_2.3.5.sh) moved to /sw/bioinfo/BOLT-LMM/makeroom_2.3.5.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "BOLT-LMM" -v "2.3.5" -w "https://alkesgroup.broadinstitute.org/BOLT-LMM/BOLT-LMM_manual.html#x1-20001" -c "bioinfo" -l "GPL v3 license" -d "software package currently consists of two main algorithms\, the BOLT-LMM algorithm for mixed model association testing\, and the BOLT-REML algorithm for variance components analysis \(i.e.\, partitioning of SNP-heritability and estimation of genetic correlations\).\" -x "INSTALL" -s "misc"
    ./makeroom_BOLT-LMM_2.3.5.sh
    cd $SRCDIR
    wget https://storage.googleapis.com/broad-alkesgroup-public/BOLT-LMM/downloads/BOLT-LMM_v2.3.5.tar.gz
    tar xvfz BOLT-LMM_v2.3.5.tar.gz
    rm -rf $PREFIX
    mv BOLT-LMM_v2.3.5 $PREFIX #libs needs to be at the same level as bolt executable it seems
    cd $PREFIX
    ./bolt

