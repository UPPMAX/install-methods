prepend-path    PATH             $modroot
#append-path    MANPATH $modroot/man
#prepend-path    PATH               $modroot/bin
prepend-path    LD_LIBRARY_PATH  $modroot/python_packages/lib/python2.7/site-packages
#append-path    MANPATH $modroot/man

Following instructions at

    http://sourceforge.net/p/pb-jelly/wiki/Home/?#058c


    TOOL=/sw/apps/bioinfo/PBSuite
    mkdir -p $TOOL
    cd $TOOL
    VERSION=15.8.24
    VERSIONDIR=$TOOL/$VERSION
    mkdir $VERSION mf
    cd $VERSIONDIR
    CLUSTER=milou
    mkdir -p $CLUSTER src
    SRCDIR=$VERSIONDIR/src
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    cd $CLUSTERDIR
    export RE_PYTHON=$CLUSTERDIR/python_packages
    mkdir -p $RE_PYTHON
    module load python/2.7.9
    module load gcc/4.9.2

Now install Python packages this way.  This prevents pip from removing the system versions.

    PYTHONUSERBASE=$RE_PYTHON pip install --upgrade --user networkx==1.1
    PYTHONUSERBASE=$RE_PYTHON pip install --upgrade --user h5py
    PYTHONUSERBASE=$RE_PYTHON pip install --user numpy
    PYTHONUSERBASE=$RE_PYTHON pip install --user pysam
    PYTHONUSERBASE=$RE_PYTHON pip install --user pyvcf

We also need PyIntervalTree (http://sourceforge.net/p/pb-jelly/discussion/pbhtiks/thread/05f86d70/)

    PYTHONUSERBASE=$RE_PYTHON pip install --user PyIntervalTree==0.4

Get the package from Sourceforge, put it in $SRCDIR, unpack, move the files.

    cd $SRCDIR
    tar xzf PBSuite_${VERSION}.tgz
    cd PBSuite_${VERSION}
    mv * $CLUSTERDIR

Now, add $CLUSTERDIR and $RE_PYTHON/lib/python2.7/site-packages to PYTHONPATH.

Define SWEETPATH to be $CLUSTERDIR.

Add $CLUSTERDIR/bin to PATH.

Edit lots of files.  In $CLUSTERDIR/bin:

    MergeTail.sh  : use system java and picard/1.85
    quickN50.py   : use #!/usr/bin/env python

No idea what is up with reQuick.sh, looks like a temp script.

