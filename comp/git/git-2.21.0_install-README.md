git/2.21.0
==========

<https://git-scm.com>

<https://github.com/git/git>

Used under license:


Structure creating script (makeroom_git_2.21.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/comp/git/makeroom_2.21.0.sh


LOG
---

    TOOL=/sw/comp/git
    VERSION=2.21.0
    VERSIONDIR=$TOOL/$VERSION
    mkdir -p $VERSIONDIR
    cd $VERSIONDIR
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma snowy bianca ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    mkdir -p src
    cd src
    [[ -d git-${VERSION} ]] && rm -rf git-${VERSION}
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/git/git/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    cd git-${VERSION}/
    make configure
    ./configure --prefix=$PFX
    make all
    make install
    cd ..
    rm -rf git-${VERSION}

'make doc' will not work, we are missing asciidoc and perhaps other tools.  It
does not matter, there are lots and lots of git resources available online, and
there is very good in-tool help as well.

Use mf file from 2.5.0.
