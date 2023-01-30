GenoPredPipe/20221121-e3caf6b
========================

<https://github.com/opain/GenoPred/tree/master/GenoPredPipe>

Used under license:
GNU GPL v3


Structure creating script (makeroom_GenoPredPipe_20211104-02777ce.sh) moved to /sw/bioinfo/GenoPredPipe/makeroom_20211104-02777ce.sh

LOG
---

    TOOL=GenoPredPipe
    VERSION=20221121-e3caf6b
    makeroom.sh -f -t $TOOL -v $VERSION -s pipelines -w https://github.com/opain/GenoPred/tree/master/GenoPredPipe -l 'GNU GPL v3' -d 'This is a snakemake pipeline for running the GenoPred scripts.'

    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}
    cd $PREFIX
    git clone https://github.com/opain/GenoPred.git

    module load conda/latest
    source conda_init.sh
    export CONDA_ENVS_PATH=$PREFIX
    conda create -n geno_env -c conda-forge -y python=3.8

    conda activate geno_env
    # Mamba did not work, everything was done with conda instead
    conda install -c conda-forge mamba
    mamba install -c bioconda -c conda-forge snakemake-minimal==5.32.2
    mamba install dropbox
    mamba install pandas


    mkdir -p $PREFIX/github.com/opain
    cd $PREFIX/github.com/opain
    git clone --bare https://github.com/opain/GenoPred.git

    # https://hackmd.io/@pmitev/GenoPredPipe_on_Bianca
