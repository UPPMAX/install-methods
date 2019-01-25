Salmon/0.9.1
============

Quantifying abundances of transcripts from RNA-Seq data.

<http://salmon.readthedocs.org/en/latest/>

LOG
---

Install the precompiled x86_64 binaries on milou and link the others to these.
See the 0.6.0 install README for more.

    TOOLDIR=/sw/apps/bioinfo/Salmon
    VERSION=0.9.1
    CC=rackham
    CLUSTERDIR=$TOOLDIR/$VERSION/$CC
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    mkdir -p $VERSION mf
    cd $VERSION
    for C in milou bianca irma ; do ln -s $CC $C; done
    mkdir -p src
    cd src
    [[ -f Salmon-${VERSION}_linux_x86_64.tar.gz ]] || wget https://github.com/COMBINE-lab/salmon/releases/download/v${VERSION}/Salmon-${VERSION}_linux_x86_64.tar.gz
    [[ -d Salmon-latest_linux_x86_64 ]] && rm -rf Salmon-latest_linux_x86_64
    tar xvzf Salmon-${VERSION}_linux_x86_64.tar.gz 
    mv Salmon-latest_linux_x86_64 $CLUSTERDIR

