Amber/16-GPU
========================

<https://ambermd.org>

Used under license:
licensed software, please check https://ambermd.org/GetAmber.php for more information

Structure creating script (makeroom_Amber_16-GPU.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/Amber/makeroom_16-GPU.sh

LOG
---

    TOOL=Amber
    VERSION=16-GPU
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -t "Amber" -v "16-GPU" -w "https://ambermd.org" -c "apps" -l "licensed software\, please check https://ambermd.org/GetAmber.php for more information" -d "Amber is a suite of biomolecular simulation programs." -x "INSTALL" -f "''"
    ./makeroom_Amber_16-GPU.sh

# EasyBuild installation of Amber16
# The EasyBuild installation has to be done via a submitted job, the GPU cores are not visible by dafault.
    export EASYBUILD_PREFIX=/sw/EasyBuild/$Cluster
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.2.0
    cd /sw/EasyBuild/$Cluster/software/EasyBuild/4.2.0/easybuild/easyconfigs/a/Amber/
    eb --module-depends-on --module-syntax=Lua --robot Amber-16-fosscuda-2018b-AmberTools-17-patchlevel-10-15.eb
# The *eb file had to be modified due to a wrong checksum and a missing build dependency.
# fix "amber" group permissions
