cellranger/2.0.2
================

Chromium Cell Ranger

<https://support.10xgenomics.com/single-cell-gene-expression/software/downloads/latest>

Note: I restructured the directories, previously they were
`/sw/apps/bioinfo/Chromium/cellranger/...`, so I lifted cellranger to
`Chromium-cellranger`.

I also decoupled the cellranger data version from the module version, since
that is what 10X Genomics did as well.

LOG
---

The long download ticket will expire, but I'll xxx it out nonetheless.  It's
simple to get the download from the 10X Genomics website.

Precompiled Linux 64-bit executables are provided.  Good for all systems.

    TOOL=/sw/apps/bioinfo/Chromium-cellranger
    VERSION=2.0.2
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget -O cellranger-${VERSION}.tar.gz "http://cf.10xgenomics.com/releases/cell-exp/cellranger-2.0.2.tar.gz?Expires=1506040139&Policy=xxxxxxx&Signature=xxxxxxx&Key-Pair-Id=XXXXXXX"
    tar xzf cellranger-2.0.2.tar.gz 
    mv cellranger-2.0.2 ../milou
    cd ..
    for S in rackham irma bianca ; do ln -s milou $S; done

The data version 1.0.2 is already available at `/sw/data/uppnex/Chromium/cellranger/`.

