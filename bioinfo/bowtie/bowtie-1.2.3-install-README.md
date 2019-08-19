bowtie/1.2.3
============

LOG
---

    VERSION=1.2.3
    cd /sw/bioinfo/bowtie
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget https://sourceforge.net/projects/bowtie-bio/files/bowtie/${VERSION}/bowtie-src-x86_64.zip
    unzip -q bowtie-src-x86_64.zip
    cd bowtie-${VERSION}

    module load gcc/5.4.0

    make -j 4
    make prefix=$PFX install
    cp -av scripts $PFX/


