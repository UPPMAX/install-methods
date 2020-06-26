phylobayesmpi/1.8b
========================

<https://github.com/bayesiancook/pbmpi>

Used under license:
GPL v2

Structure creating script (makeroom_phylobayesmpi_1.8b.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/phylobayesmpi/makeroom_1.8b.sh

LOG
---

    TOOL=phylobayesmpi
    VERSION=1.8b
    CLUSTER=snowy
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    /home/douglas/bin/makeroom.sh -f" -t "phylobayesmpi" -v "1.8b" -s "phylogeny" -l "GPL v2" -d "PhyloBayes with MPI support" -w "https://github.com/bayesiancook/pbmpi"
    ./makeroom_phylobayesmpi_1.8b.sh
phylobayesmpi/1.8
=================

<http://megasun.bch.umontreal.ca/People/lartillot/www/downloadmpi.html>

<https://github.com/bayesiancook/pbmpi>

LOG
---

    cd /sw/apps/bioinfo/phylobayesmpi/
    VERSION=1.8
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    if [[ ! -d pbmpi ]] ; then
        ( module load git/2.10.2 && git clone https://github.com/bayesiancook/pbmpi.git )
    fi
    cd pbmpi

There are prebuilt executables under `data/` but they want a `libdat.so` which
we don't have.  Rebuild.  Needs to be compiled with an older gcc.  I'm sure a
newer one would work with the right flags but `gcc/5.3.0` has `openmpi/1.10.1`
associated with it and works fine without any `Makefile` modifications.

    module load gcc/5.3.0
    module load openmpi/1.10.1
    cd sources/
    make clean
    make

The build process installs into `../data/`.

    cd ../data
    cp -av * $PFX/
    cd ../sources
    make clean
