bowtie2/2.3.3.1
===============

Switch from compiling source to using precompiled statically-linked binaries.

LOG
---

    VERSION=2.3.4.1
    CC=rackham
    OTHER_CLUSTERS="irma bianca"
    TOOL=/sw/apps/bioinfo/bowtie2
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CC src
    for C in $OTHER_CLUSTERS; do
        ln -s $CC $C;
    done
    cd $CC
    PFX=$PWD
    cd ../src
    [[ -f bowtie2-${VERSION}-linux-x86_64.zip ]] || wget https://downloads.sourceforge.net/project/bowtie-bio/bowtie2/${VERSION}/bowtie2-${VERSION}-linux-x86_64.zip
    unzip bowtie2-${VERSION}-linux-x86_64.zip
    mv bowtie2-${VERSION}-linux-x86_64 $PFX/bin
    chmod g+rws -R $TOOL/$VERSION
