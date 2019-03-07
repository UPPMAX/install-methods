LoRDEC/0.9
==========

Long-read correction.  The Linux binaries need libc 2.27, we have libc 2.17.

Build from source.  It downloads its own copy of boost, etc., so remove the
untarred source directory after building.

The `Makefile` also has an `install` target, keying off the `PREFIX` variable
that can be provided on the command line.  However, there's a bug in this when
it looks for `lordec_sge_slurm_wrapper.sh` so we'll go ahead and still install
these by hand.  I verified that the executables included are all those included
in the executable-only download.downloaded t


LOG
---

    VERSION=0.9
    cd /sw/bioinfo/
    mkdir -p LoRDEC
    cd LoRDEC/
    mkdir $VERSION
    mkdir -p mf
    cd $VERSION
    mkdir $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CL in snowy bianca irma ; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    cd src/
    wget https://gite.lirmm.fr/lordec/lordec-releases/uploads/800a96d81b3348e368a0ff3a260a88e1/lordec-src_${VERSION}.tar.bz2
    tar xjf lordec-src_${VERSION}.tar.bz2 
    cd lordec-src_${VERSION}
    module load gcc/7.4.0 cmake/3.13.2
    make clean all -j8
    module unload gcc cmake
    ldd lordec-correct
    cp -av lordec-build-SR-graph lordec-correct lordec-stat lordec-trim lordec-trim-split lordec_sge_slurm_wrapper.sh $PFX/
    cd ..
    rm -rf lordec-src_${VERSION}


The mf file has simple needs: just add `$PFX` to the `PATH`.

