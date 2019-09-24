star-fusion/1.7.0
=================

<https://github.com/STAR-Fusion/STAR-Fusion>


LOG
---

    VERSION=1.7.0
    TOOL=/sw/bioinfo/star-fusion
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p src
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    PFX=$PWD/$CLUSTER
    cd src
    [[ -f  STAR-Fusion-v${VERSION}.FULL.tar.gz ]] || wget https://github.com/STAR-Fusion/STAR-Fusion/releases/download/v${VERSION}/STAR-Fusion-v${VERSION}.FULL.tar.gz
    tar xvf STAR-Fusion-v${VERSION}.FULL.tar.gz
    mv STAR-Fusion-v${VERSION} $PFX

Move the unpacked tarball to the cluster directory, and make links for the other clusters.

In the mf file, load `star/2.7.2b` and load `perl/5.26.2` with `perl_modules/5.26.2`.


Downloaded data for two human and one mouse assembly are now available in
`$STAR_FUSION_DATA`, as version `2019-08`.  Also downloaded same data for
STAR-fusion version 1.6 which is not currently installed at Uppmax, as version
`2019-03`.



