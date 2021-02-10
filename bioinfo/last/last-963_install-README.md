last/963
========================

<http://last.cbrc.jp/>

Used under license:
GPL v3 license
<>

Structure creating script (makeroom_last_963.sh) moved to /sw/bioinfo/last/makeroom_963.sh

LOG
---

    TOOL=last
    VERSION=963
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/last/963/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "last" -v "963" -w "http://last.cbrc.jp/" -c "bioinfo" -l "GPL v3 license" -d "finds similar regions between sequences." -x "INSTALL" -f
    ./makeroom_last_963.sh
    cd $SRCDIR 
    wget http://last.cbrc.jp/last-${VERSION}.zip
    unzip last-963.zip
    cd last-963/
    ml gcc/9.3.0
    make
    make install prefix=$PREFIX

Install the documentation.

    cp -av doc $PREFIX

The mf file needs `$PFX/bin` added to `PATH`.  Include a line in the module
help about the documentation directory etc...

