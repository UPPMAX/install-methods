Amber/20-GPU
========================

<https://ambermd.org>

Used under license:
licensed software\, please check https://ambermd.org/GetAmber.php for more information


Structure creating script (makeroom_Amber_20-GPU.sh) moved to /sw/apps/Amber/makeroom_20-GPU.sh

LOG
---

    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh "-f" "-t" "Amber" "-v" "20-GPU" "-w" "https://ambermd.org" "-c" "apps" "-l" "licensed software\, please check https://ambermd.org/GetAmber.php for more information" "-d" "Amber is a suite of biomolecular simulation programs."
    ./makeroom_Amber_20-GPU.sh
---

    TOOL=Amber
    VERSION=20-GPU
    CLUSTER=snowy
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER

# EasyBuild installation of Amber20
# The EasyBuild installation has to be done via a submitted job, the GPU cores are not visible by default.
    export EASYBUILD_PREFIX=/sw/EasyBuild/snowy-gpu
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.5.2
    cd /sw/EasyBuild/snowy-gpu/software/EasyBuild/4.5.2/easybuild/easyconfigs/a/Amber/
    eb --module-depends-on --module-syntax=Lua --robot Amber-20.11-fosscuda-2020b-AmberTools-21.3.eb
# fix "amber" group permissions
