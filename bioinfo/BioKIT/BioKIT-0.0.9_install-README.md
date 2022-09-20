BioKIT/0.0.9
========================

<https://github.com/JLSteenwyk>

Used under license:
Other-d


Structure creating script (makeroom_BioKIT_0.0.9.sh) moved to /sw/bioinfo/BioKIT/makeroom_0.0.9.sh

LOG
---

TOOL=BioKIT
VERSION=0.0.9

makeroom.sh -t $TOOL -v $VERSION   -w "https://github.com/JLSteenwyk"  -c "bioinfo" -s "misc" -l "Other"-d "BioKIT, a versatile toolkit for processing or conducting analyses on alignments, coding sequences, fastq files, and genome files."   -f


./makeroom_${TOOL}_${VERSION}.sh
 source SOURCEME_${TOOL}_${VERSION}
    
module load conda/latest

   cd $PREFIX

export CONDA_ENVS_PATH=$PREFIX
conda config --add channels jlsteenwyk
conda create -n biokit_env jlsteenwyk-biokit

