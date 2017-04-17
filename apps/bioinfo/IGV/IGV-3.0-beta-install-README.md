IGV/3.0-beta
============

<http://software.broadinstitute.org/software/igv/>

LOG
---

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=3.0-beta
    TOOLVERSION=3.0_beta
    cd /sw/apps/bioinfo/IGV
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir src
    cd src/
    wget http://data.broadinstitute.org/igv/projects/downloads/${TOOLVERSION}/IGV_${TOOLVERSION}.zip
    unzip IGV_${TOOLVERSION}.zip 
    mv IGV_${TOOLVERSION} ../$CLUSTER
    cd ../$CLUSTER

For some reason these text files are DOS format.

    dos2unix igv.bat igv.sh igv.command
    cp ../../2.3.92/${CLUSTER}/igv-{core,node} .

I think the mf file from 2.3.40 will work fine.

