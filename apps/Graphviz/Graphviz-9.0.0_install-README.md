Graphviz/9.0.0
==============

<https://graphviz.org/>

Used under license:
Common Public License Version 1.0
<https://graphviz.org/license/>

Structure creating script (makeroom_Graphviz_9.0.0.sh) moved to /sw/apps/Graphviz/makeroom_9.0.0.sh

A user would like the triangulation library enabled. So, build with that.

LOG
---

    makeroom.sh -f -c apps -t Graphviz -v 9.0.0 -w https://graphviz.org/ -d "Graphviz is open source graph visualization software. Graph visualization is a way of representing structural information as diagrams of abstract graphs and networks. It has important applications in networking, bioinformatics, software engineering, database and web design, machine learning, and in visual interfaces for other technical domains." -l "Common Public License Version 1.0" -L https://graphviz.org/license/ 
    ./makeroom_Graphviz_9.0.0.sh 

    source /sw/apps/Graphviz/SOURCEME_Graphviz_9.0.0
    cd $SRCDIR

Build from source, not RPMs.

Build libgts here, and add its pkgconfig directory to `PKG_CONFIG_PATH` so
Graphviz can find it during the build..

    wget https://gts.sourceforge.net/tarballs/gts-snapshot-121130.tar.gz
    tar xf gts-snapshot-121130.tar.gz 
    cd gts-snapshot-121130/
    ml glib/2.72.1
    ./configure --prefix=$PREFIX
    make
    make install

    PCP=$PKG_CONFIG_PATH
    export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH

Build Graphviz.

    cd $SRCDIR
    wget https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/9.0.0/graphviz-9.0.0.tar.xz
    wget https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/9.0.0/graphviz-9.0.0.tar.xz.sha256
    sha256sum -c *.sha256
    tar xf graphviz-9.0.0.tar.xz 
    cd graphviz-9.0.0/
    ml libwebp/1.3.0
    ml cairo/1.17.4
    ml Poppler/23.09.0
    ml R/4.3.1
    ml swig/4.1.1
    ml gcc/6.4.0
    ml binutils/2.41
    ./configure --prefix=$PREFIX --enable-static --enable-shared
    make -j20
    make install

Modify mf for 9.0.0 appropriately, including capabilities compiled in according to `./configure` output.

    cd $TOOLDIR/mf

Then, wrap up.

    ./Graphviz-9.0.0_post-install.sh

Make sure we have triangulation support. There should be no error.

    ml purge
    ml Graphviz/9.0.0

    sfdp -Tpdf -o fsm.pdf $GRAPHVIZ_ROOT/share/graphviz/graphs/directed/fsm.gv
    evince fsm.pdf

