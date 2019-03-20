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

