gnuplot/5.0.7
=============

<http://www.gnuplot.info/>

Compiled with a few extra capabilities through pointing to wxWidgets, including
setting `LD_RUN_PATH`, and loading `texlive/2016`, `cairo/1.14.8` and
`freetype/2.7.1`.


LOG
---

    VERSION=5.0.7
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/gnuplot/
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    [[ -f gnuplot-${VERSION}.tar.gz ]] || wget https://downloads.sourceforge.net/project/gnuplot/gnuplot/${VERSION}/gnuplot-${VERSION}.tar.gz
    tar xzf gnuplot-${VERSION}.tar.gz
    cd gnuplot-${VERSION}

    module load gcc/5.4.0

Load `texlive/2016`, `cairo/1.14.8` and `freetype/2.7.1`.  I hope that RPATH
info is correct so that only the `texlive/2016` module need be loaded for LaTeX
functionality.

    module load cairo/1.14.8
    module load freetype/2.7.1
    module load texlive/2016

We provide wxWidgets via some local directories under `/sw/libs`. This should
probably be a module at some point.  Give `./configure` the path to `wx-config`
with `--with-wx=$WXBASE/bin` and add `$WXBASE/lib` to `LD_RUN_PATH`.  This is
so `gnuplot` can find it at runtime and also so that LaTeX tutorials can be
built during `make`, which requires the newly-built `gnuplot` executable.

    WXBASE=/sw/libs/wxWidgets
    export LD_RUN_PATH=$LD_RUN_PATH:$WXBASE/lib

    ./configure --with-wx=$WXBASE/bin --with-kpsexpand --with-tutorial --prefix=$PFX

    make -j 8
    make install

**On rackham**, do not point to a special wxWidgets location; just use the
system installation which is fine.  So for rackham the final steps are:

    ./configure --with-kpsexpand --with-tutorial --prefix=$PFX

    make -j 8
    make install

