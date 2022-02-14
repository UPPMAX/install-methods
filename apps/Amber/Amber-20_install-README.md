Amber/20
========================

<https://ambermd.org>

Used under license:
licensed software\, please check https://ambermd.org/GetAmber.php for more information


Structure creating script (makeroom_Amber_20.sh) moved to /sw/apps/Amber/makeroom_20.sh

LOG
---

    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh "-f" "-t" "Amber" "-v" "20" "-w" "https://ambermd.org" "-c" "apps" "-l" "licensed software\, please check https://ambermd.org/GetAmber.php for more information" "-d" "Amber is a suite of biomolecular simulation programs." "-u" "rackham"
    ./makeroom_Amber_20.sh
---

    TOOL=Amber
    VERSION=20
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER

# EasyBuild installation of Amber20
    export EASYBUILD_PREFIX=/sw/EasyBuild/$CLUSTER
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.5.2
    cd /sw/EasyBuild/$CLUSTER/software/EasyBuild/4.5.2/easybuild/easyconfigs/a/Amber/
    eb --module-depends-on --module-syntax=Lua --robot Amber-20.11-foss-2020b-AmberTools-21.3.eb
# fix "amber" group permissions
