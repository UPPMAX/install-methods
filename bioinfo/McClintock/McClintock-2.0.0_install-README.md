McClintock/2.0.0
========================

<https://github.com/bergmanlab/mcclintock>

Used under license:
AS IS
<https://github.com/bergmanlab/mcclintock>

Structure creating script (makeroom_McClintock_2.0.0.sh) moved to /sw/bioinfo/McClintock/makeroom_2.0.0.sh

LOG
---

    /home/matpiq/install-methods/makeroom.sh "-f" "-t" "McClintock" "-v" \
    "2.0.0" "-c" "bioinfo" "-s" "pipelines" "-w" \
    "https://github.com/bergmanlab/mcclintock" "-l" "AS IS" "-L" \
    "https://github.com/bergmanlab/mcclintock" "-d" "Meta-pipeline to identify
    transposable element insertions using next generation sequencing data" 

    ./makeroom_McClintock_2.0.0.sh
    cd $SRCDIR && source SOURCEME_McClintock_2.0.0



First clone src to $PREFIX/ and create `conda env`

   cd $PREFIX
   mkdir envs
   export CONDA_ENVS_PATH=$PREFIX/envs
   git clone https://github.com/bergmanlab/mcclintock
   cd mcclintock
   mamba env create -f install/envs/mcclintock.yml --name mcclintock

There is a missing dependency in the environment.yml file for ngs_te_mapper.
Before installing edit `$PREFIX/mcclintock/install/envs/mcc_ngs_te_mapper.yml`
to include `gfortran_linux-64`. Then do


    python3 mcclintock.py --install 


