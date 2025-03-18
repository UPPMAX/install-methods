skewer/0.2.2
============

<https://github.com/relipmoc/skewer>

Used under license:
MIT
<https://github.com/relipmoc/skewer?tab=MIT-1-ov-file#readme>

Structure creating script (makeroom_skewer_0.2.2.sh) moved to /sw/bioinfo/skewer/makeroom_0.2.2.sh

LOG
---

    makeroom.sh -t skewer -v 0.2.2 -w https://github.com/relipmoc/skewer -d "skewer (transferred from https://sourceforge.net/projects/skewer) implements the bit-masked k-difference matching algorithm dedicated to the task of adapter trimming and it is specially designed for processing next-generation sequencing (NGS) paired-end sequences." -l MIT -L https://github.com/relipmoc/skewer?tab=MIT-1-ov-file#readme -c bioinfo -s misc
    ./makeroom_skewer_0.2.2.sh 
    source /sw/bioinfo/skewer/SOURCEME_skewer_0.2.2
    cd $SRCDIR
    git clone --recursive https://github.com/relipmoc/skewer
    cd skewer/
    ml gcc/8.4.0
    make
    cp -av skewer $PREFIX/
    cd $PREFIX/
    ml purge
    ldd skewer 
    cd ../../mf
    vi 0.2.2 
    ./skewer-0.2.2_post-install.sh 
    history >> skewer-0.2.2_install-README.md 
