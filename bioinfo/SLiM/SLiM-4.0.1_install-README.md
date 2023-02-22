SLiM/4.0.1
========================

<https://messerlab.org/slim/>

Used under license:
GPL v3 license


Structure creating script (makeroom_SLiM_4.0.1.sh) moved to /sw/bioinfo/SLiM/makeroom_4.0.1.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "SLiM" "-v" "4.0.1" "-w" "https://messerlab.org/slim/" "-c" "bioinfo" "-l" "GPL v3 license" "-d" "An evolutionary simulation framework that combines a powerful engine for population genetic simulations with the capability of modeling arbitrarily complex evolutionary scenarios." "-x" "INSTALL" "-f"
    ./makeroom_SLiM_4.0.1.sh
SLiM/3.6
========================

<https://messerlab.org/slim/>

Used under license:
GPL v3 license
<>

Structure creating script (makeroom_SLiM_3.6.sh) moved to /sw/bioinfo/SLiM/makeroom_3.6.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "SLiM" -v "3.6" -w "https://messerlab.org/slim/" -c "bioinfo" -l "GPL v3 license" -d "An evolutionary simulation framework that combines a powerful engine for population genetic simulations with the capability of modeling arbitrarily complex evolutionary scenarios." -x "INSTALL" -f
    ./makeroom_SLiM_3.6.sh


Builds with cmake, but requires special settings for `CMAKE_AR` and `CMAKE_RANLIB` when link-time optimisation is enabled.

    . SOURCEME_SLiM_3.6    
    PREFIX=$PWD/$CLUSTER
    cd $SRCDIR
    wget https://github.com/MesserLab/SLiM/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz
    cd SLiM-${VERSION}
    module load cmake/3.13.2 gcc/9.3.0
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_AR=$(which gcc-ar) -DCMAKE_RANLIB=$(which gcc-ranlib) ..
    make
    make install

Now check to see if it can find libraries, and test the tools.

    module unload cmake gcc
    cd $PREFIX/bin
    ldd *
    ./slim -u
    ./slim -testEidos
    ./slim -testSLiM

