cdbfasta/0.99
=============


    CLUSTER=rackham
    OTHERCLUSTERS="irma bianca"
    VERSION=0.99
    TOOL=/sw/apps/bioinfo/cdbfasta
    mkdir -p $TOOL/$VERSION/$CLUSTER/bin $TOOL/src
    cd $TOOL/src
    wget ftp://occams.dfci.harvard.edu/pub/bio/tgi/software/cdbfasta/cdbfasta.tar.gz
    tar xf cdbfasta.tar.gz
    cd cdbfasta
    make
    cp cdbfasta ../../$VERSION/$CLUSTER/bin
    cp cdbyank ../../$VERSION/$CLUSTER/bin
    cd ..
    rm -rf cdbfasta
    cd $TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done
    chgrp -R sw $TOOL/$VERSION
    chmod -R g+rwx $TOOL/$VERSION

DGS: After the fact, use `patchelf/0.10` to add the library directories for
`gcc/6.3.0` to the executables so that module is no longer loaded.
