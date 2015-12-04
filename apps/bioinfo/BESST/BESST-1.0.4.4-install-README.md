# BESST-1.0.4.4-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

BESST 1.0.4.4, modules for both milou and tintin

DESCRIPTION
-----------

Contig scaffolder

WEBSITE
-------

    https://github.com/ksahlin/BESST

MODULE REQUIREMENTS
-------------------

Use pip with a local directory to install all required packages, see LOG below.


LOG
---

On milou (see special tintin instructions below):

    umask 0002
    TOOLDIR=/sw/apps/bioinfo/BESST
    VERSION=1.0.4.4
    CLUSTER=milou
    BESST_VERSION=$TOOLDIR/$VERSION
    BESST_CLUSTER=$BESST_VERSION/$CLUSTER
    mkdir -p $BESST_CLUSTER
    cd $BESST_VERSION
    module load python/2.7.6
    pip install --install-option="--prefix=$BESST_CLUSTER" BESST

Now fetch the github repository for the missing diploid/lib/ directory.  The github tree
may already be present from the build of 1.0.4.3

    cd $TOOLDIR
    git clone git://github.com/ksahlin/BESST.git  # Creates /sw/apps/bioinfo/BESST/BESST/
    cp -av BESST/BESST/diploid/lib $VERSION/$CLUSTER/lib/python2.7/site-packages/BESST/diploid/
    cd $VERSION/$CLUSTER/lib/python2.7/site-packages/BESST/diploid/lib
    g++ -shared -c -fPIC swmodule.cpp -o swmodule.o
    g++ -shared -Wl,-soname,smith_waterman.so -o smith_waterman.so swmodule.o

    cd $TOOLDIR
    cp mf/1.0.4.3 mf/1.0.4.4
    vi mf/1.0.4.4

Edit mf/1.0.4.4 for installation.  This **must load python/2.7.6**.  Also, it
should add $BESST_CLUSTER/bin to PATH and
$BESST_CLUSTER/lib/python2.7/site-packages to both PYTHONPATH and
LD_LIBRARY_PATH.

For tintin, we first needed 2.7.6 there.  There was an additional issue as the newer
pip installed with 2.7.6 on tintin did not allow downloading from non-pypi repositories
by default, and BESST's required pysam==0.7 could not be satisfied by pypi, only by
code.google.com/p/pysam.  It was easy to find the correct commands (the command-line
options --allow-external pysam --allow-unverified pysam) but I kept trying to put them
before the `install` command to pip, I should have been putting them after.  Once I saw
that the worked if placed in my ~/.pip/pip.conf, then I guessed I really did make some
sort of mistake with the command line.

Test it:

    module unload python
    module load bioinfo-tools
    module load BESST/1.0.4.4
    runBESST

On tintin, the following should be substituted for the pip line above:

    pip install --log LOG --allow-external pysam --allow-unverified pysam --install-option="--prefix=$BESST_VERSION/tintin" BESST

Check LOG to make sure that pysam==0.7 is being downloaded from
code.google.com/p/pysam, if it is, then rm LOG.


