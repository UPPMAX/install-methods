metaeuk/6-a5d39d9
=================

<https://github.com/soedinglab/metaeuk>

Used under license:
GPL v3


Structure creating script (makeroom_metaeuk_6-a5d39d9.sh) moved to /sw/bioinfo/metaeuk/makeroom_6-a5d39d9.sh

LOG
---

    makeroom.sh -f -t "metaeuk" -v "6-a5d39d9" -w "https://github.com/soedinglab/metaeuk" -l "GPL v3" -d "MetaEuk is a modular toolkit designed for large-scale gene discovery and annotation in eukaryotic metagenomic contigs." -s "annotation"
    ./makeroom_metaeuk_6-a5d39d9.sh 

    source /sw/bioinfo/metaeuk/SOURCEME_metaeuk_6-a5d39d9
    cd $SRCDIR

For rackham, bianca, miarka, the bundle supporting AVX2:

    wget https://github.com/soedinglab/metaeuk/releases/download/6-a5d39d9/metaeuk-linux-avx2.tar.gz
    tar xvf metaeuk-linux-avx2.tar.gz --strip 1 -C $PREFIX/

For snowy, the bundle supporting SSE 4.1:

    rm -f $VERSIONDIR/snowy
    mkdir $VERSIONDIR/snowy
    wget https://github.com/soedinglab/metaeuk/releases/download/6-a5d39d9/metaeuk-linux-sse41.tar.gz
    tar xvf metaeuk-linux-sse41.tar.gz --strip 1 -C $VERSIONDIR/snowy/

Note that the version hash reported by metaeuk does not match the hash prefix included in the version tag for this release. I have submitted an issue report.

    metaeuk Version: fba1b3d5a6009a46968734adca0ff15ac98bb732

