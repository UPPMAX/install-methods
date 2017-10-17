IGV/2.4.2
============

<http://software.broadinstitute.org/software/igv/>

LOG
---

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=2.4.2
    cd /sw/apps/bioinfo/IGV
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir src
    cd src/
    wget http://data.broadinstitute.org/igv/projects/downloads/${VERSION%.*}/IGV_${VERSION}.zip
    unzip IGV_${VERSION}.zip 
    mv IGV_${VERSION} ../$CLUSTER
    cd ../$CLUSTER

For some reason these text files are DOS format.

    dos2unix igv.bat igv.sh igv.command
    cp ../../2.3.92/${CLUSTER}/igv-{core,node} .

Links for other clusters.

    cd ..
    CC="bianca irma"
    [[ $CLUSTER == milou ]] && CC="rackham $CC"
    for C in $CC; do rm -f $C && ln -s $CLUSTER $C; done

I think the mf file from 2.3.92 will work fine.

