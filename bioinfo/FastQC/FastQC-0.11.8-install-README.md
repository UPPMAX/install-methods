fastqc/0.11.8
=============

<http://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc>

Log
---

    VERSION=0.11.8
    cd /sw/bioinfo/fastqc
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma snowy bianca ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v${VERSION}.zip
    unzip fastqc_v${VERSION}.zip 
    cd FastQC/
    mv * $PFX/
    cd ..
    rm -rf FastQC/
    cd $PFX
    chmod +x fastqc
    ./fastqc --version
