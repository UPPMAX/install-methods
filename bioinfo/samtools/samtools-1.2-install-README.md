samtools/1.2
============

    VERSION=1.2
    cd /sw/apps/bioinfo/samtools/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget http://downloads.sourceforge.net/project/samtools/samtools/${VERSION}/samtools-${VERSION}.tar.bz2
    tar xjf samtools-${VERSION}.tar.bz2 
    cd samtools-${VERSION}
    module load gcc/4.9.2
    make
    make DESTDIR=$PFX install

Fix up installation directories.

    cd $PFX
    mv usr/local/* .
    rm -rf usr/local
