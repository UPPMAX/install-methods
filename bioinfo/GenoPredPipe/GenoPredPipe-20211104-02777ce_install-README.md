GenoPredPipe/20211104-02777ce
========================

<https://github.com/opain/GenoPred/tree/master/GenoPredPipe>

Used under license:
GNU GPL v3


Structure creating script (makeroom_GenoPredPipe_20211104-02777ce.sh) moved to /sw/bioinfo/GenoPredPipe/makeroom_20211104-02777ce.sh

LOG
---

    TOOL=GenoPredPipe
    VERSION=20211104-02777ce
    makeroom.sh -f -t $TOOL -v $VERSION -s pipelines -w https://github.com/opain/GenoPred/tree/master/GenoPredPipe -l 'GNU GPL v3' -d 'This is a snakemake pipeline for running the GenoPred scripts.'

    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}
    cd $PREFIX

    module load conda/latest
    export CONDA_ENVS_PATH=$PREFIX
    conda create -n geno_env -c conda-forge -y python=3.8

    source activate geno_env

    conda install -c conda-forge mamba
    mamba install -c bioconda -c conda-forge snakemake-minimal==5.32.2
    mamba install dropbox
    mamba install pandas

   git clone https://github.com/opain/GenoPred.git

