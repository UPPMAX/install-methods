ATLAS_aDNA/20170510
===================

Tool for working with ancient DNA.  The tool name is ATLAS, but this conflicts
with the widely-used ATLAS library.

<https://bitbucket.org/phaentu/atlas/wiki/Home>

LOG
---

Already installed `Armadillo/7.900.0` library, while allowing it to link with
the system BLAS and LAPACK libraries during its installation.

The version is based on the date of the most recent commit to the `master`
branch at time of cloning.

    VERSION=20170510
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir ATLAS_aDNA
    cd ATLAS_aDNA
    mkdir $VERSION
    cd $VERSION
    mkdir src_${CLUSTER} ${CLUSTER}
    cd ${CLUSTER}
    PFX=$PWD
    cd ../src_${CLUSTER}
    git clone https://bitbucket.org/phaentu/atlas.git
    cd atlas

The `makefile` contains no shocks and `gcc` should be able to find the
Armadillo library because of the environment variables set by that module.

    module load gcc/5.4.0
    module load Armadillo/7.900.0
    make
    cp -av atlas $PFX

Make sure shared libraries can be found without loading the gcc or Armadillo
modules.

    cd $PFX
    module unload gcc Armadillo
    ldd atlas

Do for rackham, after getting Armadillo built for it.
