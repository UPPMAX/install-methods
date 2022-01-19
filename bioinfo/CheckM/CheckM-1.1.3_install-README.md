CheckM/1.1.3
========================

<https://ecogenomics.github.io/CheckM/>

Used under license:
GPL v3
<>

Structure creating script (makeroom_CheckM_1.1.3.sh) moved to /sw/bioinfo/CheckM/makeroom_1.1.3.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f -t "CheckM" -v "1.1.3" -w "https://ecogenomics.github.io/CheckM/" -d "Assess the quality of microbial genomes recovered from isolates\, single cells\, and metagenomes" -l "GPL v3"
    ./makeroom_CheckM_1.1.3.sh

    singularity build --sandbox image docker://quay.io/biocontainers/checkm-genome:1.1.3--py_1
    rm -rf image/tmp
    rm image/var/*
    singularity build checkm.sif image/
