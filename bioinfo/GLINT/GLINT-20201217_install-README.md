GLINT/20201217
========================

<https://glint-epigenetics.readthedocs.io/en/latest/>

Used under license:
AS IS


Structure creating script (makeroom_GLINT_20201217.sh) moved to /sw/bioinfo/GLINT/makeroom_20201217.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "GLINT" -v "20201217" -w "https://glint-epigenetics.readthedocs.io/en/latest/" -c "bioinfo" -l "AS IS" -d "is a user-friendly command-line tool for fast analysis of genome-wide DNA methylation data generated using the Illumina human methylation arrays." -x "INSTALL" -s "misc"
    ./makeroom_GLINT_20201217.sh
    . SOURCEME_GLINT_20201217
    cd $SRCDIR
    ml git
    git clone https://github.com/cozygene/glint
    cp -r glint $PREFIX
    cd $PREFIX
    ml conda
    export CONDA_ENVS_PATH=$PREFIX
    conda create -n glint_env -c conda-forge -y python=2.7.15

    source activate glint_env/
    pip install numpy==1.10.4
    pip install scipy==0.17
    pip install scikit-learn
    pip install pandas==0.18
    pip install matplotlib==1.5.1
    pip install statsmodels==0.6.1
    pip install cvxopt==1.1.8
    conda deactivate

#TEST
   source activate $PREFIX/glint_env 
   python glint.py --datafile datafile.txt --covarfile covariates.txt --phenofile phenotypes.txt --gsave

