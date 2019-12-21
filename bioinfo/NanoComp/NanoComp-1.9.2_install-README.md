NanoComp/1.9.2
==============

<https://github.com/wdecoster/nanocomp>

Didn't know which versions were available via pip, and no help at the git repository.  Pavlin shared a neat trick with pip.

    module load python/3.6.8
    pip install NanoComp==

This will list all the available versions.  1.9.2 is the most recent.

LOG
---

    cd /sw/bioinfo/
    mkdir NanoComp
    cd NanoComp/
    mkdir 1.9.2
    cd 1.9.2/
    mkdir rackham
    [[ "$CLUSTER" = "rackham" ]] && for CL in snowy bianca irma ; do test -L $CL || ln -s $CLUSTER $CL ; done
    PREFIX=$PWD/$CLUSTER
    PYTHONUSERBASE=$PREFIX pip install --user NanoComp==1.9.2

And, provide the `orca` executable to flatten images.

    mkdir src
    cd src
    wget https://github.com/plotly/orca/releases/download/v1.2.1/orca-1.2.1-x86_64.AppImage
    chmod +x orca-1.2.1-x86_64.AppImage
    cp -av orca-1.2.1-x86_64.AppImage $PREFIX/bin/
    cd $PREFIX/bin
    ln -s orca-1.2.1-x86_64.AppImage orca
    ./orca --help

Set up standard mf file using MultiQC/1.8 as a template.

