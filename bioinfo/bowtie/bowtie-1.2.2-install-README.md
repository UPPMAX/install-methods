bowtie/1.2.2
============

LOG
---

    VERSION=1.2.2
    cd /sw/bioinfo/bowtie
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget https://sourceforge.net/projects/bowtie-bio/files/bowtie/${VERSION}/bowtie-${VERSION}-src.zip
    unzip -q bowtie-${VERSION}-src.zip
    cd bowtie-${VERSION}

    module load gcc/5.4.0

    make -j 4
    make prefix=$PFX install
    cp -av scripts $PFX/


