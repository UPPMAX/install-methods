ncview/2.1.7-intel-2019b
========================

<http://meteora.ucsd.edu/~pierce/ncview_home_page.html>

Used under license:
GPL 3 license
<>

Structure creating script (makeroom_ncview_2.1.7-intel-2019b.sh) moved to /sw/apps/ncview/makeroom_2.1.7-intel-2019b.sh

LOG
---

    TOOL=ncview
    VERSION=2.1.7-intel-2019b
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/ncview/2.1.7-intel-2019b/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "ncview" -v "2.1.7-intel-2019b" -w "http://meteora.ucsd.edu/~pierce/ncview_home_page.html" -c "apps" -l "GPL 3 license" -d "A netCDF visual browser" -u "rackham snowy" -x "INSTALL"
    ./makeroom_ncview_2.1.7-intel-2019b.sh

# EasyBuild installation of ncview/2.1.7-intel-2019b

    export EASYBUILD_PREFIX=/sw/EasyBuild/$Cluster
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.3.1
    export INTEL_LICENSE_FILE=/sw/comp/intel/licenses

#   cd /sw/EasyBuild/rackham/software/EasyBuild/4.3.1/easybuild/easyconfigs/n/ncview      
    eb --module-depends-on --module-syntax=Lua --robot --umask=002  ncview-2.1.7-intel-2016b.eb --dry-run


