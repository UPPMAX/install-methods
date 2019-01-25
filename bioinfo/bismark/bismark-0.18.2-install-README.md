bismark/0.18.2
==============

Hotfix request, so downloaded from github:

<https://github.com/FelixKrueger/Bismark/releases>

rather than standard location:

<https://www.bioinformatics.babraham.ac.uk/projects/download.html#bismark>


Note that this is a collection of Perl scripts, so installing for hardcoded
`CLUSTER=milou` and linking the other clusters there.


LOG
---


    VERSION=0.18.2
    cd /sw/apps/bioinfo/bismark
    CLUSTER=milou
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget https://github.com/FelixKrueger/Bismark/archive/${VERSION}.tar.gz
    tar xzf ${VERSION}.tar.gz 

Just move the unpacked directory to be the $CLUSTER directory

    mv Bismark-${VERSION} ../$CLUSTER

Make sure the contents are indeed only perl scripts.

    cd ../$CLUSTER
    file *

If so, continue with symlinks.

    cd ..
    ln -s milou rackham
    ln -s milou irma
    ln -s milou bianca

