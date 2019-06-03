oncotator/1.9.9.0
========================

<https://github.com/broadinstitute/oncotator>

Used under license:
BROAD INSTITUTE SOFTWARE LICENSE AGREEMENT FOR ACADEMIC NON-COMMERCIAL RESEARCH PURPOSES ONLY

LOG
---

    TOOL=oncotator
    VERSION=1.9.9.0
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_oncotator_1.9.9.0.sh

Structure creating script (makeroom_oncotator_1.9.9.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/oncotator/makeroom_1.9.9.0.sh

    cd $PREFIX
    singularity build --sandbox . docker://broadinstitute/oncotator:1.9.9.0
    singularity build oncotator.sif fs/
