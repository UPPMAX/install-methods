Salmon
======

Quantifying abundances of transcripts from RNA-Seq data.

<http://salmon.readthedocs.org/en/latest/>

LOG
---

Install the precompiled x86_64 binaries on milou and link the others to these.
See the 0.6.0 install README for more.

    TOOLDIR=/sw/apps/bioinfo/Salmon
    VERSION=0.8.2
    CLUSTER=milou
    CLUSTERDIR=$TOOLDIR/$VERSION/$CLUSTER
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    mkdir -p $VERSION mf
    cd $VERSION
    mkdir -p $CLUSTER src
    cd src
    wget https://github.com/COMBINE-lab/salmon/releases/download/v${VERSION}/Salmon-${VERSION}_linux_x86_64.tar.gz
    tar xvzf Salmon-0.8.2_linux_x86_64.tar.gz 
    cd Salmon-0.8.2_linux_x86_64
    mv * ../../$CLUSTER/
    cd ../../
    ln -s ./$CLUSTER rackham
    ln -s ./$CLUSTER irma
    ln -s ./$CLUSTER bianca

The RPATH encoded looks at relative path `../lib/` for the libraries, so these must be in place next to the `bin/` directory.

Use mf from 0.6.0.
