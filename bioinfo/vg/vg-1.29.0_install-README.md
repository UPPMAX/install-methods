vg/1.29.0
========================

<https://github.com/vgteam/vg>

Used under license:
MIT

Structure creating script (makeroom_vg_1.29.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/vg/makeroom_1.29.0.sh

LOG
---

    TOOL=vg
    VERSION=1.29.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/vg/1.29.0/src

#On a computer with root access and Singularity installed:
singularity build  vg_v.1.29.sif docker://quay.io/vgteam/vg:v1.29.0
Copy/scp/rsync  vg_v.1.29.sif to /sw/bioinfo/vg/1.29.0/rackham/bin

#On Uppmax:
Create a executable vg file with the contents:
"
#!/bin/bash

singularity run /sw/bioinfo/vg/1.29.0/rackham/bin/vg_v.1.29.sif vg $@
"





#    /home/bjornv/git/install-methods/makeroom.sh -t "vg" -v "1.29.0" -w "https://github.com/vgteam/vg" -l "MIT" -d "Variation graphs provide a succinct encoding of the sequences of many genomes." -s "assembly"
#    ./makeroom_vg_1.29.0.sh
