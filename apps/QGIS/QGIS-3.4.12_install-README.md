QGIS/3.4.12
========================

<https://qgis.org/en/site/>

Used under license:
GPL license
<>

Structure creating script (makeroom_QGIS_3.4.12.sh) moved to /sw/apps/QGIS/makeroom_3.4.12.sh

LOG
---

    TOOL=QGIS
    VERSION=3.4.12
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/QGIS/3.4.12/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "QGIS" -v "3.4.12" -w "https://qgis.org/en/site/" -c "apps" -l "GPL license" -d "Create\, edit\, visualise\, analyse and publish geospatial information" -x "INSTALL" -f
    ./makeroom_QGIS_3.4.12.sh

# EasyBuild installation of QGIS/3.4.12

    export EASYBUILD_PREFIX=/sw/EasyBuild/$Cluster
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.3.0
    export INTEL_LICENSE_FILE=/sw/comp/intel/licenses

#   cd /sw/EasyBuild/$Cluster/software/EasyBuild/4.3.0/easybuild/easyconfigs/q/QGIS/
    eb --module-depends-on --module-syntax=Lua --robot --umask=002 QGIS-3.4.12-foss-2019a-Python-3.7.2.eb
#    Problems solved
#    Mesa/19.0.1-GCCcore-8.2.0: on snowy, change in Mesa-19.0.1-GCCcore-8.2.0.eb
#       set toolchainopts = {'optarch': 'march=sandybridge'} 
#	due to processor type
#    PyQt5-5.12.1-GCCcore-8.2.0-Python-3.7.2: on all clusters
#       download missing files from https://distfiles.macports.org/py-sip/ and https://distfiles.macports.org/py-pyqt5/	 

