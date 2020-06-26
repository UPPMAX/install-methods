plumed/2.6.0
========================

<https://www.plumed.org/>

Used under license:


Structure creating script (makeroom_plumed_2.6.0.sh) moved to /sw/libs/plumed/makeroom_2.6.0.sh

LOG
---

    TOOL=plumed
    VERSION=2.6.0
    CLUSTER=rackham
    TOOLDIR=/sw/libs/$TOOL
    VERSIONDIR=/sw/libs/$TOOL/$VERSION
    PREFIX=/sw/libs/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/libs/plumed/2.6.0/src
    /home/pmitev/GIT/install-methods/makeroom.sh -t "plumed" -v "2.6.0" -c "libs" -w "https://www.plumed.org/"
    ./makeroom_plumed_2.6.0.sh

    cd /sw/libs/plumed/2.6.0/src

    module load  intelmpi/18.3
    module load  python/3.7.2

    ./configure --prefix=/sw/libs/plumed/2.6.0/rackham

    make -j 8
    make install

