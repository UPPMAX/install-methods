# Bandage-0.8.0-install-README.md

Bandage/0.8.0
=============

<https://rrwick.github.io/Bandage/>

LOG
---

As long as we use the CentOS 6.7 statically-linked binaries, everything should work.

    VERSION=0.8.0
    cd /sw/apps/bioinfo
    mkdir Bandage
    cd Bandage/
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir src milou
    ln -s ./milou tintin
    ln -s ./milou irma
    cd src

Create version with '.' replaced by '_'.

    FILEVERSION=${VERSION//./_}
    wget https://github.com/rrwick/Bandage/releases/download/v${VERSION}/Bandage_CentOS_static_v${FILEVERSION}.zip
    unzip Bandage_CentOS_static_v${FILEVERSION}.zip 
    ./Bandage 
    cp -a Bandage sample_LastGraph ../milou/
