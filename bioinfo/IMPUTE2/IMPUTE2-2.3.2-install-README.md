IMPUTE2 2.3.2
=============

A genotype imputation and haplotype phasing program based on ideas from:

    B. N. Howie, P. Donnelly, and J. Marchini (2009) A flexible and accurate
    genotype imputation method for the next generation of genome-wide association
    studies. PLoS Genetics 5(6): e1000529

<https://mathgen.stats.ox.ac.uk/impute/impute_v2.html#home>


Log
---

    cd /sw/apps/bioinfo/
    mkdir IMPUTE2
    cd IMPUTE2/
    mkdir 2.3.2
    cd 2.3.2/
    ln -s ./milou tintin
    ln -s ./milou nestor
    ln -s ./milou halvan

Note: the `milou/` directory will not yet exist!

    mkdir src
    cd src
    wget https://mathgen.stats.ox.ac.uk/impute/impute_v2.3.2_x86_64_static.tgz
    tar xzf impute_v2.3.2_x86_64_static.tgz 
    mv impute_v2.3.2_x86_64_static ../milou
    cd ../..
    mkdir mf
    cd mf

Get a simple mf file from SNPTEST, and add `$modroot` to `PATH`.

