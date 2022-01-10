ORCA/5.0.2
========================

<https://orcaforum.kofo.mpg.de/>

Used under license:



Structure creating script (makeroom_ORCA_5.0.2.sh) moved to /sw/apps/ORCA/makeroom_5.0.2.sh

LOG
---

    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -f" -t "ORCA" -v "5.0.2" -c "apps" -w "https://orcaforum.kofo.mpg.de/" -d "ORCA is a quantum-chemical software package consisting of methods in the fields of density functional theory as well as correlated wave-function based methods."
    ./makeroom_ORCA_5.0.2.sh
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
