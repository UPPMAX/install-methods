lpsolve/5.5.2.9
===============

<https://sourceforge.net/projects/lpsolve/>

Used under license:
LGPL v2

Structure creating script (makeroom_lpsolve_5.5.2.9.sh) moved to /sw/libs/lpsolve/makeroom_5.5.2.9.sh

LOG
---

    TOOL=lpsolve
    VERSION=5.5.2.9
    makeroom.sh -f -t $TOOL -v $VERSION -c "libs" -w "https://sourceforge.net/projects/lpsolve/" -d "Mixed integer linear programming solver" -l "LGPL v2"
    ./makeroom_lpsolve_5.5.2.5.sh
    cd /sw/libs/lpsolve
    source SOURCEME_lpsolve_5.5.2.9 
    cd $SRCDIR

    wget https://downloads.sourceforge.net/project/lpsolve/lpsolve/5.5.2.9/README.txt
    wget https://downloads.sourceforge.net/project/lpsolve/lpsolve/5.5.2.9/lp_solve_5.5.2.9_source.tar.gz
    tar xzf lp_solve_5.5.2.9_source.tar.gz
    wget https://downloads.sourceforge.net/project/lpsolve/lpsolve/5.5.2.9/lp_solve_5.5.2.9_bfp_LUSOL_source.tar.gz
    tar xzvf lp_solve_5.5.2.9_bfp_LUSOL_source.tar.gz 
    wget https://downloads.sourceforge.net/project/lpsolve/lpsolve/5.5.2.9/lp_solve_5.5.2.9_doc.tar.gz

Build bfp first.  Match gcc and openmpi to boost openmpi version.

    module load gcc/9.1.0
    module load openmpi/3.1.3

    cd lp_solve_5.5/

    cd bfp/
    cd bfp_LUSOL/
    bash ccc
    cd ../..

    cd lpsolve55/
    bash ccc
    cd ..

    cd lp_solve/
    bash ccc
    cd ..

    install -d $PREFIX/{bin,lib,include/lpsolve,share/doc/lpsolve-5.5.2.9}
    install -m 775 lp_solve/bin/ux*/lp_solve $PREFIX/bin/
    install -m 775 lpsolve55/bin/ux*/liblpsolve55.{a,so} $PREFIX/lib/
    install -m 664 lp*.h $PREFIX/include/lpsolve/

Install docs

    cd ..
    mkdir doc
    cd doc
    tar xzf ../lp_solve_5.5.2.9_doc.tar.gz
    rsync -Pa * $PREFIX/share/doc/lpsolve/5.5.2.9/
