MACE 1.2
========

<http://chipexo.sourceforge.net>

LOG
---

    cd /sw/apps/bioinfo
    mkdir MACE
    cd MACE
    VERSION=1.2
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    P=$PWD
    cd src_$CLUSTER
    wget http://downloads.sourceforge.net/project/chipexo/MACE-${VERSION}.tar.gz
    tar xzf MACE-${VERSION}.tar.gz 
    cd MACE-$VERSION
    module load python/2.7.6
    export PYTHONPATH=$P/lib/python2.7/site-packages
    mkdir -p $PYTHONPATH
    python setup.py install --prefix=$P

The first round fails right at the end, but simply restarting worked.

    python setup.py install --prefix=$P

The mf file should add the same directory used above to `PYTHONPATH`, and `$P/bin` to `PATH`.

