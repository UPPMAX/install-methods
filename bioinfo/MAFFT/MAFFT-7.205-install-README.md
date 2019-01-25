# MAFFT-7.205-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

MAFFT 7.205

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
    VERSION=7.205
    mkdir -p $MAFFT_DIR/$VERSION/$CLUSTER
    cd $MAFFT_DIR/$VERSION/
    wget http://mafft.cbrc.jp/alignment/software/mafft-${VERSION}-with-extensions-src.tgz
    tar xvzf mafft-${VERSION}-with-extensions-src.tgz
    mv mafft-${VERSION}-with-extensions ${CLUSTER}/
    cd $MAFFT_DIR/$VERSION/$CLUSTER/mafft-${VERSION}-with-extensions

Edit the Makefiles so install occurs in this directory by replacing 'PREFIX =' on the first line.

    cd core
    vi Makefile

Comment out 'PREFIX = /usr/local' and replace with the equivalent of

    PREFIX = $MAFFT_DIR/$VERSION/$CLUSTER

The same with the extensions directory.

    cd ../extensions
    vi Makefile
    PREFIX = $MAFFT_DIR/$VERSION/$CLUSTER

Now build it.

    cd ../core
    make && make install
    cd ../extensions
    make && make install

Create mf file and have it add $MAFFT_DIR/$VERSION/$CLUSTER/bin to the user PATH,
and $MAFFT_DIR/share/man to MANPATH.

    mkdir $MAFFT_DIR/mf
    cd mf
    cp <mf from wherever> $VERSION

Aaaaaand now repeat for tintin.  The mf above works for tintin as well.  
Log onto tintin, and set

    CLUSTER=tintin

Then start with the above after the CLUSTER=milou line.  Do everything 
but creating the mf file.

Setting up the mf file for the module system is simple as well.

    mkdir /sw/mf/common/bioinfo-tools/alignment/MAFFT
    cd /sw/mf/common/bioinfo-tools/alignment/MAFFT
    cp $MAFFT_DIR/mf/$VERSION .MAFFT
    ln -s .MAFFT $VERSION
    chgrp -h sw $VERSION
    mkdir /sw/mf/milou/bioinfo-tools/alignment/MAFFT
    cd /sw/mf/milou/bioinfo-tools/alignment/MAFFT
    ln -s ../../../../common/bioinfo-tools/alignment/MAFFT/$VERSION .
    chgrp -h sw $VERSION

We have to create the MAFFT/ directory for the tintin module.

    cd /sw/mf/tintin/bioinfo-tools/alignment/
    mkdir -p MAFFT
    chgrp sw MAFFT
    cd MAFFT
    ln -s ../../../../common/bioinfo-tools/alignment/MAFFT/$VERSION .
    chgrp -h sw $VERSION

Be a nice sw group member.

    cd $MAFFT_DIR
    chgrp -R sw *
    chmod -R g+w *
    find . -type d -exec chmod g+s,o+rx {} \;

