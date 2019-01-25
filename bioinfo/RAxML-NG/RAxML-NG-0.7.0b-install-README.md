RAxML-NG-0.7.0b-install-README.md
=================================

<https://github.com/amkozlov/raxml-ng>

LOG
---

Use the precompiled binaries, extract directly into bin.

    VERSION=0.7.0b
    REMOTEVERSION=${VERSION/b/}
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    mkdir RAxML-NG
    cd RAxML-NG
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL ; done
    mkdir src
    SRC=$PWD/src
    cd $CLUSTER
    mkdir bin
    cd bin
    wget https://github.com/amkozlov/raxml-ng/releases/download/${REMOTEVERSION}/raxml-ng_v${REMOTEVERSION}_linux_x86_64.zip
    unzip raxml-ng_v${REMOTEVERSION}_linux_x86_64.zip
    mv raxml-ng_v${REMOTEVERSION}_linux_x86_64.zip $SRC/

