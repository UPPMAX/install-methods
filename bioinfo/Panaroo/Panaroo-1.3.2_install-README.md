Panaroo/1.3.2
========================

<http://>

Used under license:
MIT


Structure creating script (makeroom_Panaroo_1.3.2.sh) moved to /sw/bioinfo/Panaroo/makeroom_1.3.2.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "Panaroo" "-v" "1.3.2" "-c" "bioinfo" "-s" "pipelines" "-l" "MIT" "-d" "An updated pipeline for pangenome investigation." "-f"
    ./makeroom_Panaroo_1.3.2.sh


    TOOL    =Panaroo
    VERSION =1.3.2

# Download
    cd $SRCDIR
    wget https://github.com/gtonkinhill/panaroo/archive/refs/tags/v1.3.2.tar.gz
    tar xfvz v1.3.2.tar.gz  --strip-components=1

# Load modules
    module load bioinfo-tools
    module load MAFFT/7.407
    module load cd-hit/4.8.1
    module load python/3.10.8
    
# Install
    PYTHONUSERBASE=$PREFIX pip -user install .



Panaroo/1.2.10
========================

<https://github.com/gtonkinhill/panaroo>

Used under license:
MIT License-d


Structure creating script (makeroom_Panaroo_1.2.10.sh) moved to /sw/bioinfo/Panaroo/makeroom_1.2.10.sh

LOG
---

TOOL=Panaroo
VERSION=1.2.10

makeroom.sh -t $TOOL -v $VERSION   -w "https://github.com/gtonkinhill/panaroo"  -c "bioinfo" -s "pipelines" -l "MIT License"-d "An updated pipeline for pangenome investigation."   -f


./makeroom_${TOOL}_${VERSION}.sh
 source SOURCEME_${TOOL}_${VERSION}
    
module load conda/latest

   cd $PREFIX

export CONDA_ENVS_PATH=$PREFIX

conda create -n panaroo_env panaroo
