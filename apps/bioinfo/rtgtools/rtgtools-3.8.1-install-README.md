rtgtools/3.8.1
==============

<https://github.com/RealTimeGenomics/rtg-tools>

LOG
---

A precompiled bundle is downloaded, so we use that for all systems.

    VERSION=3.8.1
    cd /sw/apps/bioinfo/rtgtools/
    VERSION=3.8.1
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget https://github.com/RealTimeGenomics/rtg-tools/releases/download/${VERSION}/rtg-tools-${VERSION}-linux-x64.zip
    unzip rtg-tools-$(VERSION}-linux-x64.zip 
    mv rtg-tools-3.8.1 ../milou
    ln -s ./milou rackham
    ln -s ./milou irma
    ln -s ./milou bianca

