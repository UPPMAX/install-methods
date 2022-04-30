CROP/1.33
========================

<https://github.com/tingchenlab/CROP>

Used under license:
Other-d


Structure creating script (makeroom_CROP_1.33.sh) moved to /sw/bioinfo/CROP/makeroom_1.33.sh

LOG
---

  TOOL=CROP
  VERSION=1.33
  mkdir $TOOL
  cd $TOOL

  makeroom.sh -t $TOOL -v $VERSION   -w "https://github.com/tingchenlab/CROP"  -c "bioinfo" -s "misc" -l "Other"-d "Clustering 16s rRNA for OTU Prediction"   -f


  ./makeroom_${TOOL}_${VERSION}.sh
  source SOURCEME_${TOOL}_${VERSION}
    
  cd $SRCDIR
  module load python/3.9.5
  module load gcc/9.3.0
  ml git/2.34.1

  git clone https://github.com/tingchenlab/CROP
  cd CROP
  make
  mv CROPLinux $PREFIX/CROP
