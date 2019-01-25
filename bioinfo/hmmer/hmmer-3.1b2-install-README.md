hmmer/3.1b2
===========

<http://hmmer.org/>

Be sure to `make install` in the `easel/` subdirectory as well.  The
`ProtExcluder/1.1` install wanted `esl-fetch`, which is provided there.

This rebuild of both milou and rackham versions was with `gcc/5.4.0`.

LOG
---

    VERSION=3.1b2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/hmmer/
    mkdir -p $VERSION
    cd $VERSION
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

    module load gcc/5.4.0
    ./configure --prefix=$PFX
    make -j8
    make install
    cd easel
    make install

Repeat for both clusters.

