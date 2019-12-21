git/2.24.0
==========

<https://git-scm.com/>

<https://github.com/git/git>

Used under license:
LGPL 2.1

Structure creating script (makeroom_git_2.24.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/comp/git/makeroom_2.24.0.sh

<https://git-scm.com>


LOG
---

    TOOL=git
    VERSION=2.24.0

makeroom.sh -t $TOOL -v $VERSION -w https://git-scm.com/ -c comp -l "LGPL 2.1" -d "Source control management" -f
./makeroom_git_2.24.0.sh 
cd git/2.24.0/

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

 1032  ll
 1033  cd src/
 1034  ll
 1035  cat ../../git-2.21.0_install-README.md 
 1036  cd ../..
 1037  ll
 1038  cat git-2.21.0_install-README.md >> git-2.24.0_install-README.md
 1039  vi git-2.24.0_install-README.md
 1040  history | tail -n 100 >> git-2.24.0_install-README.md
