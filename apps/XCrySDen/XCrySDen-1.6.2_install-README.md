XCrySDen/1.6.2
========================

<http://www.xcrysden.org>

Used under license:
GNU GPLv2

Structure creating script (makeroom_XCrySDen_1.6.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/XCrySDen/makeroom_1.6.2.sh

LOG
---

    TOOL=XCrySDen
    VERSION=1.6.2
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -t "XCrySDen" -v "1.6.2" -w "http://www.xcrysden.org" -c "apps" -l "GNU GPLv2" -d "XCrySDen is a crystalline and molecular structure visualisation program." -x "INSTALL" -f "''"
    ./makeroom_XCrySDen_1.6.2.sh


source /sw/EasyBuild/source-me-for-EasyBuild-4.2.0-$CLUSTER

# cd /sw/EasyBuild/$CLUSTER/software/EasyBuild/4.2.0/easybuild/easyconfigs/x/XCrySDen/
eb --module-depends-on --module-syntax=Lua --robot --umask=002 XCrySDen-1.6.2-intel-2019b.eb

# The EasyBuild installation details may be found here: /sw/EasyBuild/$CLUSTER/software/XCrySDen/1.6.2-intel-2019b/easybuild/
# Edited the EasyBuild Togl/2.0 module /sw/EasyBuild/$CLUSTER/modules/all/Togl/2.0-GCCcore-8.3.0.lua in order to include the lib/Togl2.0 library as well
# prepend_path("LD_LIBRARY_PATH", pathJoin(root, "lib/Togl2.0"))
# prepend_path("LIBRARY_PATH", pathJoin(root, "lib/Togl2.0"))

