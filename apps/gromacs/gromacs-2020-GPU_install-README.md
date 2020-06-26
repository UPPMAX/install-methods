gromacs/2020-GPU
========================

<http://www.gromacs.org>

Used under license:
GNU LGPL

Structure creating script (makeroom_gromacs_2020-GPU.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/gromacs/makeroom_2020-GPU.sh

LOG
---

    TOOL=gromacs
    VERSION=2020-GPU
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -t "gromacs" -v "2020-GPU" -w "http://www.gromacs.org" -c "apps" -l "GNU LGPL" -d "GROMACS is a versatile package to perform molecular dynamics\, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles. This is a GPU enabled build\, containing both MPI and threadMPI binaries." -x "INSTALL" -f "''"
    ./makeroom_gromacs_2020-GPU.sh

# EasyBuild installation of GROMACS 2020 with GPU support:
    export EASYBUILD_PREFIX=/sw/EasyBuild/snowy
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.2.0

    cd /sw/EasyBuild/snowy/software/EasyBuild/4.2.0/easybuild/easyconfigs/g/GROMACS/

    eb --module-depends-on --module-syntax=Lua --robot --umask=002 GROMACS-2020-fosscuda-2019b.eb

