qctool/2.0.1
=============

A program for the analysis of single SNP association in genome-wide studies.
We have to set RPATH within the executable to find C++ libraries.

<https://mathgen.stats.ox.ac.uk/genetics_software/snptest/snptest.html>


Log
---

    VERSION=2.0.1
    cd /sw/bioinfo/
    mkdir qctool
    cd qctool/
    mkdir ${VERSION}
    cd ${VERSION}/
    # do not make the $CLUSTER directory, we will move the unpacked directory to it
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget https://www.well.ox.ac.uk/~gav/resources/qctool_v2.0.1-CentOS6.8-x86_64.tgz
    tar xzf qctool_v${VERSION}-CentOS6.8-x86_64.tgz 
    cd qctool_v${VERSION}-CentOS6.8-x86_64
    module load patchelf/0.8 gcc/5.4.0
    patchelf --set-rpath $LD_LIBRARY_PATH qctool
    module unload patchelf gcc
    ldd qctool
    cd ..
    mv qctool_v${VERSION}_linux_x86_64 ../$CLUSTER

Use the mf file from SNPTEST 2.5.5.

