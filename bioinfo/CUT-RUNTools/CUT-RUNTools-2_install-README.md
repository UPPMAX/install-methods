CUT-RUNTools/2
========================

<https://github.com/fl-yu/CUT-RUNTools-2.0>

Used under license:
MIT


Structure creating script (makeroom_CUT-RUNTools_2.sh) moved to /sw/bioinfo/CUT-RUNTools/makeroom_2.sh

LOG
---


THIS IS NOT INSTALLED. The installation process was messy and the software did not have any releases. //Björn



    /home/bjornv/git/install-methods/makeroom.sh "-t" "CUT-RUNTools" "-v" "2" "-s" "annotation" "-w" "https://github.com/fl-yu/CUT-RUNTools-2.0" "-l" "MIT" "-d" "A tool for bulk and single-cell CUT&RUN/CUT&Tag data processing and analysis"
    ./makeroom_CUT-RUNTools_2.sh
    source /sw/bioinfo/CUT-RUNTools/SOURCEME_CUT-RUNTools_2
    cd $PREFIX
    module load bioinfo-tools
    module load conda/latest
    module load samtools/1.14
    module load bowtie2/2.3.5.1
    module load MEMEsuite/5.1.1
    module load BEDOPS/2.4.39
    module load BEDTools/2.29.2
    module load deepTools/3.3.2
    module load tabix/0.2.6
    module load gnuparallel/20180822
    module load R_packages/4.1.1
    #conda create --prefix $PREFIX -n cutruntools2.1

    pip3 install --target=$PREFIX macs2==2.2.7.1 igraph==0.9.9 parallel

# conda. Do this on rackham 1-3. Doesnt work on  
    export CONDA_ENVS_PATH=$PREFIX/envs
    module load conda/latest

    #conda env create --file $SRCDIR/CUT-RUNTools-2.0/install/environment1.yml
    #conda env create --file $SRCDIR/CUT-RUNTools-2.0/install/environment2.yml
    conda create -n cutruntools2.1 python=3.7.2 --prefix $PREFIX
    source activate /sw/bioinfo/CUT-RUNTools/2/rackham
    conda install -y -c bioinfo macs2 --prefix $PREFIX
    conda install -y -c conda-forge parallel --prefix $PREFIX
    conda install -y -c conda-forge python-igraph --prefix $PREFIX
    conda install -y -c deeptools --prefix $PREFIX

# Download git repo
    cd $SRCDIR
    git clone https://github.com/fl-yu/CUT-RUNTools-2.0.git

# R packages install
    cd $PREFIX
    mkdir R
    export R_LIBS="$PREFIX/R"
    export R_LIBS_SITE="$PREFIX/R"
    R CMD BATCH $SRCDIR/CUT-RUNTools-2.0/install/r-pkgs-install.r


# Install deeptools intervals
    cd $SRCDIR
    wget https://github.com/deeptools/deeptools_intervals/archive/refs/tags/0.1.8.tar.gz
    tar xfvz 0.1.8.tar.gz
    cd deeptools_intervals-0.1.8
    python setup.py install --prefix=$PREFIX
    PYTHONPATH=$PYTHONPATH/:/sw/bioinfo/CUT-RUNTools/2/rackham/lib/python3.7/site-packages/

# Part 3 pip install
    pip install umap-learn leidenalg --prefix=$PREFIX

# Part 4 
    cd $PREFIX
    ln -s $SRCDIR/CUT-RUNTools-2.0/install/{*.patch,atactk.install.sh,*kseq*} .
    # modify to 3.7 instead of 3.6 in atactk.install.sh
    source atactk.install.sh
    source make_kseq_test.sh


