# jellyfish-2.2.4-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    Jellyfish 2.2.4

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

Add `/sw/apps/bioinfo/jellyfish/2.2.4/$Cluster/bin` to the user PATH, and
several other directories to `LD_LIBRARY_PATH`, etc.  See `README` and the
module mf file for details.

LOG
---

Note that the installation of version 2.2.3-dev was a pain because of bugs in
packaging, since solved.  Version 2.2.4 is mostly an official response to these
problems so should be more like 2.1.4.

    TOOL=/sw/apps/bioinfo/jellyfish
    VERSION=2.2.4
    VERSIONDIR=$TOOL/$VERSION
    CLUSTER=milou
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $VERSIONDIR
    mkdir src $CLUSTER
    cd src
    wget https://github.com/gmarcais/Jellyfish/releases/download/v${VERSION}/jellyfish-${VERSION}.tar.gz
    wget ftp://ftp.genome.umd.edu/pub/jellyfish/JellyfishUserGuide.pdf
    mv JellyfishUserGuide.pdf $CLUSTERDIR/jellyfish-manual-${VERSION}.pdf

Make sure to use `gcc/4.8.3`.

    module load gcc/4.8.3
    tar xzf jellyfish-${VERSION}.tar.gz 
    cd jellyfish-${VERSION}/
    ./configure --prefix=$CLUSTERDIR
    make && make check && make install

Make it available for halvan and nestor.

    cd $VERSIONDIR
    ln -s ./$CLUSTER halvan
    ln -s ./$CLUSTER nestor

To install for tintin, set the above variables making sure to use
`CLUSTER=tintin`, remove the `src/jellyfish-${VERSION}` directory and repeat
the `module load gcc/4.8.3 ... make install` section.

The previous `mf` file works for 2.2.4, but we also add to `PKG_CONFIG_PATH` to
further help building against the shared library.

    cd $MF_DIR
    cp 2.2.3-dev 2.2.4
    vi 2.2.4

And set this new mf file up.

