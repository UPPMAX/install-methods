Eigensoft 7.2.0
===============

<http://www.hsph.harvard.edu/alkes-price/software/>

    CLUSTER=milou
    VERSION=7.2.0
    cd /sw/apps/bioinfo/eigensoft/
    mkdir -p  $VERSION
    cd  $VERSION
    mkdir -p src
    cd src
    [[ -f EIG-${VERSION}.tar.gz ]] || curl -O   https://data.broadinstitute.org/alkesgroup/EIGENSOFT/EIG-${VERSION}.tar.gz
    tar xzf EIG-${VERSION}.tar.gz
    cd EIG-${VERSION}
    cd bin
    
Change she-bang perl to `#!/usr/bin/env perl`.

    vi *.perl ploteig

Set up the build.

    cd ../src
    module load gcc/6.3.0
    module load gsl/2.3 
    module load openblas/0.2.19 

Now, change IDSIZE to allow longer ID names.

    vi ../include/admutils.h  # to change IDSIZE to 120
    vi eigensrc/smartrel.c #to change MAXPOPS to 1000

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

Follow the steps from “set up the build” on rackham
create sym link for bianca and irma.
