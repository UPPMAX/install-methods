IMPUTE haplotypes
=================

Haplotypes for IMPUTE2 for 1000G Phase 3 data.

https://mathgen.stats.ox.ac.uk/impute/1000GP_Phase3.html


LOG
---

Phase 3 data

    cd /sw/data/KGP
    mkdir impute_haplotypes
    cd impute_haplotypes
    mkdir src
    cd src
    wget https://mathgen.stats.ox.ac.uk/impute/1000GP_Phase3.tgz
    wget https://mathgen.stats.ox.ac.uk/impute/1000GP_Phase3_chrX.tgz

    cd ..

    tar xf src/1000GP_Phase3.tgz 
    cd 1000GP_Phase3/
    tar xf ../src/1000GP_Phase3_chrX.tgz 

    fixup -G kgp -p .

Phase 1 data


    cd /sw/data/KGP/
    cd impute_haplotypes/
    cd src/
    wget https://mathgen.stats.ox.ac.uk/impute/ALL_1000G_phase1integrated_v3_impute_macGT1.tgz
    cd ..
    tar xf src/ALL_1000G_phase1integrated_v3_impute_macGT1.tgz 
    fixup -G kgp -p .

