Salmon/0.11.2
========================

<https://combine-lab.github.io/salmon/>

Used under license:
GPL v3

Structure creating script (makeroom_Salmon_0.11.2.sh) moved to /sw/bioinfo/Salmon/makeroom_0.11.2.sh

LOG
---

    TOOL=Salmon
    VERSION=0.11.2
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/Salmon/0.11.2/src
    /home/douglas/bin/makeroom.sh -f" -s "misc" -t "Salmon" -v "0.11.2" -w "https://combine-lab.github.io/salmon/" -l "GPL v3" -d "https://combine-lab.github.io/salmon/"
    ./makeroom_Salmon_0.11.2.sh
Salmon/1.1.0
============

Quantifying abundances of transcripts from RNA-Seq data.

<http://salmon.readthedocs.org/en/latest/>

LOG
---

Install the precompiled x86_64 binaries on rackham and link the others to these.
See the 0.6.0 install README for more.

    TOOLDIR=/sw/bioinfo/Salmon
    VERSION=1.1.0
    CLUST=rackham
    CLUSTERDIR=$TOOLDIR/$VERSION/$CLUST
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    mkdir -p $VERSION mf
    cd $VERSION
    for CL in snowy bianca irma ; do test -L $CL || ln -s $CLUST $CL; done
    mkdir -p src
    cd src
    [[ -f Salmon-${VERSION}_linux_x86_64.tar.gz ]] || wget https://github.com/COMBINE-lab/salmon/releases/download/v${VERSION}/Salmon-${VERSION}_linux_x86_64.tar.gz
    [[ -d Salmon-latest_linux_x86_64 ]] && rm -rf Salmon-latest_linux_x86_64
    tar xvzf Salmon-${VERSION}_linux_x86_64.tar.gz 
    mv salmon-latest_linux_x86_64 $CLUSTERDIR

