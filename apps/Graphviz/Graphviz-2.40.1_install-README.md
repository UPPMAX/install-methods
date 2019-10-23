Graphviz/2.40.1
========================

<https://graphviz.gitlab.io>

Used under license:


Structure creating script (makeroom_Graphviz_2.40.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/Graphviz/makeroom_2.40.1.sh

LOG
---

    TOOL=Graphviz
    VERSION=2.40.1
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    ./makeroom_Graphviz_2.40.1.sh
    cd /sw/apps/$TOOL/$VERSION/src
    wget https://graphviz.gitlab.io/pub/graphviz/stable/SOURCES/graphviz.tar.gz
    tar xvf graphviz.tar.gz
    cd graphviz-2.40.1
    ./configure prefix=$PREFIX
    make
    make install
    cd $TOOLDIR
    ./Graphviz-2.40.1_post-install.sh

