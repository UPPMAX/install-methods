MUMPS/5.5.0
========================

<https://graal.ens-lyon.fr/MUMPS/>

Used under license:
CeCILL-C license


Structure creating script (makeroom_MUMPS_5.5.0.sh) moved to /sw/apps/MUMPS/makeroom_5.5.0.sh
Installed with EasyBuild.

LOG
---

    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh "-f" "-t" "MUMPS" "-v" "5.5.0" "-c" "apps" "-w" "https://graal.ens-lyon.fr/MUMPS/" "-l" "CeCILL-C license" "-d" "- MUltifrontal Massively Parallel sparse direct Solver." "-u" "rackham"
    ./makeroom_MUMPS_5.5.0.sh
    cd $SRCDIR
    wget http://
    tar xvf 
    TOOL=MUMPS
    VERSION=5.5.0
    TOOLCHAIN=foss-2021a
    
    export EASYBUILD_PREFIX=/sw/EasyBuild/${Cluster}
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.6.0

    eb --module-depends-on --module-syntax=Lua --robot --umask=002 ${TOOL}-${VERSION}-${TOOLCHAIN}-metis.eb

