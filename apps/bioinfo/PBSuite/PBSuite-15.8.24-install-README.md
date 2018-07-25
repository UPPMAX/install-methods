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


Installing for rackham and other CentOS 7 systems
-------------------------------------------------

Largely just works, except the later `blasr/5.3-20171117-f72428d` is what is
available there.  Some changes to the blasr options used in two scripts are
necessary because of this.  Thanks to Valentina Peona for providing these!

Starting at line 79 in bin/m4pie.py:

    #cmd = ("blasr %s %s %s -nproc %d -m 4 -bestn 1 -nCandidates 20 -out %s"  # UPPMAX
    #       " -minPctIdentity 75 -sdpTupleSize 6 -noSplitSubreads") \  # UPPMAX
    cmd = ("blasr %s %s %s --nproc %d -m 4 --bestn 1 --nCandidates 20 --out %s"
           " --minPctIdentity 75 --sdpTupleSize 6 --noSplitSubreads") \
           % (fq, ref, sa, nproc, out)

Starting at line 59 in pbsuite/jelly/Stages.py:

    #mappingTemplate = Template("blasr ${fasta} ${ref} ${sa} -m 4 -out ${outFile} ${parameters} ")  # UPPMAX
    #tailTemplate = Template("m4pie.py ${outFile} ${fasta} ${ref} --nproc ${nproc} -i ${extras}")  # UPPMAX
    mappingTemplate = Template("blasr ${fasta} ${ref} ${sa} -m 4 --out ${outFile} ${parameters} ")  # UPPMAX
    tailTemplate = Template("m4pie.py ${outFile} ${fasta} ${ref} -n ${nproc} -i ${extras}")  # UPPMAX

    ret = []
    #sa safety
    if os.path.exists(referenceSa):
        #referenceSa = "-sa " + referenceSa  # UPPMAX
        referenceSa = "--sa " + referenceSa  # UPPMAX

Also needed to upgrade the module-local installation of the h5py package, so
that it links with the proper rackham system version of libhdf5.so without
changing the python package version.  This approach works fine but the
module-local hdf5 packages must be removed first.

    module load python/2.7.9
    cd /sw/apps/bioinfo/PBSuite/15.8.24/rackham/python_packages/lib/python2.7/site-packages
    rm -rf h5py*
    PYTHONUSERBASE=/sw/apps/bioinfo/PBSuite/15.8.24/rackham/python_packages pip install --user h5py==2.5.0

Then run several PBSuite executables just to check.

    module load PBSuite/15.8.24
    Jelly.py
    Honey.py
    Setup.py
    Support.py

