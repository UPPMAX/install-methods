hmmer/3.1b2-intel
=================

<http://hmmer.org/>

Be sure to `make install` in the `easel/` subdirectory as well.  The
`ProtExcluder/1.1` install wanted `esl-sfetch`, which is provided there.

Compiled with `intel/17.2` and `openmpi/2.1.0`.

LOG
---

    VERSION=3.1b2
    MODULE_VERSION=${VERSION}-intel
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/hmmer/
    mkdir -p $MODULE_VERSION
    cd $MODULE_VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f hmmer-${VERSION}.tar.gz ]] || wget http://eddylab.org/software/hmmer3/${VERSION}/hmmer-${VERSION}.tar.gz
    if [[ ! -d hmmer-${VERSION}_${CLUSTER} ]] ; then
        tar xzf hmmer-${VERSION}.tar.gz
        mv hmmer-${VERSION} hmmer-${VERSION}_${CLUSTER}
    fi
    cd hmmer-${VERSION}_${CLUSTER}
    make distclean

The `distclean` target will only be present if `./configure` has already been run in this directory.

    module load intel/17.2
    module load openmpi/2.1.0
    ./configure --prefix=$PFX --enable-mpi
    make
    make install
    cd easel
    make install

Repeat for both clusters.

For the mf file, load both compiler and openmpi and produce a message.
