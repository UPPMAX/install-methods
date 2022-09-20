snakemake/7.8.5
========================

<https://github.com/snakemake/snakemake>

Used under license:
MIT License


Structure creating script (makeroom_snakemake_7.8.5.sh) moved to /sw/bioinfo/snakemake/makeroom_7.8.5.sh

LOG
---

    TOOL=snakemake
    VERSION=7.8.5

    /home/niharika/install-methods/makeroom.sh -t $TOOL -v $VERSION -d "The Snakemake workflow management system is a tool to create reproducible and scalable data analyses" -w "https://github.com/snakemake/snakemake" -l "MIT License"  -s "pipelines" -f


   ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}
    

    module load python/3.9.5
    PYTHONUSERBASE=$PREFIX pip install --user snakemake==7.8.5
