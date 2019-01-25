# jellyfish-install-README, douglas.scofield@ebc.uu.se

TITLE

    Jellyfish

DESCRIPTION

    K-mer counting program for NGS read data

    Guillaume Marcais and Carl Kingsford. 2011.  A fast, lock-free approach for
    efficient parallel counting of occurrences of k-mers. Bioinformatics (2011)
    27(6): 764-770.  doi:10.1093/bioinformatics/btr011

WEBSITE

    http://www.cbcb.umd.edu/software/jellyfish/

MODULE REQUIREMENTS

    Simply add /sw/apps/bioinfo/jellyfish/1.1.11/kalkyl/bin to the user's PATH

LOG

TOOL=/sw/apps/bioinfo/jellyfish
VERSION=1.1.11
CLUSTER=kalkyl
#
cd $TOOL
CLUSTERDIR=$TOOL/$VERSION/$CLUSTER
mkdir -p $CLUSTERDIR
cd $VERSION
wget http://www.cbcb.umd.edu/software/jellyfish/jellyfish-1.1.11.tar.gz
wget http://www.cbcb.umd.edu/software/jellyfish/jellyfish-manual-1.1.pdf
wget http://www.cbcb.umd.edu/software/jellyfish/README
cp jellyfish-manual-1.1.pdf README $CLUSTERDIR
cd $CLUSTERDIR
tar xvzf ../jellyfish-1.1.11.tar.gz
cd jellyfish-1.1.11
./configure --prefix=$CLUSTERDIR
# kalkyl default gcc is sufficient
make && make install
# Puts everything under $CLUSTERDIR, so the path we add
# when adding the module is $CLUSTERDIR/bin.  Needs to
# be set for 'make check'
PATH=$CLUSTERDIR/bin:$PATH
# Will take 30 mins or so
make check BIG=1
# passed on kalkyl's biologin

