pplacer/1.1.alpha19
===================

<https://github.com/matsen/pplacer>

LOG
---

    TOOL=/sw/apps/bioinfo/pplacer
    mkdir -p $TOOL
    cd $TOOL
    VERSION=1.1.alpha19
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget https://github.com/matsen/pplacer/releases/download/v${VERSION}/pplacer-linux-v${VERSION}.zip
    unzip pplacer-linux-v1.1.alpha19.zip 
    mv pplacer-Linux-v1.1.alpha19 ../milou
    cd ..
    for C in rackham irma bianca ; do ln -s milou $C; done

Note the existence of the complementary scripts in the mf file.  Don't load
python or biopython, just let users know they should to use the scripts.

