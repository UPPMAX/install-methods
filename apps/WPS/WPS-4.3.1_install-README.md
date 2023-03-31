WPS/4.3.1
========================

<http://www.wrf-model.org>

Used under license:



Structure creating script (makeroom_WPS_4.3.1.sh) moved to /sw/apps/WPS/makeroom_4.3.1.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "WPS" "-v" "4.3.1" "-w" "http://www.wrf-model.org" "-c" "apps" "-d" "WRF Preprocessing System \(WPS\) for WRF. The Weather Research and Forecasting \(WRF\) Model is a next-generation mesoscale numerical weather prediction system designed to serve both operational forecasting and atmospheric research needs." "-u" "rackham snowy" "-x" "INSTALL" "-f"
    ./makeroom_WPS_4.3.1.sh
WPS/4.1
========================

<http://www.wrf-model.org>

Used under license:


Structure creating script (makeroom_WPS_4.1.sh) moved to /sw/apps/WPS/makeroom_4.1.sh

LOG
---

    TOOL=WPS
    VERSION=4.1
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/WPS/4.1/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "WPS" -v "4.1" -w "http://www.wrf-model.org" -c "apps" -d "WRF Preprocessing System \(WPS\) for WRF. The Weather Research and Forecasting \(WRF\) Model is a next-generation mesoscale numerical weather prediction system designed to serve both operational forecasting and atmospheric research needs." -u "rackham snowy" -x "INSTALL" 
    ./makeroom_WPS_4.1.sh

# EasyBuild installation of WPS4.1

    export EASYBUILD_PREFIX=/sw/EasyBuild/$Cluster
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.3.0
    export INTEL_LICENSE_FILE=/sw/comp/intel/licenses

#   cd /sw/EasyBuild/$Cluster/software/EasyBuild/4.3.0/easybuild/easyconfigs/w/WPS/
   eb --module-depends-on --module-syntax=Lua --robot --umask=002 WPS-4.1-intel-2019b-dmpar.eb


