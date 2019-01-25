miARma/1.7.5
========================

<https://bitbucket.org/cbbio/miarma>

LOG
---

    TOOL=miARma
    VERSION=1.7.5
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/apps/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/jonass/uppmax/bin/makeroom.sh

NOTE: I use my own script which is located at /sw/apps/bioinfo/miARma/makeroom_1.7.5.sh
    ./makeroom_miARma_1.7.5.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    git clone https://bitbucket.org/cbbio/miarma.git
    cp -av miarma/* ../rackham/
    cd ../rackham

Testing the installation

    curl -L -O https://sourceforge.net/projects/miarma/files/Examples/Examples_miARma_miRNAs.tar.bz2
    tar -xjf Examples_miARma_miRNAs.tar.bz2
    curl -L -O https://sourceforge.net/projects/miarma/files/Genomes/Index_bowtie1_hg19.tar.bz2
    tar -xjf Index_bowtie1_hg19.tar.bz2
    ml R_packages
    ./miARma Examples/basic_examples/miRNAs/Known_miRNAs/Known_miRNAs_pipeline.ini


