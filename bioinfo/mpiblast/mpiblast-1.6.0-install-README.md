# mpiblast.README     pallol@kalkyl1.uppmax.uu.se     2012/09/04 12:48:35

TITLE

	mpiblast compilation

DESCRIPTION

	steps to compile mpiblast on kalkyl

TODO

	-fix module load/incompatibility	

LOG

# sep 4, 2012	

Jonas Hagberg previously installed mpiblast using intel and openmpi 1.4.2 (explicitly requested in the module file for mpiblast) but
this combination of compiler and openmpi does not seem to exist anymore on kalkyl, so when loading the mpiblast module we get an error:

pallol@kalkyl3 ~ $ module load mpiblast
OpenMPI version 1.4.2, compiled with intel11.1 not installed on kalkyl3.uppmax.uu.se

perhaps this is just some module load artifact, dont know if the installation works or not.

anyway...

# downloaded mpiblast (still version 1.6.0)
$ wget http://www.mpiblast.org/downloads/files/mpiBLAST-1.6.0.tgz

# untar and cd into mpiblast dir
# first attempt with gcc + openmpi
$ module load openmpi

# this loads openmpi 1.4.5 (although the module is named openmpi/1.4) compiled with gcc 4.4.6 (/usr/bin/gcc currently)

# then build the package, according to the INSTALL file:
$ ./configure --prefix=//////sw/apps/bioinfo/mpiblast/1.6.0/kalkyl/gcc_4.4.6-openmpi_1.4.5
$ make clean
$ make ncbi
$ make
$ make install

# an intel version may follow - depends on speed etc...


-------
AUTHOR

Pall Isolfur Olason, pall.olason@ebc.uu.se

Copyright (C) 2012 by Pall Isolfur Olason

