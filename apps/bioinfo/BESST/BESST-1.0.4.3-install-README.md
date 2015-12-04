# BESST-1.0.4.3-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

BESST 1.0.4.3

DESCRIPTION
-----------

Contig scaffolder

WEBSITE
-------

    https://github.com/ksahlin/BESST

MODULE REQUIREMENTS
-------------------

According to docs/INSTALL.txt BESST requires pysam 0.6 and networkx 1.6.  BUT
setup.py wants pysam == 0.7, networkx >= 1.4, mathstats (if available) and
scipy >= 0.9.  In runBESST it will also use matplotlib if available.


LOG
---

    umask 0002
    TOOLDIR=/sw/apps/bioinfo/BESST
    VERSION=1.0.4.3
    CLUSTER=milou
    BESST_VERSION=$TOOLDIR/$VERSION
    BESST_CLUSTER=$BESST_VERSION/$CLUSTER
    mkdir -p $BESST_CLUSTER
    cd $BESST_VERSION
    module load python/2.7
    pip install --install-option="--prefix=$BESST_CLUSTER" BESST

Now fetch the github repository for the missing diploid/lib/ directory

    cd $TOOLDIR
    git clone git://github.com/ksahlin/BESST.git  # Creates /sw/apps/bioinfo/BESST/BESST/
    cp -av BESST/BESST/diploid/lib $VERSION/$CLUSTER/lib/python2.7/site-packages/BESST/diploid/
    cd $VERSION/$CLUSTER/lib/python2.7/site-packages/BESST/diploid/lib
    g++ -shared -c -fPIC swmodule.cpp -o swmodule.o
    g++ -shared -Wl,-soname,smith_waterman.so -o smith_waterman.so swmodule.o 

    cd $TOOLDIR
    mkdir -p mf
    cp /sw/apps/bioinfo/cutadapt.mf/1.3 mf/1.0.4.3

Edit mf/1.0.4.3 for installation.

This installs everything into the version directory.  The mf file should then
add $BESST_CLUSTER/bin to PATH and $BESST_CLUSTER/lib/python2.7/site-packages
to both PYTHONPATH and LD_LIBRARY_PATH.

Turns out I've been using my own pip version.  There is no pip installed by default
on Uppmax, apparently.

Load python 2.7 in the module file.  **This must be 2.7**.  If 2.7.6 is loaded you
will see errors that metnion _weakref.  Ths lack of backward compatibility in
python between minor versions is terrible.

OK, working so far, but it seems that there is a disconnect between the version
available at pip (1.0.4.3) and the version at the developer's github repository
(1.0.4.2).  It seems from github that 1.0.4.2 is correct, that 1.0.4.3 is
rolled back.  I emailed the developer Kristoffer Sahlin (ksahlin@csc.kth.se) to
see what is correct.  He informed me that pypi now has the latest as 1.0.4.4
which includes some github corrections.  I'll install 1.0.4.4 spearately.

