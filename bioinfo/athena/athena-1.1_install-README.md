athena/1.1
==========

LOG
---

    CLUSTER=rackham
    OTHERCLUSTERS="bianca irma"
    VERSION=1.1
    TOOL=/sw/apps/bioinfo/athena
    mkdir -p $TOOL/src $TOOL/$VERSION/$CLUSTER

    cd $TOOL/src
    wget https://github.com/abishara/athena_meta/archive/$VERSION.tar.gz
    tar xf $VERSION.tar.gz
    cd athena_meta-$VERSION
    module load python/2.7.11
    PYTHONUSERBASE=$TOOL/$VERSION/$CLUSTER pip install -r requirements.txt --user
    python setup.py build
    PYTHONUSERBASE=$TOOL/$VERSION/$CLUSTER python setup.py install --user
    cd ..
    rm -rf athena_meta-$VERSION

    chgrp -R sw $TOOL
    chmod -R g+rwx $TOOL
