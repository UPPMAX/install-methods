StainedGlass/0.4
========================

<https://github.com/mrvollger/StainedGlass>

Used under license:
MIT License


Structure creating script (makeroom_StainedGlass_0.4.sh) moved to /sw/bioinfo/StainedGlass/makeroom_0.4.sh

LOG
---


    TOOL=StainedGlass
    VERSION=0.4

    makeroom.sh -t $TOOL -v $VERSION -w "https://github.com/mrvollger/StainedGlass" -c "bioinfo" -l "MIT License" -d "This is a repository for making colorful identity heatmaps of genomic sequence." -s "pipelines" -f

    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

 
    PYTHONUSERBASE=$PREFIX pip install --user  install numba cooler snakefmt

   cd $SRCDIR
   wget https://github.com/mrvollger/StainedGlass/archive/refs/tags/v0.4.tar.gz
   tar xvf /v0.4.tar.gz
   mv StainedGlass-0.4 $PREFIX
