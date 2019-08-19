MetaPhlAn2/2.0
==============


LOG
----
    
    TOOL=metaphlan2
    VERSION=2.0
    PYTHONVERSION=2.7.6
    CLUSTER=${CLUSTER:?CLUSTER must be set}


    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir ${CLUSTER}
    [[ "$CLUSTER" == "rackham" ]] && for CL in bianca irma snowy ; do ln -s $CLUSTER $CL ; done
    cd ${CLUSTER}/
    
    PFX=$PWD
    
    cd ../
    mkdir src
    cd src
    hg clone https://bitbucket.org/biobakery/metaphlan2
    cd meatalphlan2
