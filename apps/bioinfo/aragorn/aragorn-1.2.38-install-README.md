aragorn/1.2.38
==============

<http://mbio-serv2.mbioekol.lu.se/ARAGORN/Downloads/>

LOG
---

    VERSION=1.2.38
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/aragorn
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && { ln -s $CLUSTER irma ; ln -s $CLUSTER bianca ; }
    cd $CLUSTER
    PFX=$PWD
    mkdir -p bin man/man1
    cd ..
    mkdir src
    cd src/
    [[ -f aragorn${VERSION}.tgz ]] || wget http://mbio-serv2.mbioekol.lu.se/ARAGORN/Downloads/aragorn${VERSION}.tgz
    tar xzvf aragorn${VERSION}.tgz
    cd aragorn${VERSION}
    cp -av aragorn.1 ${PFX}/man/man1/
    module load gcc/6.3.0
    gcc -O3 -ffast-math -finline-functions -o aragorn aragorn${VERSION}.c
    mv aragorn ${PFX}bin/
    cd ..
    rm -rf aragorn${VERSION}
