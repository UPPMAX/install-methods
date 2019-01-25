e»¿Eigens/7.2.1
===============

We want 7.2.1, but there are two commits in the tree.  One of them restores the
ploteig script, which we want.  So, make sure we reset to the top hash at this
point.

<http://www.hsph.harvard.edu/alkes-price/software/>

LOG
---

    VERSION=7.2.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/eigensoft/
    mkdir -p  $VERSION
    cd  $VERSION
    mkdir -p src
    cd src
    module load git/2.16.1
    [[ -d EIG ]] && rm -rf EIG
    [[ -d EIG ]] || git clone https://github.com/DReichLab/EIG.git
    cd EIG
    git reset --hard 7a6036bf36d8d2ed038b83d26112cdde4f383747
    module load gcc/6.3.0
    module load gsl/2.3 
    module load openblas/0.2.19 

Change she-bang perl to `#!/usr/bin/env perl`.

Now, in admutils.h, change IDSIZE to 120, and in smartrel.c, MAXPOPS to 1000.
Open these files separately.

    cd bin
    vi *.perl ploteig
    cd ../src
    vi +4 ../include/admutils.h
    vi +83 eigensrc/smartrel.c

Finally, the Makefile includes some directories for openblas include files.
This is probably not a problem since our systems don't have these installed
in this location, but don't take a chance.

    vi Makefile

and change the first line to remove the first version, and use the second.

    #override CFLAGS += -I../include -I/usr/include/openblas
    override CFLAGS += -I../include

Make and copy the whole thing.

    make
    make install
    cd ../..
    mv EIG ../$CLUSTER  # this creates the $CLUSTER directory

Rpath should be set correctly in the executables, so make sure eigensoft, gcc,
gsl and openblas are *unloaded* and do:

    module unload gcc gsl openblas
    ldd $MNT/sw/apps/bioinfo/eigensoft/$VERSION/$CLUSTER/bin/smartpca

It should find the correct versions of all the libraries successfully.

