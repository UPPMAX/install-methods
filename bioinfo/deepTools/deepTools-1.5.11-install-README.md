deepTools 1.5.11
================

<https://deeptools.github.io/>

<https://github.com/fidelram/deepTools>

Log
---

    TOOLDIR=/sw/apps/bioinfo/deepTools
    VERSION=1.5.11
    CLUSTER=milou
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    mkdir $VERSION
    VERSIONDIR=$TOOLDIR/$VERSION
    cd $VERSIONDIR
    mkdir -p $CLUSTER mf
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    cd $CLUSTERDIR
    mkdir src
    cd src
    wget https://github.com/fidelram/deepTools/archive/$VERSION.tar.gz
    tar xzf $VERSION.tar.gz 
    cd deepTools-$VERSION/
    module load python/2.7.9
    module load bioinfo-tools ucsc-utilities/v287
    module load ucsc-utilities/v287
    module load samtools/0.1.19
    which bigWigInfo
    which bedGraphToBigWig
    which samtools

Install prerequisites.  Read deepTools-2.0.1-install-README.md for an
alternative, and better, means of installing local python modules using
PYTHONUSERBASE and --user, which will not reinstall stuff in the python module
tree like this will.

    export PYTHONPATH=$CLUSTERDIR/lib/python2.7/site-packages
    python setup.py easy_install --prefix $CLUSTERDIR

Install the tool.

    python setup.py install --prefix $CLUSTERDIR

    cd $VERSIONDIR
    ln -s ./milou halvan
    ln -s ./milou nestor

