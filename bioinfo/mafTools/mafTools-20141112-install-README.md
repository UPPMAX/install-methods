# mafTools-20141112-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

mafTools 20141112

The version is given as the date the github repository was cloned.
There are no internal versions that I have found.

DESCRIPTION
-----------

mafTools : Tools for manipulating MAF alignment files


WEBSITE
-------

    https://github.com/dentearl/mafTools


MODULE REQUIREMENTS
-------------------

It has a lot of requirements for building, but few for running.  There is
a python script in the executables, and the other executables were built
with gcc/4.8.3.  The python script uses generic imports so any version of
python is probably fine, so no need to specify a load in the mf.

    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/4.8.3_milou/lib64
    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/4.8.3_milou/lib


LOG
---

This required the installation of several other github python repositories
and setting various variables to get building and especially testing to work.
Although we do not need to load python or gcc with the module, we do need
them both for the build.

    module load python/2.7.6
    module load gcc/4.8.3

    TOOL=/sw/apps/bioinfo/mafTools
    VERSION=20141112
    TOOLDIR=$TOOL/$VERSION
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    CLUSTER=milou
    CLUSTERDIR=$TOOLDIR/$CLUSTER
    mkdir -p $CLUSTERDIR src

Install required python packages.  Since numpy and scipy are in our system
libraries on milou and tintin, no need to install those.  So the only one
we need is 'networkx'.

    RE_PYTHON=$CLUSTERDIR/python_packages
    mkdir -p $RE_PYTHON/lib/python2.7/site-packages
    pip install --target=$RE_PYTHON/lib/python2.7/site-packages networkx

Now get and build 'sonLib' github repository.

    cd $TOOLDIR/src
    git clone https://github.com/benedictpaten/sonLib
    cd sonLib/
    make all

Modify PYTHONPATH and PATH to pass tests.

    export PYTHONPATH="$TOOLDIR/src:$PYTHONPATH"
    export PATH="$TOOLDIR/src/sonLib/bin:$PATH"
    make test

Now get other specified repository 'pinchesAndCacti' github repository. To
pass its tests, we need to get two other repositories first.  This was not
spelled out at the repository for mafTools.

    cd $TOOLDIR/src
    git clone https://github.com/benedictpaten/cactus.git
    cd cactus
    make all
    cd $TOOLDIR/src
    git clone https://github.com/benedictpaten/jobTree.git
    git clone https://github.com/benedictpaten/pinchesAndCacti.git
    cd pinchesAndCacti
    make all
    make test

Now get mafTools.

    cd $TOOLDIR/src
    git clone https://github.com/dentearl/mafTools.git

First we have to remove -Werror from gcc cflags.  An annoying flag that
should not be used for production compiles.  Multiz had this same issue.

    cd mafTools
    vi inc/common.mk

Now remove -Werror.

    < cflags_opt = -O3 -Wall -Werror --pedantic -funroll-loops -DNDEBUG ${jpl_flags}
    --
    > cflags_opt = -O3 -Wall --pedantic -funroll-loops -DNDEBUG ${jpl_flags}

    < cflags_dbg = -Wall -Werror --pedantic -g -fno-inline -DBEN_DEBUG ${jpl_flags}
    --
    > cflags_dbg = -Wall --pedantic -g -fno-inline -DBEN_DEBUG ${jpl_flags}

    < cflags_ultraDbg = -Wall -Werror --pedantic -g -fno-inline -DBEN_DEBUG -BEN_ULTRA_DEBUG
    --
    > cflags_ultraDbg = -Wall --pedantic -g -fno-inline -DBEN_DEBUG -BEN_ULTRA_DEBUG

    < cflags_prof = -Wall -Werror --pedantic -pg -O3 -g
    --
    > cflags_prof = -Wall --pedantic -pg -O3 -g

    < testFlags = -O0 -g -Wall -Werror --pedantic -I ${sonLibPath} -I ../inc -I ../external
    --
    > testFlags = -O0 -g -Wall --pedantic -I ${sonLibPath} -I ../inc -I ../external


Now build and test.

    make
    make test

The executables are in bin/.

    cd bin
    cp * $CLUSTERDIR/

Create the mf file, adding $CLUSTERDIR to the path and the gcc/4.8.3 library
directories to LD_LIBRARY_PATH; see MaSuRCA/2.3.2 for an example of that.

Now do tintin.

    CLUSTER=tintin

and set up links for other systems

    CD $TOOLDIR
    ln -s ./milou halvan
    ln -s ./milou nestor

Be a good application expert.

    cd $TOOL
    chgrp -hR sw *
    chmod -R g+w,o+r *
    find . -type d -exec chmod g+s,o+rx {} \;


