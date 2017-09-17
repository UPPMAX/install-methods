Vmatch/2.3.0
============

<http://www.vmatch.de/>

Vmatch, a versatile software tool for efficiently solving large scale sequence
matching tasks.  Now no need for a licence file.  Thank you!


LOG
---

    VERSION=2.3.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir Vmatch
    cd Vmatch/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir src/
    cd src/
    wget http://www.vmatch.de/distributions/vmatch-${VERSION}-Linux_x86_64-64bit.tar.gz
    tar xzf vmatch-${VERSION}-Linux_x86_64-64bit.tar.gz 

Unpacks a directory, so move that to the cluster directory and link other clusters to it.

    mv vmatch-${VERSION}-Linux_x86_64-64bit ../$CLUSTER
    cd ..
    ln -s $CLUSTER rackham
    ln -s $CLUSTER irma
    ln -s $CLUSTER bianca

Use mf from 2.2.5.
