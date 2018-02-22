RStudio/1.0.143 precompiled
===========================

The precompiled version of RStudio, suitable for the CentOS 7 clusters rackham, bianca, irma.

LOG
---

    VERSION=1.0.143
    cd /sw/apps/RStudio
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir src
    cd src
    wget https://download1.rstudio.org/rstudio-${VERSION}-x86_64-fedora.tar.gz
    tar xzf rstudio-${VERSION}-x86_64-fedora.tar.gz 
    mv rstudio-${VERSION} ../rackham
    cd ..
    ln -s ./rackham bianca
    ln -s ./rackham irma

The mf for 1.0.136_rackham suffices.

