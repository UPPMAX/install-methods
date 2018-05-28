texlive/2018
============

LOG
---

    VERSION=2018
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps
    mkdir texlive
    cd texlive
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
    tar xzf install-tl-unx.tar.gz 
    cd install-tl-20180517/
    echo "choose 'D' to change install directory, cut and paste this:  $PFX"
    ./install-tl 
