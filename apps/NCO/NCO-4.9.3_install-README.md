NCO/4.9.3
========================

<http://nco.sourceforge.net/>

Used under license:
BSD
<>

Structure creating script (makeroom_NCO_4.9.3.sh) moved to /sw/apps/NCO/makeroom_4.9.3.sh

LOG
---

    TOOL=NCO
    VERSION=4.9.3
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/NCO/4.9.3/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "NCO" -v "4.9.3" -w "http://nco.sourceforge.net/" -c "apps" -l "BSD" -d "The NCO toolkit manipulates and analyzes data stored in netCDF-accessible formats\, including DAP\, HDF4\, and HDF5" -x "INSTALL" -f
    ./makeroom_NCO_4.9.3.sh
# EasyBuild installation of NCO/4.9.3

    export EASYBUILD_PREFIX=/sw/EasyBuild/$Cluster
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.3.1

#   cd /sw/EasyBuild/$Cluster/software/EasyBuild/4.3.1/easybuild/easyconfigs/n/NCO/
	eb --module-depends-on --module-syntax=Lua --robot --umask=002 NCO-4.9.3-gompi-2019b.eb 

