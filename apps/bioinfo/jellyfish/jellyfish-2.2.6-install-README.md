# jellyfish-2.2.6-install-README.md, douglas.scofield@ebc.uu.se

Jellyfish 2.2.6
=====


DESCRIPTION
-----------

K-mer counting program for NGS read data

Guillaume Marcais and Carl Kingsford. 2011.  A fast, lock-free approach for
efficient parallel counting of occurrences of k-mers. _Bioinformatics_ (2011)
27(6): 764-770.  doi:10.1093/bioinformatics/btr011

WEBSITE
-------

<http://www.cbcb.umd.edu/software/jellyfish/>

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
    mkdir src_$CLUSTER $CLUSTER
    cd src_$CLUSTER
    wget https://github.com/gmarcais/Jellyfish/releases/download/v${VERSION}/jellyfish-${VERSION}.tar.gz
    wget ftp://ftp.genome.umd.edu/pub/jellyfish/JellyfishUserGuide.pdf
    mv JellyfishUserGuide.pdf $CLUSTERDIR/jellyfish-manual-${VERSION}.pdf

Make sure to use `gcc/5.3.0`.

    module load gcc/5.3.0
    tar xzf jellyfish-${VERSION}.tar.gz 
    cd jellyfish-${VERSION}/
    ./configure --prefix=$CLUSTERDIR
    make && make check && make install

Note that there will be a test failure that can be ignored (`FAIL: tests/large_key.sh`, <https://github.com/gmarcais/Jellyfish/issues/65>).  So this is probably a better sequence for building and installing.

    make && make check
    make install

Make it available for bianca and irma, if building on rackham.

    cd $VERSIONDIR
    ln -s ./$CLUSTER bianca
    ln -s ./$CLUSTER irma

The `mf` file needs to load the lib directories for gcc/5.3.0.

Set up the links for bianca and irma, too.

I think I should also add `CPATH`.

