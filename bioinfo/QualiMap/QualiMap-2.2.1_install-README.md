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

Modify mf file so it loads with older java and older R, to use the libraries it already has installed.

load("R/3.3.2")
load("java/sun_jdk1.7.0_25")

They must be loaded in this way, since the java version overrides the java 8 version loaded with R.

prepend_path("PATH","/sw/bioinfo/QualiMap/2.2.1/rackham")
prepend_path("R_LIBS_SITE","/sw/bioinfo/QualiMap/2.2.1/rackham")
