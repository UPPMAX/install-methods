VIBRANT/1.2.1
========================

<https://github.com/AnantharamanLab/VIBRANT>

Used under license:
GNU General Public License


Structure creating script (makeroom_VIBRANT_1.2.1.sh) moved to /sw/bioinfo/VIBRANT/makeroom_1.2.1.sh

LOG
---

    TOOL=VIBRANT
    VERSION=1.2.1

    makeroom.sh -f -t $TOOL -v $VERSION -s annotation -w https://github.com/AnantharamanLab/VIBRANT -l 'GNU General Public License' -d 'Virus Identification By iteRative ANnoTation'

    ./makeroom_VIBRANT_1.2.1.sh

    source SOURCEME_VIBRANT_1.2.1

    cd $PREFIX

    wget https://github.com/AnantharamanLab/VIBRANT/archive/refs/tags/v1.2.1.tar.gz
    tar xvf v1.2.1.tar.gz 
    cd VIBRANT-1.2.1/

    module load conda/latest
    export CONDA_ENVS_PATH=$PREFIX
    conda create -n vib_env -c bioconda vibrant==1.2.1
    source activate vib_env

    pip install numpy==1.19

    download-db.sh

