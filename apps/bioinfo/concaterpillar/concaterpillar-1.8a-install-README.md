concaterpillar 1.8a
==================

concaterpillar/1.8a

<http://leigh.geek.nz/software.shtml>

A much newer version that works against newer RAxML and uses mpi4py.

LOG
---

    cd /sw/apps/bioinfo
    cd concaterpillar/

Deactivate the old version.

    [[ -L 1.4 ]] && rm 1.4
    [[ -d 1.4_kalkyl ]] && mv 1.4_kalkyl __1.4_kalkyl

Install the new version.

    CLUSTER=${CLUSTER:?CLUSTER must be set}
    VERSION=1.4
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir src_$CLUSTER
    cd src_$CLUSTER
    wget http://rogerlab.biochemistryandmolecularbiology.dal.ca/Software/Concaterpillar/concaterpillar-${VERSION}.tar.bz2
    tar xjf concaterpillar-${VERSION}.tar.bz2 
    cd concaterpillar-${VERSION}/
    cp -av * ../../$CLUSTER/
    cd ..

Now to get old version of RAxML expected, RAxML-VI_HPC 2.2.3.  No direct
download link but it can be found under 'old versions' at
<http://sco.h-its.org/exelixis/web/software/raxml/index.html>.  Drop the
tarball in this directory.  Copy the OpenMPI-enabled RAxML to a local name so
as not to conflict with any other RAxML.

    tar xzf RAxML-VI-HPC-2.2.3.tar.gz
    cd RAxML-VI-HPC-2.2.3/
    module load intel/14.0
    module load openmpi/default
    make -f Makefile.OMP.INTEL 
    ./raxmlHPC-OMP -h
    cp -av raxmlHPC-OMP ../../$CLUSTER/raxmlHPC-OMP_ccp
    cd ..

Complete installation by giving `ccpinstall.py` the path to RAxML, which it hard-codes into the `concaterpillar.py` script.  Note the use of `yes`.

    cd ../$CLUSTER
    yes | python ccpinstall.py -r $PWD/raxmlHPC-OMP_ccp
    ./concaterpillar.py -h

The last line is check that all works and to generate the `.pyc` files s so they are owned by `user:sw`.

Perform for tintin, too.

cd /sw/apps/bioinfo/concaterpillar/
VERSION=1.8a
mkdir $VERSION
cd $VERSION
mkdir $CLUSTER src
cd src
wget http://leigh.geek.nz/software/concaterpillar-${VERSION}.tbz
tar xvjf concaterpillar-${VERSION}.tbz
cd concaterpillar-${VERSION}

Change `#!/usr/bin/python` to `#!/usr/bin/env python`.

    vi *.py

    cp -av * ../../$CLUSTER/
    cd ../../$CLUSTER

We can use RAxML from the module `raxml/7.4.7`, specify the MPI version by default.

    R=$(module load bioinfo-tools raxml/7.4.7 >/dev/null 2>&1 && which )


module load python/2.7.6
module load openmpi

Make sure mpi4py is installed with the OpenMPI version used by the RAxML used by the program.

P=$PWD
PYTHONUSERBASE=$P pip install mpi4py --user
