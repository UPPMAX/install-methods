ldsc/1.0.0
==========

LOG
---

    SWROOT=/sw/apps/bioinfo
    TOOL=ldsc
    VERSION=1.0.0
    CLUSTER=rackham
    OTHERCLUSTER="bianca irma"

    mkdir -p $SWROOT/$TOOL/src $SWROOT/$TOOL/$VERSION/python_packages
    cd $SWROOT/$TOOL/src
    wget https://github.com/bulik/ldsc/archive/v$VERSION.tar.gz
    tar xzf v$VERSION.tar.gz
    mv ldsc-$VERSION ../$VERSION/$CLUSTER
    chmod a+x ../$VERSION/$CLUSTER/{ldsc.py,munge_sumstats.py}

    module load python/2.7.11
    REQ="bitarray==0.8 pandas==0.20 pybedtools==0.7"
    cd ../$VERSION/python_packages
    for R in $REQ; do
      PYTHONUSERBASE=$PWD pip install --user $R
    done

    cd $SWROOT/$TOOL/$VERSION
    for c in $OTHERCLUSTER; do
      ln -fs $CLUSTER $c
    done

    chgrp sw -R $SWROOT/$TOOL/$VERSION
    chmod g+rwx -R $SWROOT/$TOOL/$VERSION

