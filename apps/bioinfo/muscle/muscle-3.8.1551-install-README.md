muscle/3.8.1551
===============

<http://www.drive5.com/muscle/>

LOG
---

    VERSION=3.8.1551
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir muscle
    cd muscle
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    wget http://www.drive5.com/muscle/muscle_src_${VERSION}.tar.gz
    tar xzf muscle_src_${VERSION}.tar.gz

The `Makefile` wants to build with `-static` but `libm.a` and `libc.a` aren't
installed on rackham (and probably other clusters).  Edit `Makefile` to not use
`-static` on the `LDLIBS` variable.

    vi Makefile

Now build and install.

    module load gcc/6.3.0
    make
    cp -av muscle $PFX/

