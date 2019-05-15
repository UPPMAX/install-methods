snakemake/5.4.5
========================

<https://snakemake.readthedocs.io/en/stable/>

Used under license:
MIT

LOG
---

    TOOL=snakemake
    VERSION=5.4.5
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_snakemake_5.4.5.sh

Structure creating script (makeroom_snakemake_5.4.5.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/snakemake/makeroom_5.4.5.sh

    ml python3/3.6.0
    ml gcc/6.3.0
    pip3 install snakemake --target=$PREFIX
