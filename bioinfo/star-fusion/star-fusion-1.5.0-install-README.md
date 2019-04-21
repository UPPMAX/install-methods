star-fusion/1.5.0
=================

<https://github.com/STAR-Fusion/STAR-Fusion>


LOG
---

    VERSION=1.5.0
    TOOL=/sw/bioinfo/star-fusion
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p src
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    cd src
    [[ -f STAR-Fusion-v${VERSION}.FULL.tar.gz ]] || wget https://github.com/STAR-Fusion/STAR-Fusion/releases/download/STAR-Fusion-v${VERSION}/STAR-Fusion-v${VERSION}.FULL.tar.gz
    tar xvf STAR-Fusion-v${VERSION}.FULL.tar.gz
    mv STAR-Fusion-v${VERSION} $PFX

Move the unpacked tarball to the cluster directory, and make links for the other clusters.

In the mf file, load `star/2.7.0e` and load the most recent perl with perl_modules.
Downloaded data for two human and one mouse assembly are now available in `$STAR_FUSION_DATA`.



