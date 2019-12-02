LDpred/1.0.8
============

    TOOL=LDpred
    VERSION=1.0.8
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    TOOLDIR=/sw/bioinfo/$TOOL
    mkdir -p $TOOLDIR/$VERSION/$CLUSTER
    cd $TOOLDIR/$VERSION
    for CL in snowy irma bianca ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    cd $CLUSTER
    module load python/3.7.2
    PYTHONUSERBASE=$PWD pip3 install ldpred==$VERSION --user
    cd $TOOLDIR
    fixup $VERSION
