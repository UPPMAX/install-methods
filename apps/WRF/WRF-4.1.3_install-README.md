WRF/4.1.3
========================

<http://www.wrf-model.org>

Used under license:
#Custom open-source AS IS

Structure creating script (makeroom_WRF_4.1.3.sh) moved to /sw/apps/WRF/makeroom_4.1.3.sh

LOG
---

    TOOL=WRF
    VERSION=4.1.3
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/WRF/4.1.3/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "WRF" -v "4.1.3" -w "http://www.wrf-model.org" -c "apps" -d "The Weather Research and Forecasting \(WRF\) Model is a next-generation mesoscale numerical weather prediction system designed to serve both operational forecasting and atmospheric research needs." -u "rackham snowy" -x "INSTALL"
    ./makeroom_WRF_4.1.3.sh

# EasyBuild installation of WRF4.1.3

    export EASYBUILD_PREFIX=/sw/EasyBuild/$Cluster
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.3.0
    export INTEL_LICENSE_FILE=/sw/comp/intel/licenses

#   cd /sw/EasyBuild/$Cluster/software/EasyBuild/4.3.0/easybuild/easyconfigs/w/WRF/
   eb --module-depends-on --module-syntax=Lua --robot --umask=002 WRF-4.1.3-intel-2019b-dmpar.eb

