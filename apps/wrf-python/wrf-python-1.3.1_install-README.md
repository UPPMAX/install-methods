wrf-python/1.3.1
========================

<https://wrf-python.readthedocs.io/en/latest/>

Used under license:
GPL v2 license
<>

Structure creating script (makeroom_wrf-python_1.3.1.sh) moved to /sw/apps/wrf-python/makeroom_1.3.1.sh

LOG
---

    TOOL=wrf-python
    VERSION=1.3.1
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/wrf-python/1.3.1/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "wrf-python" -v "1.3.1" -w "https://wrf-python.readthedocs.io/en/latest/" -c "apps" -l "GPL v2 license" -d "A collection of diagnostic and interpolation routines for use with output from the Weather Research and Forecasting \(WRF-ARW\) Model." -u "rackham snowy" -x "INSTALL"
    ./makeroom_wrf-python_1.3.1.sh

# EasyBuild installation of NCO/4.9.3

    export EASYBUILD_PREFIX=/sw/EasyBuild/$Cluster
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.3.1

#   cd /sw/EasyBuild/$Cluster/software/EasyBuild/4.3.1/easybuild/easyconfigs/w/wrf-python/
    eb --module-depends-on --module-syntax=Lua --robot --umask=002 wrf-python-1.3.1-intel-2018b-Python-3.6.6.eb
#   Tkinter fails to build
#   Fix:
    eb --module-depends-on --module-syntax=Lua --robot --umask=002 --include-easyblocks-from-pr 2228 Tkinter-3.6.6-intel-2018b-Python-3.6.6.eb
#   Finish build
    eb --module-depends-on --module-syntax=Lua --robot --umask=002 wrf-python-1.3.1-intel-2018b-Python-3.6.6.eb




