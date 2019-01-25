vsearch/2.5.2
=============

Open-source replacement for usearch.

<https://github.com/torognes/vsearch>

LOG
---

Use the precompiled executables, which work on all systems.

    cd /sw/apps/bioinfo/
    mkdir vsearch
    cd vsearch/
    VERSION=2.5.2
    CLUSTER=rackham
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    [[ -f vsearch-${VERSION}-linux-x86_64.tar.gz ]] || wget https://github.com/torognes/vsearch/releases/download/v${VERSION}/vsearch-${VERSION}-linux-x86_64.tar.gz
    tar xvzf vsearch-${VERSION}-linux-x86_64.tar.gz
    mv vsearch-${VERSION}-linux-x86_64 ../$CLUSTER
    cd ../$CLUSTER
    mv man man1
    mkdir man
    mv man1 man
    cd ..
    for C in milou bianca irma ; do ln -sf $CLUSTER $C; done


To build from source, follow the script for 2.4.3.

For mf file, borrow from phast and make sure `$modroot/share/man` is added to
`MANPATH`.  The doc pdf us in the tree but we leave that to the users to find.

