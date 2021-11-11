pixy/1.2.5.beta1
========================

<https://github.com/ksamuk/pixy>

Used under license:
MIT License


Structure creating script (makeroom_pixy_1.2.5.beta1.sh) moved to /sw/bioinfo/pixy/makeroom_1.2.5.beta1.sh

LOG
---

    TOOL=pixy
    VERSION=1.2.5.beta1
    cd /sw/bioinfo/$TOOL

     makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/ksamuk/pixy -l "MIT License" -d "pixy is a command-line tool for painlessly estimating average nucleotide diversity within (π) and between (dxy) populations from a VCF"

    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}
    cd $PREFIX
    module load conda/latest
    export CONDA_ENVS_PATH=$PREFIX
    conda create -n pixy_env -c conda-forge pixy=1.2.5beta1
    source activate pixy_env
    conda install -c bioconda htslib

