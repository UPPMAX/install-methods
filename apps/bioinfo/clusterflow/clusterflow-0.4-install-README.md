clusterflow 0.4
===============

Bioinformatics pipeline tool

<http://clusterflow.io/>

Phill Ewels added some Uppmax-specific stuff for 0.4devel that are in the
repository <https://github.com/ewels/clusterflow-uppmax> so we also include
that here for 0.4.

LOG
---

    cd /sw/apps/bioinfo/clusterflow/
    VERSION=0.4
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget https://github.com/ewels/clusterflow/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    mv clusterflow-${VERSION} ../$CLUSTER
    cd ../$CLUSTER
    git clone https://github.com/ewels/clusterflow-uppmax
    ln -s clusterflow-uppmax/cfinstaller/clusterflow.config.uppmax clusterflow.config

The existing mf for 0.4devel already adds clusterflow-uppmax to PATH.  Remove
the addition of scripts/ to PATH since that directory is yet to be used.

Also, make sure .version reflects that the latest version is 0.4.

