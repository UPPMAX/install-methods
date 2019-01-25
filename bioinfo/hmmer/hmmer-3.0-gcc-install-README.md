hmmmer/3.0-gcc
==============

README file for project

LOG
---

    wget http://selab.janelia.org/software/hmmer3/3.0/hmmer-3.0.tar.gz
    tar zxf hmmer-3.0.tar.gz
    cd hmmer-3.0
    module load openmpi
    ./configure --prefix //////sw/apps/bioinfo/hmmer/3.0/tintin_gcc_openmpi --enable-mpi
    make
    make check
    make install

-------
AUTHOR

Pall Isolfur Olason, pall.olason@ebc.uu.se

Copyright (C) 2012 by Pall Isolfur Olason

