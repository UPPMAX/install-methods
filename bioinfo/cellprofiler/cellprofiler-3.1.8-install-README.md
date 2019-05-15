cellprofiler/3.1.8
==================

LOG
---

    VERSION=3.1.8
    cd /sw/bioinfo/cellprofiler/
    mkdir $VERSION
    cd $VERSION
    mkdir src
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma snowy bianca ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    cd src
    wget https://github.com/CellProfiler/CellProfiler/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz
    cd CellProfiler-$VERSION
    module load python/2.7.15
    module load java/sun_jdk1.8.0_151
    module load MariaDB/10.1.29

    # Instead of installing with pip --user, install into a virtualenv

    virtualenv $PFX/cellprofiler
    source $PFX/cellprofiler/bin/activate
    pip install -e .

Make sure the mf file directs to activate the virtual environment.
MariaDB is loaded to get the installation to complete but we do not provide database support.
