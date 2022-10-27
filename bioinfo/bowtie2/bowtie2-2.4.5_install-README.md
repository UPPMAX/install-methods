bowtie2/2.4.5
========================

<http://>

Used under license:



Structure creating script (makeroom_bowtie2_2.4.5.sh) moved to /sw/bioinfo/bowtie2/makeroom_2.4.5.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "bowtie2" "-v" "2.4.5" "-f"
    ./makeroom_bowtie2_2.4.5.sh


    TOOL=/sw/bioinfo/bowtie2
    VERSION=2.4.5
    cd $SRCDIR

# Download and extract
    wget https://github.com/BenLangmead/bowtie2/releases/download/v2.4.5/bowtie2-2.4.5-linux-x86_64.zip
    unzip bowtie2-2.4.5-linux-x86_64.zip
    mv bowtie2-${VERSION}-linux-x86_64 $PREFIX/bin



bowtie2/2.3.5.1
===============

Switch from compiling source to using precompiled statically-linked binaries.

LOG
---

    VERSION=2.3.5.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    OTHER_CLUSTERS="irma bianca snowy"
    TOOL=/sw/bioinfo/bowtie2
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    for CL in $OTHER_CLUSTERS; do
        ln -s $CLUSTER $CL;
    done
    PFX=$PWD/$CLUSTER
    cd src
    [[ -f bowtie2-${VERSION}-linux-x86_64.zip ]] || wget https://downloads.sourceforge.net/project/bowtie-bio/bowtie2/${VERSION}/bowtie2-${VERSION}-linux-x86_64.zip
    unzip bowtie2-${VERSION}-linux-x86_64.zip
    mv bowtie2-${VERSION}-linux-x86_64 $PFX/bin
    fixup $TOOL/$VERSION
