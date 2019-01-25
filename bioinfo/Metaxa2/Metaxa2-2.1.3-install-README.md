Metaxa2 2.1.3
=============

<http://microbiology.se/software/metaxa2/>

LOG
---

    cd /sw/apps/bioinfo
    mkdir Metaxa2
    cd Metaxa2/
    VERSION=2.1.3
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd  src_$CLUSTER
    wget http://microbiology.se/sw/Metaxa2_${VERSION}.tar.gz
    tar xzf Metaxa2_${VERSION}.tar.gz 
    cd Metaxa2_${VERSION}
    module load bioinfo-tools
    module load blast/2.2.31+
    module load MAFFT/7.245
    module load hmmer/3.1b2
    ./install_metaxa2 

Give it `/sw/apps/bioinfo/Metaxa2/$VERSION/$CLUSTER` as the installation directory.

And start with the prank mf.

