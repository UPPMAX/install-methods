ExpansionHunter/2.5.3
=====================

Illumina's ExpansionHunter, for human short repeat sequences.

<https://github.com/Illumina/ExpansionHunter>

LOG
---

Use precompiled version.

    TOOL=/sw/apps/bioinfo/ExpansionHunter
    VERSION=2.5.3
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget https://github.com/Illumina/ExpansionHunter/releases/download/v${VERSION}/ExpansionHunter-v${VERSION}-linux_x86_64.tar.gz
    tar xzf ExpansionHunter-v${VERSION}-linux_x86_64.tar.gz 
    mv ExpansionHunter-v${VERSION}-linux_x86_64 ../$CLUSTER
    cd ..
    for C in rackham bianca irma ; do rm -f $C && ln -s milou $C; done

For some reason, all files under `data/` are executable.  None should be.

    cd $CLUSTER
    find data -type f -exec chmod -x {} \;

