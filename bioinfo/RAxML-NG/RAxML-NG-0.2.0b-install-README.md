RAxML-NG-0.2.0b-install-README.md
=================================

<https://github.com/amkozlov/raxml-ng>

LOG
---

Use the precompiled binaries, extract directly into bin.

    VERSION=0.2.0b
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    mkdir RAxML-NG
    cd RAxML-NG
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir $CLUSTER
    cd $CLUSTER
    mkdir bin
    cd bin
    wget https://github.com/amkozlov/raxml-ng/releases/download/${VERSION/b/}/raxml-ng_v${VERSION}_linux_x86_64.zip

