metaeuk/4-a0f584d
=================

<https://github.com/soedinglab/metaeuk>

Used under license:
GPL v3

Structure creating script (makeroom_metaeuk_4-a0f584d.sh) moved to /sw/bioinfo/metaeuk/makeroom_4-a0f584d.sh

LOG
---

    makeroom.sh -t "metaeuk" -v "4-a0f584d" -w "https://github.com/soedinglab/metaeuk" -l "GPL v3" -d "MetaEuk is a modular toolkit designed for large-scale gene discovery and annotation in eukaryotic metagenomic contigs." -s "annotation"
    ./makeroom_metaeuk_4-a0f584d.sh

    source /sw/bioinfo/metaeuk/SOURCEME_metaeuk_4-a0f584d

Create separate snowy prefix.

    rm -f $VERSIONDIR/snowy
    mkdir $VERSIONDIR/snowy

For rackham, bianca, miarka:

    cd $SRCDIR
    wget https://github.com/soedinglab/metaeuk/releases/download/4-a0f584d/metaeuk-linux-avx2.tar.gz
    tar xfvz metaeuk-linux-avx2.tar.gz --strip 1 -C $PREFIX

For snowy:

    cd $SRCDIR
    wget https://github.com/soedinglab/metaeuk/releases/download/4-a0f584d/metaeuk-linux-sse41.tar.gz
    tar xfvz metaeuk-linux-sse41.tar.gz --strip 1 -C $TOOLDIR/4-a0f584d/snowy/


