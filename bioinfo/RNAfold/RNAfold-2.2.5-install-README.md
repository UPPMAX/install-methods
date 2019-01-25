# ViennaRNA-2.2.5-install-README.md

ViennaRNA/2.2.5

<http://www.tbi.univie.ac.at/RNA>

LOG
---

    VERSION=2.2.5
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/RNAfold
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CLUSTER
    mkdir -p src
    cd $CLUSTER
    PREFIX=$PWD
    cd ../src

Download, no apparent direct link so download to local computer and copy over.

    tar xzf ViennaRNA-2.2.5.tar.gz 
    mv ViennaRNA-2.2.5 ViennaRNA-2.2.5_$CLUSTER
    cd ViennaRNA-2.2.5_$CLUSTER/

We can't build against perl/5.18.4 because it seems Perl needs to be built with
-fPIC... or something... yet another example of the default Perl configuration
perhaps being inappropriate for a cluster (another being threads disabled by
default).  The default Scientific Linux Perl works fine.

There are a few other assumptions made as well.  For one thing, the Gnu
binutils are built with --enable-plugins, which means that I need to build my
own module for those... now completed.  Perhaps that's related to some
post-link optimisations to which the install instructions refer.

Without a texinfo module loaded, PDF doc creation dies looking for a tabu.sty
style file.  There is a prebuilt PDF in the doc directory in case the problem
cannot be solved.

Also, don't load a gsl module, simply use the installed version.

    module load binutils/2.26
    module load texlive/2015
    module load doxygen/1.8.11
    module load swig/3.0.7
    module load python/2.7.6
    module load gcc/5.3.0

    ./configure  --with-cluster --with-kinwalker --prefix=$PREFIX

    make
    make install

The mf file should add `$modroot/lib/pkgconfig` to `PKG_CONFIG_PATH` and
`$modroot/share/info` to `INFOPATH` in addition to the other standard settings.
It is also rather more complicated than the previous version because of the
Perl and Python bindings being added.

