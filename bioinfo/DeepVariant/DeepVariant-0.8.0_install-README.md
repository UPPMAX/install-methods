DeepVariant/0.8.0
========================

<https://github.com/google/deepvariant>

Used under license:
BSD-3

LOG
---

    TOOL=DeepVariant
    VERSION=0.8.0
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_DeepVariant_0.8.0.sh

Structure creating script (makeroom_DeepVariant_0.8.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/DeepVariant/makeroom_0.8.0.sh

    cd /sw/bioinfo/$TOOL/$VERSION/src
    singularity pull docker://gcr.io/deepvariant-docker/deepvariant:0.8.0
    mv deepvariant_0.8.0.sif ../rackham/
