MethPipe-3.4.3-install-README.md
================================

<http://smithlabresearch.org/software/methpipe/>

<https://github.com/smithlabcode/methpipe/>

LOG
---

    VERSION=3.4.3
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir MethPipe
    cd MethPipe/
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    mkdir src
    cd src
    [[ -f methpipe-${VERSION}.tar.bz2 ]] || wget http://smithlabresearch.org/downloads/methpipe-${VERSION}.tar.bz2
    tar xjf methpipe-${VERSION}.tar.bz2
    mv methpipe-$VERSION methpipe-${VERSION}-$CLUSTER
    cd methpipe-${VERSION}-$CLUSTER
    module load gcc/6.3.0 gsl/2.3
    make
    make install
    cp -av bin ../../$CLUSTER/
