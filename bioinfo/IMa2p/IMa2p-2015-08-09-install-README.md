No versioning and no downloadable bundle, so must clone from github.
The configure included is not appropriate and seems to have some bugs.

    git clone https://github.com/arunsethuraman/ima2p.git
    cd ima2p
    autoconf

Now within configure, change

    /usr/local  to /sw/apps/bioinfo/IMa2p/2015-08-09/milou

and change the default value of with_mpi to yes.  Normally you would
specify these with --with-mpi=yes and --prefix on the ./configure 
command line, but for some reason I cannot figure out, this does not
work.

Then, load gcc and openmpi.

    module load gcc/4.9.2 openmpi/1.8.4

These configs are not complete.

    export CPLUS_INCLUDE_PATH=$MPI_ROOT/include
    export LIBRARY_PATH=$LD_LIBRARY_PATH:$MPI_ROOT/lib

These are to help configure find its way.

    ./configure

    make
    make install

