# NGSUtils-0.5.9-install-README.md

NGSUtils/0.5.9
==============

<http://ngsutils.org/>


LOG
---

    VERSION=0.5.9
    CLUSTER=milou
    cd /sw/apps/bioinfo
    mkdir NGSUtils/
    cd NGSUtils/
    mkdir $VERSION
    cd $VERSION
    mkdir -p src
    cd src
    wget https://github.com/ngsutils/ngsutils/archive/ngsutils-${VERSION}.tar.gz
    tar xzf ngsutils-0.5.9.tar.gz 

Build for each cluster in-place, so move unpacked directory to `$CLUSTER`.  Along the way, I also rebuilt the new shared-library-containing `python/2.7.6` and tested with Wes's help so that has become the default.

    mv ngsutils-ngsutils-0.5.9 ../$CLUSTER
    cd ../$CLUSTER
    module load libcurl/7.45.0
    module load python/2.7.6
    make

Everything is now in `bin/`.

Borrow mf from cutadapt and edit.

Repeat all for tintin.
