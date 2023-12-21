SNAP-aligner/2.0.3
========================

<https://github.com/amplab/snap>

Used under license:
Apache 2.0
<https://raw.githubusercontent.com/amplab/snap/master/COPYING>

Structure creating script (makeroom_SNAP-aligner_2.0.3.sh) moved to /sw/bioinfo/SNAP-aligner/makeroom_2.0.3.sh

LOG
---

    makeroom.sh -c bioinfo -s alignment -t SNAP-aligner -v 2.0.3 -l "Apache 2.0" -w https://github.com/amplab/snap -L https://raw.githubusercontent.com/amplab/snap/master/COPYING -d "SNAP is a fast and accurate aligner for short DNA reads. It is optimized for modern read lengths of 100 bases or higher, and takes advantage of these reads to align data quickly through a hash-based indexing scheme. It also includes support for sorting, marking duplicates and indexing its results, eliminating the need for several pipeline stages used by other aligners."
    ./makeroom_SNAP-aligner_2.0.3.sh 
    source /sw/bioinfo/SNAP-aligner/SOURCEME_SNAP-aligner_2.0.3 && cd $SRCDIR
    wget https://github.com/amplab/snap/releases/download/v2.0.3/snap-aligner
    wget https://github.com/amplab/snap/releases/download/v2.0.3/SNAPCommand
    file *
    chmod +x *
    cp -av * $PREFIX/
    cd $PREFIX
    ./snap-aligner 
    ./SNAPCommand 
    cd $TOOLDIR/mf
    vi 2.0.3 

    cd $TOOLDIR

    ./SNAP-aligner-2.0.3_post-install.sh 
