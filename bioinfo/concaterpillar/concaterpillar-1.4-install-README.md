concaterpillar 1.4
==================

concaterpillar/1.4

<http://rogerlab.biochemistryandmolecularbiology.dal.ca/Software/Software.htm#Concaterpillar>

This python tool is several years old; it was written against python 2.4, and uses a quite old version of RAxML.  It seems to work fine with python 2.6.6 that is the default on SI 6.7 although the install script might give a warning about use of a deprecated package.

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

