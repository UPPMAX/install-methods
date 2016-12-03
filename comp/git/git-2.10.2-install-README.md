git 2.10.2
==========

<https://github.com/git/git>

LOG
---

    TOOL=/sw/comp/git
    VERSION=2.10.2
    VERSIONDIR=$TOOL/$VERSION
    mkdir -p $VERSIONDIR
    cd $VERSIONDIR
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p src_$CLUSTER
    mkdir -p $CLUSTER
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    cd src_$CLUSTER
    wget https://github.com/git/git/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    cd git-${VERSION}/
    make configure
    ./configure --prefix=/sw/comp/git/$VERSION/$CLUSTER
    make all

'make doc' will not work, we are missing asciidoc and perhaps other tools.  It
does not matter, there are lots and lots of git resources available online, and
there is very good in-tool help as well.

    make install

Use mf file from 2.5.0.  We need a .version file since the module system puts 2.5.0 first by default.
