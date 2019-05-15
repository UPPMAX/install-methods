Platanus/1.2.4
==============


LOG
---

    VERSION=1.2.4
    cd /sw/bioinfo
    cd Platanus
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget -O Platanus_v${VERSION}.tar.gz http://platanus.bio.titech.ac.jp/?ddownload=150
    tar xzf Platanus_v${VERSION}.tar.gz 
    cd Platanus_v${VERSION}
    module load gcc/4.8.3
    make
    cp -av platanus $PFX/
