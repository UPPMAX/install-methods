metaMATE/20220327-3cdacd7
========================

<https://github.com/tjcreedy/metamate>

Used under license:
Other-d


Structure creating script (makeroom_metaMATE_20220327-3cdacd7.sh) moved to /sw/bioinfo/metaMATE/makeroom_20220327-3cdacd7.sh

LOG
---

  TOOL=metaMATE
  VERSION=20220327-3cdacd7
  mkdir $TOOL
  cd $TOOL

  makeroom.sh -t $TOOL -v $VERSION   -w "https://github.com/tjcreedy/metamate"  -c "bioinfo" -s "misc" -l "Other"-d "metaMATE (metabarcoding Multiple Abundance Threshold Evaluator) analyses a set of amplicons derived through metabarcoding of a mitochondrial coding locus to determine putative NUMT and other erroneous sequences based on relative read abundance thresholds within libraries, phylogenetic clades and/or taxonomic groupings."   -f




  ./makeroom_${TOOL}_${VERSION}.sh
  source SOURCEME_${TOOL}_${VERSION}
    
  module load python/3.9.5
  module load gcc/9.3.0

   cd $SRCDIR


  PYTHONUSERBASE=$PREFIX pip install metaMATE
