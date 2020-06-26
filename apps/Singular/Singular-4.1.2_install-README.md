Singular/4.1.2
========================

<https://www.singular.uni-kl.de>

Used under license:
GNU GPL

Structure creating script (makeroom_Singular_4.1.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/Singular/makeroom_4.1.2.sh

LOG
---

    TOOL=Singular
    VERSION=4.1.2
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -t "Singular" -v "4.1.2" -w "https://www.singular.uni-kl.de" -c "apps" -l "GNU GPL" -d "Singular is a computer algebra system for polynomial computations, with special emphasis on commutative and non-commutative algebra, algebraic geometry, and singularity theory." -x "INSTALL"
    ./makeroom_Singular_4.1.2.sh

# EasyBuild installation of Singular
    export EASYBUILD_PREFIX=/sw/EasyBuild/$CLUSTER
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.2.0

    eb --module-depends-on --module-syntax=Lua --robot --umask=002 Singular-4.1.2.eb

