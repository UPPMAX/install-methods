snakemake/5.17.0
========================

<https://github.com/snakemake/snakemake>

Used under license:
MIT

Structure creating script (makeroom_snakemake_5.17.0.sh) moved to /sw/bioinfo/snakemake/makeroom_5.17.0.sh

LOG
---

    TOOL=snakemake
    VERSION=5.17.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/snakemake/5.17.0/src
    /home/jonass/uppmax/install-methods/makeroom.sh -t "snakemake" -v "5.17.0" -w "https://github.com/snakemake/snakemake" -d "A tool to create reproducible and scalable data analyses" -l "MIT" -f"
    ./makeroom_snakemake_5.17.0.sh
    ml python3/3.7.2
    pip3 install snakemake --target=$PREFIX
