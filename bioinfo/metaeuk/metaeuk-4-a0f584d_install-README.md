metaeuk/4-a0f584d
========================

<https://github.com/soedinglab/metaeuk>

Used under license:
GNU3
<>

Structure creating script (makeroom_metaeuk_4-a0f584d.sh) moved to /sw/bioinfo/metaeuk/makeroom_4-a0f584d.sh

LOG
---

    TOOL=metaeuk
    VERSION=4-a0f584d
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/metaeuk/4-a0f584d/src
    /home/bjornv/git/install-methods/makeroom.sh -t "metaeuk" -v "4-a0f584d" -w "https://github.com/soedinglab/metaeuk" -l "GNU3" -d "MetaEuk is a modular toolkit designed for large-scale gene discovery and annotation in eukaryotic metagenomic contigs." -s "annotation"
    ./makeroom_metaeuk_4-a0f584d.sh


For Rackham
    cd $SRCDIR
    wget https://github.com/soedinglab/metaeuk/releases/download/5-34c21f2/metaeuk-linux-avx2.tar.gz
    tar xfvz metaeuk-linux-avx2.tar.gz --strip 1 -C $PREFIX

For Snowy, Irma and Bianca
    cd $SRCDIR
    wget https://github.com/soedinglab/metaeuk/releases/download/5-34c21f2/metaeuk-linux-sse41.tar.gz
    tar xfvz metaeuk-linux-sse41.tar.gz --strip 1 -C $TOOLDIR/4-a0f584d/snowy/


