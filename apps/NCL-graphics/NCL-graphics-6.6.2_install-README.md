NCL-graphics/6.6.2
========================

<https://www.ncl.ucar.edu/>

Used under license:
Apache 2.0
<>

Structure creating script (makeroom_NCL-graphics_6.6.2.sh) moved to /sw/apps/NCL-graphics/makeroom_6.6.2.sh

LOG
---

    TOOL=NCL
    VERSION=6.6.2
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/NCL-graphics/6.6.2/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "NCL-graphics" -v "6.6.2" -w "https://www.ncl.ucar.edu/" -c "apps" -l "Apache 2.0" -d "The NCAR Command Language \(NCL\)\, is a free interpreted language designed specifically for scientific data processing and visualization. It can read and write netCDF-3\, netCDF-4 classic\, netCDF-4\, HDF4\, binary\, and ASCII data. It can read HDF-EOS2\, HDF-EOS5\, GRIB1\, GRIB2\, and OGR files \(shapefiles\, MapInfo\, GMT\, Tiger\)." -u "rackham" -x "INSTALL"
    ./makeroom_NCL-graphics_6.6.2.sh

# EasyBuild installation of NCL-6.6.2

    export EASYBUILD_PREFIX=/sw/EasyBuild/$Cluster
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.3.0
    export INTEL_LICENSE_FILE=/sw/comp/intel/licenses

#   cd /sw/EasyBuild/$Cluster/software/EasyBuild/4.3.0/easybuild/easyconfigs/w/WRF/
eb --module-depends-on --module-syntax=Lua --robot --umask=002 NCL-6.6.2-intel-2019b.eb




