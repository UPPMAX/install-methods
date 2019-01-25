eigensoft 6.1.4
===============

<http://www.hsph.harvard.edu/alkes-price/software/>

Uppmax-specific changes detailed in the commit history at
<https://github.com/douglasgscofield/eigensoft>.

Log
---

    CLUSTER=${CLUSTER:?CLUSTER must be set}
    [[ "$(uname -n)" == "rackham5.uppmax.uu.se" ]] && MNT=/mnt || MNT=
    VERSION=6.1.4
    mkdir -p $MNT/sw/apps/bioinfo/eigensoft/${VERSION}
    cd $MNT/sw/apps/bioinfo/eigensoft/${VERSION}

Note: do not create `$CLUSTER` directory, the unpacked directory will be moved
there after the build for each cluster.

    mkdir -p src
    cd src
    [[ -f EIG-${VERSION}.tar.gz ]] || curl -O https://data.broadinstitute.org/alkesgroup/EIGENSOFT/EIG-${VERSION}.tar.gz
    tar xzf EIG-${VERSION}.tar.gz
    cd EIG-${VERSION}
    cd bin

Change she-bang perl to `#!/usr/bin/env perl`.

    vi *.perl ploteig

Set up the build.

    cd ../src
    module load gcc/6.3.0
    [[ "$CLUSTER" == "rackham" ]] && module load openblas/0.2.19 || module load openblas/0.2.14a
    [[ "$CLUSTER" == "rackham" ]] && module load gsl/2.3 || module load gsl/2.1

Now, change IDSIZE to allow longer ID names.

    vi ../include/admutils.h  # to change IDSIZE to 120

Make and copy the whole thing.

    make
    make install
    cd ../..
    mv EIG6.1.4 ../$CLUSTER  # this creates the $CLUSTER directory

Rpath should be set correctly in the executables, so make sure eigensoft, gcc,
gsl and openblas are *unloaded* and do:

    module unload gcc gsl openblas
    ldd $MNT/sw/apps/bioinfo/eigensoft/$VERSION/$CLUSTER/bin/smartpca

It should find the correct versions of all the libraries successfully.


