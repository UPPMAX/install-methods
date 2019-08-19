picard/2.19.2
=============

A single Java `.jar` file. 

<https://broadinstitute.github.io/picard/>

Load the latest java as well.

LOG
---

    VERSION=2.19.2
    cd /sw/bioinfo/picard
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma snowy bianca ; do ln -s $CLUSTER $CL ; done
    cd $CLUSTER
    wget https://github.com/broadinstitute/picard/releases/download/${VERSION}/picard.jar


