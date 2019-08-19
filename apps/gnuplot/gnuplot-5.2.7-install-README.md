gnuplot/5.2.7
=============

<http://www.gnuplot.info/>

Compiled with a few extra capabilities through pointing to wxWidgets, including
setting `LD_RUN_PATH`, and loading `texlive/2019`, `cairo/1.17.2`.  Freetype is
already available with a new-enough version.


LOG
---

    VERSION=5.2.7
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/gnuplot/
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    mkdir src
    PFX=$PWD/$CLUSTER
    cd src
    [[ -f gnuplot-${VERSION}.tar.gz ]] || wget https://downloads.sourceforge.net/project/gnuplot/gnuplot/${VERSION}/gnuplot-${VERSION}.tar.gz
    [[ -d gnuplot-${VERSION} ]] && rm -rf gnuplot-${VERSION}
    tar xzf gnuplot-${VERSION}.tar.gz
    cd gnuplot-${VERSION}
    module load gcc/6.4.0
    module load cairo/1.17.2
    module load texlive/2019
    ./configure --with-kpsexpand --with-tutorial --prefix=$PFX
    make -j 10
    make install

