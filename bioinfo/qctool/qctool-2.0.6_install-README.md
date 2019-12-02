qctool/2.0.6
========================

<https://mathgen.stats.ox.ac.uk/genetics_software/snptest/snptest.html>

A program for the analysis of single SNP association in genome-wide studies.
We have to set RPATH within the executable to find C++ libraries.

Used under license:
'As is' open source

Structure creating script (makeroom_qctool_2.0.6.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/qctool/makeroom_2.0.6.sh


source SOURCEME_qctool_2.0.6 

Log
---

    TOOL=qctool
    VERSION=2.0.6
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -w https://mathgen.stats.ox.ac.uk/genetics_software/snptest/snptest.html -s misc -l "'As is' open source" -d "A program for the analysis of single SNP association in genome-wide studies"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION}
    cd $VERSION
    rmdir $CLUSTER
    # remove the $CLUSTER directory, we will move the unpacked directory to it
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca snowy ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    mkdir src
    cd src
    wget https://www.well.ox.ac.uk/~gav/resources/${TOOL}_v${VERSION}-CentOS_Linux7.3.1611-x86_64.tgz
    tar xzf ${TOOL}_v${VERSION}-CentOS_Linux7.3.1611-x86_64.tgz
    cd "${TOOL}_v${VERSION}-CentOS Linux7.3.1611-x86_64"
    module load patchelf/0.8 gcc/6.4.0
    patchelf --set-rpath $LD_LIBRARY_PATH qctool
    module unload patchelf gcc
    ldd qctool
    cd ..
    mv "${TOOL}_v${VERSION}-CentOS Linux7.3.1611-x86_64" ../$CLUSTER

Use the mf file from qctool 2.0.1.

