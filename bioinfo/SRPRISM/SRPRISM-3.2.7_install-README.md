SRPRISM/3.2.7
========================

<https://github.com/ncbi/SRPRISM>

Used under license:
Public domain


Structure creating script (makeroom_SRPRISM_3.2.7.sh) moved to /sw/bioinfo/SRPRISM/makeroom_3.2.7.sh

LOG
---

    TOOL=SRPRISM
    VERSION=3.2.7

    makeroom.sh -t $TOOL -v $VERSION -w "https://github.com/ncbi/SRPRISM" -c "bioinfo" -l "Public domain" -d "Single Read Paired Read Indel Substitution Minimizer" -s "misc" -f

    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

   module load git/2.34.1
    module load gcc/11.2.0
    module load  cmake/3.22.2

   cd $SRCDIR
   git clone https://github.com/ncbi/SRPRISM
   cd srprism
   make
   rmdir $PREFIX
   mv srprism $PREFIX
