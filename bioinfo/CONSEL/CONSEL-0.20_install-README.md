CONSEL/0.20
========================

<http://stat.sys.i.kyoto-u.ac.jp/prog/consel/>

LOG
---

Downloaded and compiled on milou and rackham using gcc/6.3.0 which gave a lot of warnings but no real problems

    TOOL=CONSEL
    VERSION=0.20
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/apps/bioinfo/$TOOL
    fixup /sw/apps/bioinfo/$TOOL
    cd /sw/apps/bioinfo/$TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd src
    wget http://stat.sys.i.kyoto-u.ac.jp/prog/consel/pub/cnsls020.tgz
    tar xvf cnsls020.tgz #Note that it is not a gzip file, just a tarball.
    cd consel/src
    module load gcc/6.3.0
    make
    make install bindir=../../../milou/bin
