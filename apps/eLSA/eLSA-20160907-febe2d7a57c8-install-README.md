eLSA/20160907-febe2d7a57c8
==========================

Extended Local Similarity Analysis (eLSA)

<https://bitbucket.org/charade/elsa/overview>

Versioned on the data and commit hash of the master tree download, so it was
first downloaded and unpacked to determine how `HASH` and `VERSION` would be
set.

LOG
---

    HASH=febe2d7a57c8
    VERSION=20160907-$HASH
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    wget --timestamping https://bitbucket.org/charade/elsa/get/master.tar.gz
    tar xvzf master.tar.gz
    cd charade-elsa-$HASH

Our `python/2.7.6` module contains numpy and scipy versioned sufficiently to
use for this package.  Run `python setup.py install` twice, the second after
setting `PYTHONPATH`.

    module load python/2.7.6
    echo $PFX
    python setup.py install --prefix=$PFX
    export PYTHONPATH=$PFX/lib/python2.7/site-packages
    python setup.py install --prefix=$PFX

In the mf file, set `PATH` and `PYTHONPATH` and, following the install
instructions, set `ELSA_BIN` too.
