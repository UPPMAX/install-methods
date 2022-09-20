MUMPS/5.5.0-hybrid
========================

<https://graal.ens-lyon.fr/MUMPS/>

Used under license:
CeCILL-C license


Structure creating script (makeroom_MUMPS_5.5.0-hybrid.sh) moved to /sw/apps/MUMPS/makeroom_5.5.0-hybrid.sh
Installed with EasyBuild.

LOG
---

    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh "-f" "-t" "MUMPS" "-v" "5.5.0-hybrid" "-c" "apps" "-w" "https://graal.ens-lyon.fr/MUMPS/" "-l" "CeCILL-C license" "-d" "- MUltifrontal Massively Parallel sparse direct Solver." "-u" "rackham"
    ./makeroom_MUMPS_5.5.0-hybrid.sh
    cd $SRCDIR
    wget http://
    tar xvf 
    TOOL=MUMPS
    VERSION=5.5.0
    TOOLCHAIN=foss-2021a
    
    export EASYBUILD_PREFIX=/sw/EasyBuild/${Cluster}
    export MODULEPATH=$EASYBUILD_PREFIX/modules/all
    module load EasyBuild/4.6.0

#Diana's edit of the *.eb file so that it includes OpenMP in addition to MPI.
	vi /sw/EasyBuild/rackham/software/EasyBuild/4.6.0/easybuild/easyconfigs/m/MUMPS/MUMPS-5.5.0-foss-2021a-metis-hybrid.eb
    eb --module-depends-on --module-syntax=Lua --robot --umask=002 ${TOOL}-${VERSION}-${TOOLCHAIN}-metis-hybrid.eb

