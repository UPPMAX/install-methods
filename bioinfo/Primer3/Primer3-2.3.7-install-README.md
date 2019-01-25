Primer3-2.3.7-install-README.md
===============================

<http://primer3.sourceforge.net/>

LOG
---

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=2.3.7
    cd /sw/apps/bioinfo/
    mkdir Primer3
    cd Primer3/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir $CLUSTER src_$CLUSTER
    cd src_$CLUSTER
    wget https://downloads.sourceforge.net/project/primer3/primer3/${VERSION}/primer3-${VERSION}.tar.gz
    tar xvzf primer3-$VERSION.tar.gz 
    cd primer3-$VERSION/
    cd src
    make
    make test

Seems to work... stopped the 10-20min test early.

    mkdir ../../../$CLUSTER/bin
    cp primer3_core ntdpal oligotm long_seq_tm_test ../../../$CLUSTER/bin/

Now set up mf file adding `$CLUSTER/bin` to `PATH`.
