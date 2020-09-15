TEtranscripts/2.2.1
========================

<https://github.com/mhammell-laboratory/TEtranscripts>

Used under license:
GPL3

Structure creating script (makeroom_TEtranscripts_2.2.1.sh) moved to /sw/bioinfo/TEtranscripts/makeroom_2.2.1.sh

LOG
---

    TOOL=TEtranscripts
    VERSION=2.2.1
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/TEtranscripts/2.2.1/src
    /home/jonass/uppmax/install-methods/makeroom.sh -t "TEtranscripts" -v "2.2.1" -w "https://github.com/mhammell-laboratory/TEtranscripts" -d "TEtranscripts and TEcount takes RNA-seq \(and similar data\) and annotates reads to both genes \& transposable elements. TEtranscripts then performs differential analysis using DESeq2." -l "GPL3" -s "misc"
    ./makeroom_TEtranscripts_2.2.1.sh
    cd $SRCDIR
    wget https://github.com/mhammell-laboratory/TEtranscripts/archive/2.2.1.tar.gz
    tar xvfz 2.2.1.tar.gz
    ml bioinfo-tools python3/3.7.2 R_packages/4.0.0 pysam/0.15.3-python3.7.2
    cd TEtranscripts-2.2.1/
    ./TEtranscripts-2.2.1_post-install.sh
    ml TEtranscripts
    python setup.py install --prefix $PREFIX
