OpenFOAM/7
========================

<https://www.openfoam.org/>

Used under license:
GNU GPLv3

Structure creating script (makeroom_OpenFOAM_7.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/OpenFOAM/makeroom_7.sh

LOG
---

    TOOL=OpenFOAM
    VERSION=7
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -t "OpenFOAM" -v "7" -w "https://www.openfoam.org/" -c "apps" -l "GNU GPLv3" -d "OpenFOAM is a free\, open source computational fluid  software package. \nOpenFOAM has an extensive range of features to solve anything from complex fluid flows \ninvolving chemical reactions\, turbulence and heat transfer\, \nto solid dynamics and electromagnetics." -x "INSTALL" -f "''"
    ./makeroom_OpenFOAM_7.sh

# EasyBuild installation of OpenFOAM/7
    export EASYBUILD_PREFIX=/sw/EasyBuild/$Cluster
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.2.0
    cd /sw/EasyBuild/$Cluster/software/EasyBuild/4.2.0/easybuild/easyconfigs/o/OpenFOAM/
    eb --module-depends-on --module-syntax=Lua --robot --umask=002 OpenFOAM-7-foss-2019b.eb

