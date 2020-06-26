RStudio/1.2.5042
========================

<https://rstudio.com>

Used under license:


Structure creating script (makeroom_RStudio_1.2.5042.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/RStudio/makeroom_1.2.5042.sh

LOG
---

    TOOL=RStudio
    VERSION=1.2.5042
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    /home/douglas/bin/makeroom.sh -f" -t "RStudio" -v "1.2.5042" -c "apps" -w "https://rstudio.com" -d "Integrated development environment for the R language"
    ./makeroom_RStudio_1.2.5042.sh
RStudio/1.1.463
===============

The precompiled version of RStudio, suitable for all CentOS 7 clusters.

LOG
---

    VERSION=1.1.463
    cd /sw/apps/RStudio
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir src
    cd src
    [[ -f rstudio-${VERSION}-x86_64-fedora.tar.gz ]] || wget https://download1.rstudio.org/rstudio-${VERSION}-x86_64-fedora.tar.gz
    tar xzf rstudio-${VERSION}-x86_64-fedora.tar.gz 
    mv rstudio-${VERSION} ../rackham
    cd ..
    for C in bianca irma snowy ; do ln -s rackham $C; done

The mf for 1.0.153 suffices.

