texlive/2019
============

LOG
---

    VERSION=2019
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps
    mkdir texlive
    cd texlive
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
    tar xzf install-tl-unx.tar.gz 
    cd install-tl-20190510/
    echo "choose 'D' to change install directory, cut and paste this:  $PFX"

Was having checksum problems accessing the UmU repository, so forced using UIUC's repository:

    ./install-tl --repository http://ctan.math.illinois.edu/systems/texlive/tlnet
