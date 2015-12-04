# multiz-012109-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

Multiz 012109


DESCRIPTION
-----------

Multiz and TBA : Threaded Block Aligner for multiple genome-scale alignment


WEBSITE
-------

    http://www.bx.psu.edu/miller_lab/


MODULE REQUIREMENTS
-------------------

Since we are compiling with gcc/4.8.3 I will add to LD_LIBRARY_PATH the
locations of the C/C++ libraries that I want in the mf file.  In the past I
would have loaded the gcc/4.8.3 module but this is the only side effect that I
really want from doing that.

    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/4.8.3_milou/lib64
    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/4.8.3_milou/lib


LOG
---

All clusters will share the same version, since it is just perl scripts.

    TOOL=/sw/apps/bioinfo/multiz
    VERSION=012109
    TOOLDIR=$TOOL/$VERSION
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    CLUSTER=milou
    CLUSTERDIR=$TOOLDIR/$CLUSTER
    mkdir -p $CLUSTERDIR src
    cd src
    # avoid problems using ip6
    wget -4 http://www.bx.psu.edu/miller_lab/dist/multiz-tba.012109.tar.gz
    tar xvzf multiz-tba.012109.tar.gz 
    cd multiz-tba.012109/

Now comment out the usage of -Werror, and enable compile-time optimisation.
I assume they were just being super-safe with -O0: 

    vi Makefile

    < CFLAGS = -Wall -Wextra -Werror
    < CFLAGS += -O0
    --
    > CFLAGS = -Wall -Wextra #-Werror
    > CFLAGS += -O2 #-O0

Note also that install is to INSTALLDIR, set this for installation.

    make
    make INSTALLDIR=$CLUSTERDIR install

Everything is installed to $CLUSTERDIR, this is added to PATH in the
mf file.

Prep the mf file.

Do tintin.

    CLUSTER=tintin

and set up links for other systems

    CD $TOOLDIR
    ln -s ./milou halvan
    ln -s ./milou nestor

Be a good application expert.

    cd $TOOL
    chgrp -hR sw *
    chmod -R g+w *
    find . -type d -exec chmod g+s,o+rx {} \;


