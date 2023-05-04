go/1.11.5
=========

LOG
---

    TOOL=/sw/comp/go
    VERSION=1.11.5
    mkdir -p $TOOL/$VERSION/src_
    cd $TOOL/$VERSION/src_
    test -e *.tar.gz || wget https://dl.google.com/go/go$VERSION.linux-amd64.tar.gz
    tar xf go$VERSION.linux-amd64.tar.gz
    mv go/* ../
    rmdir go
