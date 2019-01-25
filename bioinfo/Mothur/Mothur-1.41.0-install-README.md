Mothur/1.41.0
=============

<http://www.mothur.org/>

Installing the precompiled Linux 64-bit binaries.

    VERSION=1.41.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    TOOL=/sw/apps/bioinfo/Mothur
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION

    # Do not create $CLUSTER directory, we will instead create this from zipball.

    [[ "$CLUSTER" == "rackham" ]] && for CL in bianca irma snowy ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget https://github.com/mothur/mothur/releases/download/v${VERSION}.pre-release/Mothur.linux_64.zip
    unzip Mothur.linux_64.zip 

    # get rid of unfortunate Mac traces in the zipball

    rm -rf __MACOSX
    find . -name .DS_Store -exec rm -f {} \;
    mv mothur ../$CLUSTER


The mf file from 1.40.5 should be fine.
