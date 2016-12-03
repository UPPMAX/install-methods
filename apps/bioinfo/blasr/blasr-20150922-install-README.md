Installing BLASR
================

Blasr does not have its own version, so I am giving it the date of the git
pull, 20150922.  Prereqs will be installed here as well.

    CLUSTER=milou
    module load gcc/4.9.2
    mkdir -p /sw/apps/bioinfo/blasr
    cd /sw/apps/bioinfo/blasr
    mkdir -p 20150922 src

Now install hdf5, but avoid installing szip.

# NOPE, do not install szip
#szip
#----
#
#    mkdir -p /sw/apps/bioinfo/blasr/src/szip
#    cd /sw/apps/bioinfo/blasr/src/szip
#    # get szip
#    tar xzf szip-2.1.tar.gz
#    cd szip-2.1
#    ./configure --prefix=/sw/apps/bioinfo/blasr/20150922
#    make
#
#Lots of warnings about type conversions.  Disappointing.  Distributed source
#should compile cleaner than this.
#
#    make check
#    make install


hdf5
----

    mkdir -p /sw/apps/bioinfo/blasr/src/hdf5
    cd /sw/apps/bioinfo/blasr/src/hdf5
    # get hdf5
    tar xzf hdf5-1.8.15-patch1.tar.gz
    cd hdf5-1.8.15-patch1

There is a cmake build procedure, which we will ignore for a number of reasons
including requiring cmake >= 3.1.0, and a regular build, which we will follow.
We are not compiling with MPI I/O support.  Details are in:

    less release_docs/INSTALL

    ##### NOPE no szip #### ./configure --prefix=/sw/apps/bioinfo/blasr/20150922 --enable-cxx --with-szlib=/sw/apps/bioinfo/blasr/20150922
    ./configure --prefix=/sw/apps/bioinfo/blasr/20150922/$CLUSTER --enable-cxx
    make

Lots of messages.

    make check
    make install


htslib
------

htslib is needed for CRAM support.  We want this.

    ./configure --prefix=/sw/apps/bioinfo/blasr/20150922/$CLUSTER
    make && make install


blasr and other tools
---------------------

Prior to making blasr, we need to be able to find libsz.

    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/sw/apps/bioinfo/blasr/20150922/$CLUSTER/lib
    export LD_RUN_PATH=$LD_RUN_PATH:/sw/apps/bioinfo/blasr/20150922/$CLUSTER/lib

    ./configure.py --no-pbbam HDF5_INC=/sw/apps/bioinfo/blasr/20150922/$CLUSTER/include HDF5_LIB=/sw/apps/bioinfo/blasr/20150922/$CLUSTER/lib HTSLIB_INC=/sw/apps/bioinfo/blasr/20150922/$CLUSTER/include HTSLIB_LIB=/sw/apps/bioinfo/blasr/20150922/$CLUSTER/lib

    make build-submodule

    make blasr

Make sure this works.  Build the rest of the tools with

    make

    cp blasr /sw/apps/bioinfo/blasr/20150922/$CLUSTER/bin/
    cd utils
    cp loadPulses pls2fasta samFilter samtoh5 samtom4 sawriter sdpMatcher toAfg /sw/apps/bioinfo/blasr/20150922/$CLUSTER/bin/

