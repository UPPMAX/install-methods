# jellyfish-2.1.4-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    Jellyfish 2.1.4

DESCRIPTION
-----------

    K-mer counting program for NGS read data

    Guillaume Marcais and Carl Kingsford. 2011.  A fast, lock-free approach for
    efficient parallel counting of occurrences of k-mers. Bioinformatics (2011)
    27(6): 764-770.  doi:10.1093/bioinformatics/btr011

WEBSITE
-------

    http://www.cbcb.umd.edu/software/jellyfish/

MODULE REQUIREMENTS
-------------------

    Simply add /sw/apps/bioinfo/jellyfish/2.1.4/$Cluster/bin to the user PATH

LOG
---

    TOOL=/sw/apps/bioinfo/jellyfish
    VERSION=2.1.4
    TOOLDIR=$TOOL/$VERSION
    CLUSTER=milou
    CLUSTERDIR=$TOOLDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    SOURCEDIR=$TOOL/src
    MF_DIR=$TOOL/mf
    mkdir -p $SOURCEDIR $MF_DIR
    cd $SOURCEDIR
    wget ftp://ftp.genome.umd.edu/pub/jellyfish/jellyfish-${VERSION}.tar.gz
    wget ftp://ftp.genome.umd.edu/pub/jellyfish/JellyfishUserGuide.pdf
    mv JellyfishUserGuide.pdf $CLUSTERDIR/jellyfish-manual-${VERSION}.pdf

Make sure `g++` is at least 4.4.

    module load gcc/4.8.3
    tar xvzf jellyfish-$VERSION.tar.gz 
    cd jellyfish-$VERSION/
    ./configure --prefix=$CLUSTERDIR
    make && make check
    make install

Make it available for halvan and nestor.

    cd $TOOLDIR
    ln -s ./$CLUSTER halvan
    ln -s ./$CLUSTER nestor

The previous `mf` file almost works for the new version as well, but the
directories for the gcc/4.8.3 libraries need to be found.  Also add the
man path, do not know why I chose to comment it out before.

    cd $MF_DIR
    cp 2.0.0 2.1.4
    vi 2.1.4

    cd /sw/mf/common/bioinfo-tools/misc/jellyfish/
    cp /sw/apps/bioinfo/jellyfish/mf/$VERSION .
    chgrp sw $VERSION
    cd ../../../../milou/bioinfo-tools/misc/jellyfish
    ln -s ../../../../common/bioinfo-tools/misc/jellyfish/$VERSION .
    chgrp -h $VERSION

Now repeat it all for tintin.  On tintin:

    TOOL=/sw/apps/bioinfo/jellyfish
    VERSION=2.1.4
    TOOLDIR=$TOOL/$VERSION
    CLUSTER=tintin
    CLUSTERDIR=$TOOLDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    SOURCEDIR=$TOOL/src
    MF_DIR=$TOOL/mf
    mkdir -p $SOURCEDIR $MF_DIR
    cd $SOURCEDIR
    rm -rf jellyfish-$VERSION
    module load gcc/4.8.3
    tar xvzf jellyfish-$VERSION.tar.gz 
    cd jellyfish-$VERSION/
    ./configure --prefix=$CLUSTERDIR
    make && make check && make install
    cd /sw/mf/tintin/bioinfo-tools/misc
    mkdir jellyfish
    chgrp sw jellyfish
    cd jellyfish
    ln -s ../../../../common/bioinfo-tools/misc/jellyfish/$VERSION .
    chgrp -h sw $VERSION

    
Be a good sw group member.

    cd $TOOL
    chgrp -Rh sw *
    chmod -R g+w,o+r *
    find . -type d -exec chmod o-w {} \;

