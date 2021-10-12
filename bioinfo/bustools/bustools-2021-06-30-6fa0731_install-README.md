bustools/2021-06-30-6fa0731
========================

<https://github.com/BUStools/bustools>

Used under license:
BSD 2-Clause


Structure creating script (makeroom_bustools_2021-06-30-6fa0731.sh) moved to /sw/bioinfo/bustools/makeroom_2021-06-30-6fa0731.sh

LOG
---
    COMMIT=6fa0731

    /home/niharika/install-methods/makeroom.sh -f" -c "bioinfo" -t "bustools" -v "2021-06-30-6fa0731" -s "misc" -l "BSD 2-Clause" -w "https://github.com/BUStools/bustools" -d "Bustools is a program for manipulating BUS files for single cell RNA-Seq datasets"
    ./makeroom_bustools_2021-06-30-$COMMIT.sh

    cd $SRCDIR
    module load git/2.28.0
    module load perl/5.26.2
    module load gcc/9.3.0
    module load cmake/3.17.3
    git clone https://github.com/BUStools/bustools.git
    cd bustools
    git reset --hard $COMMIT

    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX ..
    make
    make install




    
