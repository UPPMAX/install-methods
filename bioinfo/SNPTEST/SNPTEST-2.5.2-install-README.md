SNPTEST 2.5.2
=============

A program for the analysis of single SNP association in genome-wide studies.

<https://mathgen.stats.ox.ac.uk/genetics_software/snptest/snptest.html>


Log
---

    cd /sw/apps/bioinfo/
    mkdir SNPTEST
    cd SNPTEST/
    mkdir 2.5.2
    cd 2.5.2/
    ln -s ./milou tintin
    ln -s ./milou nestor
    ln -s ./milou halvan

Note: the `milou/` directory will not yet exist!

    mkdir src
    cd src
    wget http://www.well.ox.ac.uk/~gav/resources/snptest_v2.5.2_CentOS6.5_x86_64_dynamic.tgz
    tar xzf snptest_v2.5.2_CentOS6.5_x86_64_dynamic.tgz 
    mv snptest_v2.5.2_linux_x86_64_dynamic ../milou
    cd ../milou
    ln -s ./snptest_v2.5.2 snptest
    cd ../..
    mkdir mf
    cd mf

Get a simple mf file from anywhere, and add `$modroot` to `PATH`.

