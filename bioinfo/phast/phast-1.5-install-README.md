phast/1.5
=========

Phylogenetic Analysis with Space-Time Models

<http://compgen.cshl.edu/phast/>

LOG
---

    VERSION=1.5
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir -p /sw/bioinfo/phast
    cd /sw/bioinfo/phast
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done 
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    module load gcc/7.4.0
    [[ -f clapack.tgz ]] || wget http://www.netlib.org/clapack/clapack.tgz
    tar xzf clapack.tgz 
    cd CLAPACK-3.2.1/
    export CLAPACKPATH=$PWD
    cp make.inc.example make.inc && make f2clib && make blaslib && make lib
    cd ..
    [[ -f phast.v${VERSION/./_}.tgz ]] || wget http://compgen.cshl.edu/phast/downloads/phast.v${VERSION/./_}.tgz
    tar xvzf phast.v${VERSION/./_}.tgz 
    cd phast/
    cd src/
    make
    cd ..

Any shared libraries?

    ls -l lib/

Make sure none of the executables need shared objects from this file (all libs
are static anyway) and follow symbolic links to copy their targets.

    ldd bin/*

    cp -aLv bin lib doc/man $PFX/

Remote the source trees.

    cd ../..
    rm -rf phast CLAPACL-3.2.1

The mf file from 1.3 is fine.

