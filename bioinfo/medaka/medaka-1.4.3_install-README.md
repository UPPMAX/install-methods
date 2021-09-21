medaka/1.4.3
========================

<https://github.com/nanoporetech/medaka>

Used under license:
MPL 2.0


Structure creating script (makeroom_medaka_1.4.3.sh) moved to /sw/bioinfo/medaka/makeroom_1.4.3.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -t "medaka" -v "1.4.3" -w "https://github.com/nanoporetech/medaka" -c "bioinfo" -l "MPL 2.0" -d "medaka is a tool to create consensus sequences and variant calls from nanopore sequencing data." -x "INSTALL" -f"
    ./makeroom_medaka_1.4.3.sh

    source SOURCEME_medaka_1.4.3
    cd $PREFIX

    singularity build --sandbox image docker://quay.io/biocontainers/medaka:1.4.3--py38h130def0_0 
    rm -rf image/tmp
    rm image/var/*
    singularity build medaka.sif image/
    #./medaka.sif

create a file named medaka with the following content
########
#!/bin/bash

THIS_SCRIPT=${0##*/}

singularity exec $MEDAKA_ROOT/medaka.sif $THIS_SCRIPT "$@"
###############

    create soft links:
    ln -s medaka medaka_consensus
    ln -s medaka medaka_counts
    ln -s medaka medaka_data_path
    ln -s medaka medaka_variant
    ln -s medaka medaka_version_report




    #module load python/3.8.7
    #virtualenv $PREFIX/venv
    #$PREFIX/venv/bin/pip install medaka==1.4.3
    #mkdir bin


