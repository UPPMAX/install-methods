WRF/4.3.0-dm-gcc
========================

<https://www.mmm.ucar.edu/weather-research-and-forecasting-model>

Used under license:
Custom open-source AS IS


Structure creating script (makeroom_WRF_4.3.0-dm-gcc.sh) moved to /sw/apps/WRF/makeroom_4.3.0-dm-gcc.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "WRF" "-v" "4.3.0-dm-gcc" "-w" "https://www.mmm.ucar.edu/weather-research-and-forecasting-model" "-c" "apps" "-l" "Custom open-source AS IS" "-d" "The Weather Research and Forecasting \(WRF\) Model is a next-generation mesoscale numerical weather prediction system designed to serve both operational forecasting and atmospheric research needs." "-u" "rackham snowy" "-x" "INSTALL" "-f"
    ./makeroom_WRF_4.3.0-dm-gcc.sh
WRF/4.1.3-dm+sm
========================

<https://www.mmm.ucar.edu/weather-research-and-forecasting-model>

Used under license:
Custom open-source AS IS
<>

Structure creating script (makeroom_WRF_4.1.3-dm+sm.sh) moved to /sw/apps/WRF/makeroom_4.1.3-dm+sm.sh

LOG
---

    TOOL=WRF
    VERSION=4.1.3-dm+sm
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/WRF/4.1.3-dm+sm/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "WRF" -v "4.1.3-dm+sm" -w "https://www.mmm.ucar.edu/weather-research-and-forecasting-model" -c "apps" -l "Custom open-source AS IS" -d "The Weather Research and Forecasting \(WRF\) Model is a next-generation mesoscale numerical weather prediction system designed to serve both operational forecasting and atmospheric research needs." -u "rackham snowy" -x "INSTALL" -f
    ./makeroom_WRF_4.1.3-dm+sm.sh

# EasyBuild installation of WRF4.1.3

    export EASYBUILD_PREFIX=/sw/EasyBuild/$Cluster
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.3.0
    export INTEL_LICENSE_FILE=/sw/comp/intel/licenses

#   cd /sw/EasyBuild/$Cluster/software/EasyBuild/4.3.0/easybuild/easyconfigs/w/WRF/
    eb --module-depends-on --module-syntax=Lua --robot --umask=002  --from-pr 11389 --dry-run

