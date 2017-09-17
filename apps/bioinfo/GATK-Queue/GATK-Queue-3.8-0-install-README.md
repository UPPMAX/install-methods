GATK-Queue/3.8-0
================

<https://software.broadinstitute.org/gatk/download/queue>

LOG
---

Licence agreement accepted.  Do this for milou, all others make links.

    VERSION=3.8-0
    THISCLUSTER=milou
    cd /sw/apps/bioinfo/GATK-Queue/
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir $THISCLUSTER
    mkdir src
    cd src/

Bring tarball over after downloading.

    cp ~/uppmax/Queue-${VERSION}.tar.bz2 .
    tar xvjf Queue-${VERSION}.tar.bz2 

No longer a `resource/` directory within Queue... users could use the examples from 3.7.

    mv Queue-${VERSION}-*/Queue.jar ../$THISCLUSTER/
    rm -rf Queue-${VERSION}-*
    cd ..
    ln -s milou rackham
    ln -s milou bianca
    ln -s milou irma
