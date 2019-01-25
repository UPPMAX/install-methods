# jellyfish-2.0.0-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    Jellyfish 2.0.0

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

    Simply add /sw/apps/bioinfo/jellyfish/2.0.0/milou/bin to the user's PATH

LOG
---

   TOOL=/sw/apps/bioinfo/jellyfish
   VERSION=1.1.11
   CLUSTER=kalkyl
   VERSION=2.0.0
   CLUSTER=milou
   CLUSTERDIR=$TOOL/$VERSION/$CLUSTER
   mkdir -p $CLUSTERDIR
   cd $VERSION
   wget ftp://ftp.genome.umd.edu/pub/jellyfish/jellyfish-2.0.0.tar.gz
   wget ftp://ftp.genome.umd.edu/pub/jellyfish/JellyfishUserGuide.pdf
   mv JellyfishUserGuide.pdf milou/jellyfish-manual-2.0.0.pdf

Make sure `g++` is at least 4.4.

   cd milou
   tar xvzf ../jellyfish-2.0.0.tar.gz 
   cd jellyfish-2.0.0/
   ./configure --prefix=$CLUSTERDIR
   make && make check

The previous `mf` file works for the new version as well.

   cd ../../mf
   ln -sf 1.1.11 2.0.0

