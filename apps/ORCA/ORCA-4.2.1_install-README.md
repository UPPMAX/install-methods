ORCA/4.2.1
========================

<https://orcaforum.kofo.mpg.de/>

Used under license:

<>

Structure creating script (makeroom_ORCA_4.2.1.sh) moved to /sw/apps/ORCA/makeroom_4.2.1.sh

LOG
---

    TOOL=ORCA
    VERSION=4.2.1
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/ORCA/4.2.1/src
    /home/pmitev/GIT/install-methods/makeroom.sh -t "ORCA" -v "4.2.1" -c "apps"
    ./makeroom_ORCA_4.2.1.sh
    cd $SRCDIR
    tar xvf orca_4_2_1_linux_x86-64_openmpi314.tar.xz
