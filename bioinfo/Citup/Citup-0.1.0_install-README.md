Citup/0.1.0
========================

<https://github.com/amcpherson/citup>

Used under license:
Other-d


Structure creating script (makeroom_Citup_0.1.0.sh) moved to /sw/bioinfo/Citup/makeroom_0.1.0.sh

LOG
---

    TOOL=Citup
    VERSION=0.1.0
    mkdir $TOOL
    cd $TOOL

    makeroom.sh -t $TOOL -v $VERSION   -w "https://github.com/amcpherson/citup"  -c "bioinfo" -s "misc" -l "Other"-d "Citup estimates the clone phylogeny and clonal genotypes for deep sequencing of SNVs in multiple tumour biopsies."   -f

  ./makeroom_${TOOL}_${VERSION}.sh
   source SOURCEME_${TOOL}_${VERSION}
    
   module load conda/latest
   module load gcc/11.2.0
   module load git/2.34.1

   cd $PREFIX
   export CONDA_ENVS_PATH=$PREFIX
   mamba create -n citup_env cplex
   conda activate citup_env
   source activate citup_env
   mamba install citup
   pip install decorator==4.3.0

