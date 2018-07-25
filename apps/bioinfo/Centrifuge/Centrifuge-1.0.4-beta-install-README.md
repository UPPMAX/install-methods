Centrifuge/1.0.4-beta
=====================

<https://ccb.jhu.edu/software/centrifuge/>

Build tool, and then build indices in `/sw/data/uppnex/Centrifuge-indices/`.
They total **117GB**.  No plans to update these indices regularly.

LOG
---

    cd /sw/apps/bioinfo
    mkdir Centrifuge
    cd Centrifuge/
    VERSION=1.0.4-beta
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL ; done
    mkdir src
    PFX=$PWD/$CLUSTER
    cd src
    wget https://github.com/infphilo/centrifuge/archive/v$VERSION.tar.gz
    tar xzf v$VERSION.tar.gz 
    cd centrifuge-$VERSION
    module load gcc/6.3.0
    make
    make install prefix=$PFX
    module unload gcc
    cd $PFX
    cd bin/
    ./centrifuge
    ldd centrifuge-class 
    ldd centrifuge-inspect-bin 

Create mf file and install, so we can load the module when building the indices.

Now build indices.  We need to have `blast/2.7.1+`, `jellyfish/2.2.6` and
`MUMmer/3.23` loaded, which is not mentioned.  As above, note the indices
are actually being built over in `/sw/data/uppnex/Centrifuge-indicex/`.

    cd /sw/data/uppnex
    mkdir -p Centrifuge-indices
    DateFormat='%Y%m%d'  # used for databases where the version tag is a date
    TODAY=`date +"$DateFormat"`
    NEWVERSION="$TODAY"
    DBDIR=$PWD/$NEWVERSION
    LATESTDB=$PWD/latest

    cd $PFX/share/centrifuge
    rsync -Pa indices/ $DBDIR
    rm -rf indices
    ln -s $LATESTDB indices

    cd $DBDIR
    module load bioinfo-tools
    module load Centrifuge/1.0.4-beta
    module load blast/2.7.1+
    module load jellyfish/2.2.6
    module load MUMmer/3.23
    make THREADS=10 p_compressed p_compressed+h+v p+h+v p+v v

    # update the latest symlink
    cd ..
    rm -f latest
    ln -s $NEWVERSION latest

