GATK Queue 3.7
==============

<https://software.broadinstitute.org/gatk/download/queue>

LOG
---

Licence agreement accepted.

    VERSION=3.7
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/GATK-Queue/
    mkdir 3.7
    cd 3.7
    mkdir $CLUSTER
    mkdir src
    cd src/
    cp ~/uppmax/Queue-3.7.tar.bz2 .
    tar xvjf Queue-3.7.tar.bz2 
    mv Queue.jar resources ../$CLUSTER/
    cd ..
    ln -s milou bianca
    ln -s milou irma
    ln -s milou tintin
