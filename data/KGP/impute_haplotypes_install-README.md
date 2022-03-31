IMPUTE haplotypes
=================

Haplotypes for IMPUTE2 for 1000G Phase 3 data.

https://mathgen.stats.ox.ac.uk/impute/1000GP_Phase3.html


LOG
---

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

