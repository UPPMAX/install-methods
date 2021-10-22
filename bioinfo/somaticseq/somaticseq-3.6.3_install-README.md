somaticseq/3.6.3
========================

<https://github.com/bioinform/somaticseq>

Used under license:
BSD 2-Clause
<https://github.com/bioinform/somaticseq/blob/master/LICENSE.txt>

Structure creating script (makeroom_somaticseq_3.6.3.sh) moved to /sw/bioinfo/somaticseq/makeroom_3.6.3.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -f" -t "somaticseq" -v "3.6.3" -s "misc" -w "https://github.com/bioinform/somaticseq" -l "BSD 2-Clause" -L "https://github.com/bioinform/somaticseq/blob/master/LICENSE.txt" -d "SomaticSeq is an ensemble caller that has the ability to use machine learning to filter out false positives"
    ./makeroom_somaticseq_3.6.3.sh

    Module load conda
    export CONDA_ENVS_PATH=/sw/bioinfo/somaticseq/3.6.3/rackham

    conda create --name somatic_seq_env -c bioconda python bedtools
    #conda activate somaticseq_env
    source activate somaticseq_env
    git clone -b v$VERSION git@github.com:bioinform/somaticseq.git
    cd somaticseq
    ./setup.py install
