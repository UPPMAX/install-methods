NeuSomatic/0.2.1
========================

<https://github.com/bioinform/neusomatic>

Used under license:
Creative Commons Public License


Structure creating script (makeroom_NeuSomatic_0.2.1.sh) moved to /sw/bioinfo/NeuSomatic/makeroom_0.2.1.sh

LOG
---

    TOOL=NeuSomatic
    VERSION=0.2.1

     makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/bioinform/neusomatic -l 'Creative Commons Public License' -d 'NeuSomatic is based on deep convolutional neural networks for accurate somatic mutation detection.'

    ./makeroom_NeuSomatic_0.2.1.sh

    Source SOURCEME_NeuSomatic_0.2.1

    module load conda
    ml gcc/5.4.0
    export CONDA_ENVS_PATH=$PREFIX

    conda create -n neu_env -c conda-forge -y python=3.7
    source activate neu_env

    conda install zlib=1.2.11 numpy=1.15.4 scipy=1.2.0 cmake=3.13.2 imageio=2.5.0
    conda install pysam=0.15.2 pybedtools=0.8.0 samtools=1.9 tabix=0.2.6 bedtools=2.27.1 biopython=1.73 -c bioconda
    conda install pytorch=1.1.0 torchvision=0.3.0 cudatoolkit=9.0 -c pytorch
    
    cd $SRCDIR
    wget https://github.com/bioinform/neusomatic/archive/refs/tags/v0.2.1.tar.gz
    cd ndusomatic
    ./build.sh
    mv neusomatic/ $PREFIX 

