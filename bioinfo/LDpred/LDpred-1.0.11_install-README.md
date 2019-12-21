LDpred/1.0.11
============

    TOOL=LDpred
    VERSION=1.0.11
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    TOOLDIR=/sw/bioinfo/$TOOL
    mkdir -p $TOOLDIR/$VERSION/$CLUSTER
    cd $TOOLDIR/$VERSION
    for CL in snowy irma bianca ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    PREFIX=$PWD/$CLUSTER
    module load python/3.7.2
    PYTHONUSERBASE=$PREFIX pip3 install ldpred==$VERSION --user
    cd $TOOLDIR
    fixup $VERSION
