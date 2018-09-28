QualiMap/2.2.1
===============

LOG
---

    VERSION=2.2.1
    CC=rackham
    OTHER_CLUSTERS="irma bianca"
    TOOL=/sw/apps/bioinfo/QualiMap
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p $CC src
    for C in $OTHER_CLUSTERS; do
        ln -s $CC $C
    done
    cd src
    [[ -f qualimap_v${VERSION}.zip ]] || wget https://bitbucket.org/kokonech/qualimap/downloads/qualimap_v${VERSION}.zip
    unzip qualimap_v${VERSION}.zip
    cp -rf qualimap_v${VERSION}/* ../$CC/
    chmod g+rws -R $TOOL/$VERSION
