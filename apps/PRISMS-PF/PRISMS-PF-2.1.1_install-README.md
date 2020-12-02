PRISMS-PF/2.1.1
========================

<http://prisms-center.github.io/phaseField/>

Used under license:
Lesser GPL license
<>

Structure creating script (makeroom_PRISMS-PF_2.1.1.sh) moved to /sw/apps/PRISMS-PF/makeroom_2.1.1.sh

LOG
---

    TOOL=PRISMS-PF
    VERSION=2.1.1
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/PRISMS-PF/2.1.1/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "PRISMS-PF" -v "2.1.1" -w "http://prisms-center.github.io/phaseField/" -c "apps" -l "Lesser GPL license" -d "PRISMS-PF is a powerful, massively parallel finite element code for conducting phase field and other related simulations of microstructural evolution." -u "rackham" -x "INSTALL" -f
    ./makeroom_PRISMS-PF_2.1.1.sh

# EasyBuild installation of WRF4.1.3

    export EASYBUILD_PREFIX=/sw/EasyBuild/$Cluster
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.3.0
    export INTEL_LICENSE_FILE=/sw/comp/intel/licenses

#   cd /sw/EasyBuild/$Cluster/software/EasyBuild/4.3.0/easybuild/easyconfigs/w/WRF/
    eb --module-depends-on --module-syntax=Lua --robot --umask=002 PRISMS-PF-2.1.1-intel-2019a.eb

