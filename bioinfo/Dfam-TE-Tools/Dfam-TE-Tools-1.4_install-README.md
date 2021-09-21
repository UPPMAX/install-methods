Dfam-TE-Tools/1.4
========================

<https://github.com/Dfam-consortium/TETools>

Used under license:
CC0 1.0 Universal


Structure creating script (makeroom_Dfam-TE-Tools_1.4.sh) moved to /sw/bioinfo/Dfam-TE-Tools/makeroom_1.4.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "Dfam-TE-Tools" -v "1.4" -s "annotation" -d "Dfam TE Tools includes RepeatMasker\, RepeatModeler\, and coseg." -w "https://github.com/Dfam-consortium/TETools" -l "CC0 1.0 Universal"
    ./makeroom_Dfam-TE-Tools_1.4.sh
    source /sw/bioinfo/Dfam-TE-Tools/SOURCEME_Dfam-TE-Tools_1.4 && cd $TOOLDIR

    cd $SRCDIR
    wget https://github.com/Dfam-consortium/TETools/archive/refs/tags/1.4.tar.gz
    tar xfvz 1.4.tar.gz --strip 1 -C $PREFIX
    cd $PREFIX
    singularity build dfam-tetools_1.4.sif docker://dfam/tetools:1.4


