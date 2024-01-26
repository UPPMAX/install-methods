SpeedPPI/2023.07.11-37d0a03
========================

<https://github.com/patrickbryant1/SpeedPPI>

Used under license:



Structure creating script (makeroom_SpeedPPI_2023.07.11-37d0a03.sh) moved to /sw/bioinfo/SpeedPPI/makeroom_2023.07.11-37d0a03.sh

LOG
---

    makeroom.sh "-t" "SpeedPPI" "-v" "2023.07.11-37d0a03" "-c" "bioinfo" "-w" "https://github.com/patrickbryant1/SpeedPPI" "-d" "This repository contains code for predicting a pairwise protein-protein interaction network from a set of protein sequences or two lists of sequences thought to interact." "-s" "sw_collections"
    ./makeroom_SpeedPPI_2023.07.11-37d0a03.sh
    
    # https://github.com/patrickbryant1/SpeedPPI
    cd $SRCDIR
    git clone https://github.com/patrickbryant1/SpeedPPI.git
    module load conda
    source conda_init.sh
    export CONDA_ENVS_PATH=$PREFIX
    conda env create -f SpeedPPI/speed_ppi.yml
    conda activate /sw/bioinfo/SpeedPPI/2023.07.11-37d0a03/rackham/SpeedPPI

    # HHblits - Building on Snowy
    module load cmake
    module load gcc/12.3.0
    module load openmpi/4.1.5
    cd $SRCDIR
    git clone https://github.com/soedinglab/hh-suite.git
    mkdir -p hh-suite/build && cd hh-suite/build
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
    make -j 4
    
    # Uniclust30
    cd $PREFIX
    wget http://wwwuser.gwdg.de/~compbiol/uniclust/2018_08/uniclust30_2018_08_hhsuite.tar.gz --no-check-certificate
    tar -zxvf uniclust30_2018_08_hhsuite.tar.gz -C data/
    

    # AlphaFold2 parameters
    cd $SRCDIR
    mkdir -p data/params
    wget https://storage.googleapis.com/alphafold/alphafold_params_2021-07-14.tar
    mv alphafold_params_2021-07-14.tar data/params
    tar -xf data/params/alphafold_params_2021-07-14.tar
    mv params_model_1.npz data/params

    # clean 
    #rm uniclust30_2018_08_hhsuite.tar.gz
    #rm data/params/alphafold_params_2021-07-14.tar
    rm params_*.npz

