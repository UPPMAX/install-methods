hybpiper/2.1.6
========================

<https://github.com/mossmatters/HybPiper>

Used under license:
GPLv3


Structure creating script (makeroom_hybpiper_2.1.6.sh) moved to /sw/bioinfo/hybpiper/makeroom_2.1.6.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "hybpiper" "-v" "2.1.6" "-w" "https://github.com/mossmatters/HybPiper" "-l" "GPLv3" "-d" "Recovering genes from targeted sequence capture data" "-s" "annotation"
    ./makeroom_hybpiper_2.1.6.sh

    module load bioinfo-tools
    module load python/3.11.4
    module load exonerate/2.4.0
    module load blast/2.14.1+
    module load diamond/2.1.6
    module load bwa/0.7.17 
    module load bbmap/38.61b
    module load spades/3.15.5
    module load samtools/1.17
    module load MAFFT/7.407
    module load gnuparallel/20180822

    # Create venv and install dependencies
    cd $PREFIX
    python3 -m venv hybpiper-venv
    source $PREFIX/hybpiper-venv/bin/activate

    pip install seaborn==0.12.2 matplotlib==3.7.2 pebble==5.0.3 progressbar2==4.2.0 python-utils==3.8.1 scipy==1.11.1 pandas==2.0.3 biopython==1.81 psutil==5.9.5

    # Download
    cd $SRCDIR
    git clone https://github.com/mossmatters/HybPiper.git .
    git reset --hard v2.1.6

    pip install .

    # Lift out hybpiper to $PREFIX/bin
    mkdir $PREFIX/bin
    cd $PREFIX/bin
    ln -s $PREFIX/hybpiper-venv/bin/hybpiper .


    # Test
    tar xfvz test_dataset.tar.gz
    cd test_dataset/
    # Remove  --run_intronerate from run_hybpiper_test_dataset.sh
    ./run_hybpiper_test_dataset.sh























    # Conda test
    module load conda
    export CONDA_ENVS_PATH=$PREFIX
    conda create -p $PREFIX
    conda config --add channels defaults
    conda config --add channels bioconda
    conda config --add channels conda-forge
    conda activate hybpiper
    activate hybpiper/
