Amber/18-GPU
========================

<https://ambermd.org>

Used under license:
licensed software, please check https://ambermd.org/GetAmber.php for more information

Structure creating script (makeroom_Amber_18-GPU.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/Amber/makeroom_18-GPU.sh

LOG
---

    TOOL=Amber
    VERSION=18-GPU
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -t "Amber" -v "18-GPU" -w "https://ambermd.org" -c "apps" -l "licensed software\, please check https://ambermd.org/GetAmber.php for more information" -d "Amber is a suite of biomolecular simulation programs." -x "INSTALL" -f "''"
    ./makeroom_Amber_18-GPU.sh

# EasyBuild installation of Amber18
    export EASYBUILD_PREFIX=/sw/EasyBuild/$Cluster
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.2.0
    cd /sw/EasyBuild/$Cluster/software/EasyBuild/4.2.0/easybuild/easyconfigs/a/Amber/
    eb --module-depends-on --module-syntax=Lua --robot Amber-18-fosscuda-2018b-AmberTools-18-patchlevel-10-8.eb
# fix "amber" group permissions
