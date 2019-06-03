medaka/0.7.1
========================

<https://github.com/nanoporetech/medaka>

Used under license:
MPL 2.0

LOG
---

    TOOL=medaka
    VERSION=0.7.1
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_medaka_0.7.1.sh

Structure creating script (makeroom_medaka_0.7.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/medaka/makeroom_0.7.1.sh

    cd $PREFIX
    singularity build --sandbox image docker://quay.io/biocontainers/medaka:0.7.1--py36h2b5150b_1
    cd image
    rm -rf tmp
    cd image/var/
    rm *
    ##only remove the links to tmp
    singularity build medaka.sif image/
    ./medaka.sif
