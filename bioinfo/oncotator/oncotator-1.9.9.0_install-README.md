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
    ml conda
    conda create -n Oncotator oncotator
    export CONDA_ENVS_PATH=$PREFIX; conda create -n oncotator oncotator --offline
    source conda_init.sh
    conda activate Oncotator
    conda env export > environment.yml
    conda env export --name Onconator > environment.yml
    echo "Bootstrap: docker

From: continuumio/miniconda3

%files
    environment.yml

%environment
    PATH=$CONDA_ENVS_PATH/$(head -1 environment.yml | cut -d' ' -f2)/bin:$PATH

%post
    echo ". $PREFIX/etc/profile.d/conda.sh" >> ~/.bashrc
    echo "source activate $(head -1 environment.yml | cut -d' ' -f2)" > ~/.bashrc
    $PREFIX/bin/conda env create -f environment.yml

%runscript
    exec "$@"
" > Singularity

NEW TRY

singularity build oncotator.img docker://broadinstitute/oncotator:1.9.9.0
