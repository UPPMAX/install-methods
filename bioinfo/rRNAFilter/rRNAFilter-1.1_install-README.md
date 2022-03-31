rRNAFilter/1.1
========================

<http://hulab.ucf.edu/research/projects/rRNAFilter/rRNAFilter.html>

Used under license:
Other


Structure creating script (makeroom_rRNAFilter_1.1.sh) moved to /sw/bioinfo/rRNAFilter/makeroom_1.1.sh

LOG
---

    TOOL=rRNAFilter
    VERSION=1.1

    makeroom.sh -t $TOOL -v $VERSION -w "http://hulab.ucf.edu/research/projects/rRNAFilter/rRNAFilter.html" -c "bioinfo" -l "Other" -d "rRNAFilter is a novel taxonomy-independent approach which can accurately and rapidly filter rRNA sequences from metatranscirptomes without the aid of reference rRNA databases." -s "misc" -f

    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR
   
  
    wget http://hulab.ucf.edu/research/projects/rRNAFilter/software/rRNAFilter.zip
    unzip rRNAFilter.zip

    mv rRNAFilter $PREFIX/bin
