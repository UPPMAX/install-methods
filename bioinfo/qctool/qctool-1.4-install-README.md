qctool 1.4
==========

A command-line utility program for basic quality control of gwas datasets.

<http://www.well.ox.ac.uk/~gav/qctool/#overview>


Log
---

    cd /sw/apps/bioinfo/
    mkdir qctool
    cd qctool/
    mkdir 1.4
    cd 1.4
    for S in rackham irma bianca ; do ln -s milou $S; done

Note: the `milou/` directory will not yet exist!

    mkdir src
    cd src
    wget http://www.well.ox.ac.uk/~gav/qctool/resources/qctool_v1.4-scientific-linux-x86_64.tgz
    tar xzf qctool_v1.4-scientific-linux-x86_64.tgz 
    mv qctool_v1.4-linux-x86_64 ../milou
    cd ../..
    mkdir mf
    cd mf

Get a simple mf file from SNPTEST, which simply adds `$modroot` to `PATH`.

