CRABS/0.1.2
========================

<https://github.com/gjeunen/reference_database_creator>

Used under license:
MIT License-d


Structure creating script (makeroom_CRABS_0.1.2.sh) moved to /sw/bioinfo/CRABS/makeroom_0.1.2.sh

LOG
---

TOOL=CRABS
VERSION=0.1.2

makeroom.sh -t $TOOL -v $VERSION   -w "https://github.com/gjeunen/reference_database_creator"  -c "bioinfo" -s "misc" -l "MIT License"-d "CRABS (Creating Reference databases for Amplicon-Based Sequencing) is a versatile software program that generates curated reference databases for metagenomic analysis."   -f


./makeroom_${TOOL}_${VERSION}.sh
 source SOURCEME_${TOOL}_${VERSION}
    
module load conda/latest

   cd $PREFIX

export CONDA_ENVS_PATH=$PREFIX

conda create -n crabs_env crabs
