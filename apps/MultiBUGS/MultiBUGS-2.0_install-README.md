MultiBUGS/2.0
========================

<https://www.multibugs.org/>

Used under license:
LGPL v3.0


Structure creating script (makeroom_MultiBUGS_2.0.sh) moved to /sw/apps/MultiBUGS/makeroom_2.0.sh

LOG
---

Comes precompiled, just load gcc/9.3.0 and openmpi/3.1.5 in the mf file to satisfy its requirements.


    makeroom.sh "-t" "MultiBUGS" "-v" "2.0" "-c" "apps" "-w" "https://www.multibugs.org/" "-d" "MultiBUGS is a software package for performing Bayesian inference. It builds on the existing algorithms and tools in OpenBUGS and WinBUGS, and so is applicable to the broad range of statistical models that can be fitted using BUGS-language software, but automatically parallelises the MCMC algorithm to dramatically speed up computation." "-l" "LGPL v3.0"
    ./makeroom_MultiBUGS_2.0.sh
    cd $SRCDIR

    wget https://github.com/MultiBUGS/MultiBUGS/releases/download/v2.0/multibugs_2.0.tar.gz
    tar xf multibugs_2.0.tar.gz
    rmdir $PREFIX
    mv multibugs $PREFIX

Add $modroot to PATH and make sure to load gcc/9.3.0 and openmpi/3.1.5 in the mf file.
