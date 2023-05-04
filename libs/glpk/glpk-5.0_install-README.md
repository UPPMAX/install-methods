glpk/5.0
========

<https://www.gnu.org/software/glpk/>

Used under license:
GPL v3


Structure creating script (makeroom_glpk_5.0.sh) moved to /sw/libs/glpk/makeroom_5.0.sh

LOG
---

    makeroom.sh "-f" "-c" "libs" "-t" "glpk" "-v" "5.0" "-w" "https://www.gnu.org/software/glpk/" "-d" "The GLPK (GNU Linear Programming Kit) package is intended for solving large-scale linear programming (LP), mixed integer programming (MIP), and other related problems" "-l" "GPL v3"
    ./makeroom_glpk_5.0.sh

    source /sw/libs/glpk/SOURCEME_glpk_5.0
    cd $SRCDIR


    wget http://ftp.gnu.org/gnu/glpk/glpk-$VERSION.tar.gz
    tar xf glpk-$VERSION.tar.gz
    cd glpk-$VERSION
    ./configure --prefix=$PREFIX
    make -j10
    make check && make install

