snakemake/5.30.1
========================

<https://github.com/snakemake/snakemake>

Used under license:
MIT
<https://snakemake.readthedocs.io/en/stable/project_info/license.html>

Structure creating script (makeroom_snakemake_5.30.1.sh) moved to /sw/bioinfo/snakemake/makeroom_5.30.1.sh

LOG
---

    TOOL=snakemake
    VERSION=5.30.1
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/snakemake/5.30.1/src
    /home/jonass/uppmax/install-methods/makeroom.sh -t "snakemake" -v "5.30.1" -w "https://github.com/snakemake/snakemake" -d "A tool to create reproducible and scalable data analyses" -l "MIT" -L "https://snakemake.readthedocs.io/en/stable/project_info/license.html" -f"
    ./makeroom_snakemake_5.30.1.sh
    ml python3/3.7.2
    pip3 install snakemake --target=$PREFIX
