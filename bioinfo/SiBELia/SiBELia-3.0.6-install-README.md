SiBELia-3.0.6-install-README.md
===============================


<https://sourceforge.net/projects/sibelia-bio/files/>

i<http://bioinf.spbau.ru/sibelia>

LOG
---

    cd /sw/apps/bioinfo
    mkdir SiBELia
    cd SiBELia/
    VERSION=3.0.6
    mkdir $VERSION
    cd $VERSION
    CLUSTER=¢{CLUSTER?:CLUSTER must be set}
    mkdir $CLUSTER/ src
    cd src
    wget https://downloads.sourceforge.net/project/sibelia-bio/${VERSION}/Sibelia-${VERSION}-Linux.tar.gz
    tar xvzf Sibelia-3.0.6-Linux.tar.gz 
    cd Sibelia-3.0.6-Linux/
    cp -av * ../../$CLUSTER/
    cd ../../$CLUSTER/bin/

Find python with the path using `#!/usr/bin/env python`.

    vi *.py
