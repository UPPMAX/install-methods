lpsolve/5.5.2.5
========================

<https://sourceforge.net/projects/lpsolve/>

Used under license:
LGPL v2

Structure creating script (makeroom_lpsolve_5.5.2.5.sh) moved to /sw/libs/lpsolve/makeroom_5.5.2.5.sh

There are two things here: the lpsolve55 libraries, which do not seem to need
header files ?  And the lp_solve prebuilt executable and shared libraries.  We
are installing the libraries at `$PREFIX/bin/ux64/` and the executables and
shared libraries at `$PREFIX/bin/`.

LOG
---

    TOOL=lpsolve
    VERSION=5.5.2.5
    makeroom.sh -f" -t "lpsolve" -v "5.5.2.5" -c "libs" -w "https://sourceforge.net/projects/lpsolve/" -d "Mixed integer linear programming solver" -l "LGPL v2"
    ./makeroom_lpsolve_5.5.2.5.sh
    cd /sw/libs/lpsolve
    cd $VERSION

    cd src/
    wget https://sourceforge.net/projects/lpsolve/files/lpsolve/5.5.2.5/lp_solve_5.5.2.5_source.tar.gz/download
    mv download lp_solve_5.5.2.5_source.tar.gz
    tar xzf lp_solve_5.5.2.5_source.tar.gz 
    cd lp_solve_5.5/
    cd lpsolve55/
    module load gcc/8.3.0
    bash ccc

This creates `liblpsolve55.so` and `liblpsolve55.a` in `bin/ux64/`, so copy them to the prefix.

    cp -av bin $PREFIX/

Get executables.

    wget https://downloads.sourceforge.net/project/lpsolve/lpsolve/5.5.2.5/lp_solve_5.5.2.5_exe_ux64.tar.gz
    tar xzvf lp_solve_5.5.2.5_exe_ux64.tar.gz
    mv lib*.so lp_solve $PREFIX/bin/

