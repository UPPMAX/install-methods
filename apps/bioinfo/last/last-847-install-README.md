last/847
========

Needed for some parts of delly, and I thought we already had it installed.

<http://last.cbrc.jp/>

LOG
---

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=847
    cd /sw/apps/bioinfo
    mkdir last
    mkdir $VERSION
    cd $VERSION/
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd  ../src_$CLUSTER
    wget http://last.cbrc.jp/last-${VERSION}.zip
    unzip last-${VERSION}.zip 
    cd last-$VERSION
    module load gcc/6.3.0
    make
    make install prefix=$PFX

Install the documentation.

    cp -av doc $PFX/../

The mf file needs `$PFX/bin` added to `PATH`.  Include a line in the module
help about the documentation directory.

