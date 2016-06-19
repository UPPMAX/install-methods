# jellyfish-2.2.6-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    Jellyfish 2.2.6

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

Add `/sw/apps/bioinfo/jellyfish/2.2.6/$Cluster/bin` to the user PATH, and
several other directories to `LD_LIBRARY_PATH`, etc.  See `README` and the
module mf file for details.

LOG
---

    TOOL=/sw/apps/bioinfo/jellyfish
    VERSION=2.2.6
    VERSIONDIR=$TOOL/$VERSION
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $VERSIONDIR
    mkdir src $CLUSTER
    cd src
    wget https://github.com/gmarcais/Jellyfish/releases/download/v${VERSION}/jellyfish-${VERSION}.tar.gz
    wget ftp://ftp.genome.umd.edu/pub/jellyfish/JellyfishUserGuide.pdf
    mv JellyfishUserGuide.pdf $CLUSTERDIR/jellyfish-manual-${VERSION}.pdf

Make sure to use `gcc/5.3.0`.

    module load gcc/5.3.0
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
the `module load gcc/5.3.0 ... make install` section.

The 2.2.4 `mf` file works for 2.2.6.

    cd $MF_DIR
    cp 2.2.4 2.2.6

I think I should also add `CPATH`.

And set this new mf file up.

