Armadillo/9.700.2
========================

<https://sourceforge.net/projects/arma/>

Used under license:
Apache License V2.0

Structure creating script (makeroom_Armadillo_9.700.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/Armadillo/makeroom_9.700.2.sh

LOG
---

    TOOL=Armadillo
    VERSION=9.700.2
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -t "Armadillo" -v "9.700.2" -w "https://sourceforge.net/projects/arma/" -c "apps" -l "Apache License V2.0" -d "Armadillo is an open-source C++ linear algebra library (matrix maths) aiming towards a good balance between speed and ease of use. Integer, floating point and complex numbers are supported, as well as a subset of trigonometric and statistics functions." -x "INSTALL"
    ./makeroom_Armadillo_9.700.2.sh

# EasyBuild installation of Armadillo
    export EASYBUILD_PREFIX=/sw/EasyBuild/$CLUSTER
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.2.0

    eb --module-depends-on --module-syntax=Lua --robot --umask=002 Armadillo-9.700.2-foss-2019a.eb


