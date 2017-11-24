star-fusion/1.2.0
=================

<https://github.com/STAR-Fusion/STAR-Fusion>


LOG
---

    VERSION=1.2.0
    C=rackham
    TOOL=/sw/apps/bioinfo/star-fusion
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p src
    PFX=$TOOL/$VERSION/$C
    cd src
    [[ -f STAR-Fusion-v${VERSION}.FULL.tar.gz ]] || wget https://github.com/STAR-Fusion/STAR-Fusion/releases/download/STAR-Fusion-v${VERSION}/STAR-Fusion-v${VERSION}.FULL.tar.gz
    tar xvf STAR-Fusion-v${VERSION}.FULL.tar.gz
    mv STAR-Fusion-v${VERSION} $PFX

Move the unpacked tarball to the cluster directory, and make links for the other clusters.

In the mf file, load `star/2.5.3a` if a star is not already loaded, and load the most recent perl with perl_modules.



