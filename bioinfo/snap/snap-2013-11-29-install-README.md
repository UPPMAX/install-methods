snap 2013-11-29
===============

<http://korflab.ucdavis.edu/Software/snap-2013-11-29.tar.gz>

LOG
---

    VERSION=2013-11-29
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/snap
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget http://korflab.ucdavis.edu/Software/snap-${VERSION}.tar.gz
    cd snap

DO NOT load gcc 6+ to compile.  There is an ambiguous comparison on a couple of
Zoe functions which makes the compilation fail.  I wrote Ian Korf, who
responded 2017-04-12 "I wrote some code there but I don't think I've used that
for anything ever."  So it is probably OK to allow compilation to continue, and
sticking with gcc 5 will do that automatically.

    module load gcc/5.4.0
    make

The perl scripts in this directory might be useful, but at least one is using
Korf-lab internal modules so I will provide them, but make no guarantees.  No
need to disable them via `chmod -x` (as I thought earlier) but the user must
beware.

There also appear to be some parameter matrices provided, so just copy the
compilation directory over to the cluster.

    cd ..
    mv snap ../$CLUSTER

Very simple mf file.

