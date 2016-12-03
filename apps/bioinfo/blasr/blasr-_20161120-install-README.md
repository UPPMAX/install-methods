blasr as of 20161120
================

Blasr does not have its own version, so I am giving it the date of the git
pull, 20161120.  Prereqs will be installed here as well.

Some things are different since 20150922 was installed.  We have a separate
hdf5 module (that doesn't set HDF5_INCLUDE and HDF5_LIB but I modified the mf
files so that now they do).  This also brings in sz compression.  We also have
an htslib module.  But we don't have cram, so no cram tests.

    VERSION=20161122
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir -p /sw/apps/bioinfo/blasr
    cd /sw/apps/bioinfo/blasr
    mkdir -p $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    P=$PWD
    mkdir bin lib
    cd ../src_$CLUSTER
    module load gcc/5.3.0
    module load hdf5/1.8.16_gcc5.3.0
    module load bioinfo-tools htslib/1.3
    module load python/2.7.9
    git clone --recursive https://github.com/PacificBiosciences/blasr.git
    ./configure.py --with-szlib --shared --sub --no-pbbam HDF5_INCLUDE=$HDF5_ROOT/include HDF5_LIB=$HDF5_ROOT/lib
    make configure-submodule 
    make build-submodule
    make blasr
    make
    cp blasr $P/bin/
    cd utils/
    cp loadPulses pls2fasta samFilter samtoh5 samtom4 sawriter sdpMatcher toAfg $P/bin/
    cd ..

Now see what blasr needs for shared libraries from the submodules, and check that we have them all for the other tools too.

    ldd blasr
    #find . -name 'libpbihdf.so'
    cp ./libcpp/hdf/libpbihdf.so $P/lib/
    #find . -name 'libblasr.so'
    cp ./libcpp/alignment/libblasr.so $P/lib/
    #find . -name 'libpbdata.so'
    cp ./libcpp/pbdata/libpbdata.so $P/lib/

    cd $P/bin
    ldd *

The mf file should use setenv for LD_LIBRARY_PATH and PATH, and not set MANPATH.
