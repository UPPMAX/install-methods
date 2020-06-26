XCrySDen/1.5.60
========================

<http://www.xcrysden.org>

Used under license:
GNU GPLv2

Structure creating script (makeroom_XCrySDen_1.5.60.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/XCrySDen/makeroom_1.5.60.sh

LOG
---

    TOOL=XCrySDen
    VERSION=1.5.60
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -t "XCrySDen" -v "1.5.60" -w "http://www.xcrysden.org" -c "apps" -l "GNU GPLv2" -d "XCrySDen is a crystalline and molecular structure visualisation program." -x "INSTALL" -f "''"
    ./makeroom_XCrySDen_1.5.60.sh

source /sw/EasyBuild/source-me-for-EasyBuild-4.1.2-$CLUSTER

cd /sw/EasyBuild/$CLUSTER/software/EasyBuild/4.1.2/easybuild/easyconfigs/x/XCrySDen/
eb --module-depends-on --module-syntax=Lua --robot --umask=002 XCrySDen-1.5.60-intel-2019a.eb

# The EasyBuild installation details may be found here: /sw/EasyBuild/$CLUSTER/software/XCrySDen/1.5.60-intel-2019a/easybuild/

