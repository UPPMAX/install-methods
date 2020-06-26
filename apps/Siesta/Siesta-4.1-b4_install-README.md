Siesta/4.1-b4
========================

<https://gitlab.com/siesta-project/siesta>

Used under license:
GNU GPLv3

Structure creating script (makeroom_Siesta_4.1-b4.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/Siesta/makeroom_4.1-b4.sh

LOG
---

    TOOL=Siesta
    VERSION=4.1-b4
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -t "Siesta" -v "4.1-b4" -w "https://gitlab.com/siesta-project/siesta" -c "apps" -l "GNU GPLv3" -d "SIESTA is both a method and its computer program implementation\, to perform efficient electronic structure calculations and ab initio molecular dynamics simulations of molecules and solids." -x "INSTALL" -f "''"
    ./makeroom_Siesta_4.1-b4.sh

# EasyBuild installation of Siesta

    export EASYBUILD_PREFIX=/sw/EasyBuild/$Cluster
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.1.2
    export INTEL_LICENSE_FILE=/sw/comp/intel/licenses

#   cd /sw/EasyBuild/$Cluster/software/EasyBuild/4.1.2/easybuild/easyconfigs/s/Siesta/
   eb --module-depends-on --module-syntax=Lua --robot --umask=002 Siesta-4.1-b4-intel-2018b.eb

