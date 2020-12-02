SweeD/4.0.0
========================

<https://github.com/alachins/sweed>

Used under license:
GPL v3 license
<>

Structure creating script (makeroom_SweeD_4.0.0.sh) moved to /sw/bioinfo/SweeD/makeroom_4.0.0.sh

LOG
---

    TOOL=SweeD
    VERSION=4.0.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/SweeD/4.0.0/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "SweeD" -v "4.0.0" -w "http://pop-gen.eu/wordpress/software/sweed" -c "bioinfo" -l "GPL v3 license" -d "Likelihood-based Selective Sweep Detection" -s "misc" -x "INSTALL"
    ./makeroom_SweeD_4.0.0.sh
    cd $SRCDIR
    git clone https://github.com/alachins/sweed
    cd sweed
    ml gcc/9.3.0
    make -f Makefile.gcc
    ./compile_rename_ALL.sh
    ml unload gcc
    cp SweeD ../../rackham/
    cp SweeD-MPFR ../../rackham/
    cp SweeD-MPFR-P ../../rackham/
    cp SweeD-P ../../rackham/
    cp sweed3.0_manual.pdf ../../rackham/


