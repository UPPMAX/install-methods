ARCS/1.0.6
========================

<https://github.com/bcgsc/arcs>

Used under license:
GPL v3

LOG
---

    TOOL=ARCS
    VERSION=1.0.6
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_ARCS_1.0.6.sh

Structure creating script (makeroom_ARCS_1.0.6.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/ARCS/makeroom_1.0.6.sh

    cd /sw/bioinfo/$TOOL/$VERSION/src
    [[ -f arcs-1.0.6.tar.gz ]] || wget https://github.com/bcgsc/arcs/releases/download/v1.0.6/arcs-1.0.6.tar.gz
    [[ -d arcs-1.0.6 ]] && rm -rf arcs-1.0.6
    tar xvzf arcs-1.0.6.tar.gz
    cd arcs-1.0.6

    tar xvf 
    make

