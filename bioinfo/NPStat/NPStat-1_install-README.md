NPStat/1
========================

<https://github.com/lucaferretti/npstat>

Used under license:
GPL v3 license
<>

Structure creating script (makeroom_NPStat_1.sh) moved to /sw/bioinfo/NPStat/makeroom_1.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "NPStat" -v "1" -w "https://github.com/lucaferretti/npstat" -c "bioinfo" -l "GPL v3 license" -d "Population genetics tests and estimators for pooled NGS data" -x "INSTALL" -s "misc"
    ./makeroom_NPStat_1.sh
    . SOURCEME_NPStat_1
    cd $SRCDIR
    git clone https://github.com/lucaferretti/npstat
    cd npstat/
    ml gsl/2.6
    ml gcc/8.3.0
    vi Makefile
    make
    cp npstat $PREFIX
    cd $PREFIX
    ml -gcc -gsl
    ./npstat
    ldd npstat

