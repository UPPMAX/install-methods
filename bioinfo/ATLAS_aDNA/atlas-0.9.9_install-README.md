atlas/0.9.9
========================

<https://bitbucket.org/wegmannlab/atlas/wiki/Home>

Used under license:
Other


Structure creating script (makeroom_atlas_0.9.9.sh) moved to /sw/bioinfo/atlas/makeroom_0.9.9.sh

LOG
---

    TOOL=atlas      
    VERSION=0.9.9

    makeroom.sh -t $TOOL -v $VERSION -w "https://bitbucket.org/wegmannlab/atlas/wiki/Home" -c "bioinfo" -l "Other" -d "ATLAS stands for Analysis Tools for Low-coverage and Ancient Samples. These tools cover all programs necessary to obtain variant calls, estimates of heterozygosity and more from a BAM file." -s "misc" -f

    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}
    
   cd $SRCDIR
   
   module load Armadillo/9.700.2

   
  git clone --depth 1 https://bitbucket.org/WegmannLab/atlas.git
   
   cd atlas

   make
   mkdir $PREFIX/bin
   mv atlas $PREFIX/bin/
