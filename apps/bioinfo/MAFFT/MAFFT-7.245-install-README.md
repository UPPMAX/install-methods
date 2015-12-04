# MAFFT-7.245-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

MAFFT 7.245

DESCRIPTION
-----------

MAFFT multiple alignment software

WEBSITE
-------

    http://mafft.cbrc.jp/alignment/software/

MODULE REQUIREMENTS
-------------------

Compiled with system gcc.

LOG
---

    CLUSTER=milou
    MAFFT_DIR=/sw/apps/bioinfo/MAFFT
    VERSION=7.245
    CLUSTERDIR=$MAFFT_DIR/$VERSION/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $MAFFT_DIR/$VERSION/
    mkdir -p src
    cd src
    wget http://mafft.cbrc.jp/alignment/software/mafft-${VERSION}-with-extensions-src.tgz
    tar xvzf mafft-${VERSION}-with-extensions-src.tgz
    cd mafft-${VERSION}-with-extensions

Edit the Makefiles so install occurs in this directory by replacing 'PREFIX ='
on the first line.

    cd core
    vi Makefile

Comment out 'PREFIX = /usr/local' and replace with the equivalent of
$CLUSTERDIR.

    PREFIX = $CLUSTERDIR

The same with the extensions directory.

    cd ../extensions
    vi Makefile

Change to  PREFIX = $CLUSTERDIR

    cd ..

Now build it.

    module load gcc/4.9.2
    cd core
    make && make install
    cd ../extensions
    make && make install

Create mf file and have it add $CLUSTERDIR/bin to the user PATH,
and $MAFFT_DIR/share/man to MANPATH.

    mkdir -p $MAFFT_DIR/mf
    cd mf
    cp <mf from wherever> $VERSION

Aaaaaand now repeat for tintin.  The mf above works for tintin as well.  

    CLUSTER=tintin

Be a nice sw group member.

    cd $MAFFT_DIR
    chgrp -R sw *
    chmod -R g+w *
    find . -type d -exec chmod g+s,o+rx {} \;

