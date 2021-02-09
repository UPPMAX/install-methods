parliament2/v0.1.11
========================

<https://github.com/fritzsedlazeck/parliament2>

Used under license:
Apache License 2.0
<>

Structure creating script (makeroom_parliament2_v0.1.11.sh) moved to /sw/bioinfo/parliament2/makeroom_v0.1.11.sh

LOG
---

    TOOL=parliament2
    VERSION=v0.1.11
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/parliament2/v0.1.11/src
    /home/bjornv/git/install-methods/makeroom.sh -t "parliament2" -v "v0.1.11" -w "https://github.com/fritzsedlazeck/parliament2" -l "Apache License 2.0" -d "Parliament2 identifies structural variants in a given sample relative to a reference genome." -s "annotation"


On a computer with singularity and root access:
singularity build parliament2-v0.1.11-0.sif docker://dnanexus/parliament2:v0.1.11-0-gb492db6d
Copy parliament2-v0.1.11-0.sif to Uppmax.

On Uppmax:
Copy the sif file to: /sw/bioinfo/parliament2/v0.1.11/rackham/bin/parliament2-v0.1.11-0.sif



Note. I decided not to write a bash-wrapper for this one. The original documentation is how you run it as a docker container. I wanted to keep it similar to the documentation. /Björn V






