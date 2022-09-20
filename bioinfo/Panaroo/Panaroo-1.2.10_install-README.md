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
