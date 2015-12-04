# FALCON-0.3.0-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

FALCON 0.3.0


DESCRIPTION
-----------

Repeat discovery tool


WEBSITE
-------

    https://github.com/PacificBiosciences/FALCON


MODULE REQUIREMENTS
-------------------

This module wants to install in a Python virtualenv.  I will try that.

LOG
===

    TOOL=/sw/apps/bioinfo/FALCON
    VERSION=0.3.0
    VERSIONDIR=$TOOL/$VERSION
    mkdir -p $VERSIONDIR
    cd $VERSIONDIR
    mkdir -p src
    CLUSTER=milou
    mkdir -p $CLUSTER
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    cd src

Modules needed.

    module load gcc/4.9.2
    module load python/2.7.9

Now follow their virtualenv protocol.

    git clone git://github.com/PacificBiosciences/FALCON-integrate.git
    cd FALCON-integrate
    git checkout $VERSION
    export FALCON_PREFIX=$CLUSTERDIR
    make init
    make virtualenv
    make check
    make -j install
    make test  # to run a simple one

The test will fail, because the installation creates git-sym as a symlink to
../../git-sym/git-sym, rather than to 
/pica/sw/apps/bioinfo/FALCON/0.3.0/src/FALCON-integrate/git-sym/git-sym.
Relinking this and rerunning the test does not seem to help, because the test
setup recreates the relative link and things are messed up again.

Apparently we can skip setting up a virtualenv and just manage with the
installation into FALCON_PREFIX:

    https://github.com/PacificBiosciences/FALCON/issues/167
    https://github.com/pb-cdunn/FALCON-make/blob/master/makefile

but I need to check this with a module file.

Do I need to add $FALCON_PREFIX/lib/python2.7/site-packages to PYTHONPATH?

It appears not.  Also, add a message upon module loading to instruct users
to use the line 'job_type = local' in their config files to avoid using SGE.

I did some testing.

    module load bioinfo-tools FALCON/0.3.0
    cd /sw/apps/bioinfo/FALCON/0.3.0/src/FALCON-integrate/FALCON-examples
    make run-synth0

Seems to work fine.

    make run-ecoli

This one died at first, because it wanted qsub, i.e., SGE.  Edited
run/ecoli/fc_run.cfg to uncommend 'job_type = local' and adjusted the number of
concurrent jobs down to 16 and it ran, though with more threads than I
anticipated.  I did not allow it to finish but it appears to have been on the
way. Working out those details will be up to the end users.

I installed also on tintin using a symlink, without separate compilation, and
it appears to work fine.  Crossing my fingers.

