SNPTEST 2.5.5
=============

A program for the analysis of single SNP association in genome-wide studies.

<https://mathgen.stats.ox.ac.uk/genetics_software/snptest/snptest.html>


Log
---

    VERSION=2.5.5
    cd /sw/bioinfo/
    mkdir SNPTEST
    cd SNPTEST/
    mkdir ${VERSION}
    cd ${VERSION}/
    # do not make the $CLUSTER directory, we will move the unpacked directory to it
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget http://www.well.ox.ac.uk/~gav/resources/snptest_v${VERSION}_CentOS-7.3_x86_64_dynamic.tgz
    tar xzf snptest_v${VERSION}_CentOS-7.3_x86_64_dynamic.tgz 
    cd snptest_v${VERSION}_linux_x86_64_dynamic
    ln -s ./snptest_v${VERSION} snptest
    cd ..
    mv snptest_v${VERSION}_linux_x86_64_dynamic ../$CLUSTER

Use the mf file from 2.5.2.

