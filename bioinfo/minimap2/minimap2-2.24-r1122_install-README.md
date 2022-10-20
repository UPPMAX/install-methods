minimap2/2.24-r1122
===================

<https://github.com/lh3/minimap2>

Used under license:
MIT


Structure creating script (makeroom_minimap2_2.24-r1122.sh) moved to /sw/bioinfo/minimap2/makeroom_2.24-r1122.sh

LOG
---

    makeroom.sh "-f" "-c" "bioinfo" "-t" "minimap2" "-v" "2.24-r1122" "-w" "https://github.com/lh3/minimap2" "-d" "versatile pairwise aligner for genomic and spliced nucleotide sequences" "-l" "MIT"
    ./makeroom_minimap2_2.24-r1122.sh

Use precompiled minimap2 and included k8.

    source SOURCEME_minimap2_2.24-r1122 && cd $SRCDIR

    curl -L https://github.com/lh3/minimap2/releases/download/v2.24/minimap2-2.24_x64-linux.tar.bz2 | tar -jxvf -
    ./minimap2-2.24_x64-linux/minimap2
    cd minimap2-2.24_x64-linux/
    mkdir -p $PREFIX/bin $PREFIX/share/man/man1
    cp -av k8 minimap2 paftools.js $PREFIX/bin/
    cp -av minimap2.1 $PREFIX/share/man/man1

Get test data.

    cd ..
    wget https://github.com/lh3/minimap2/releases/download/v2.24/minimap2-2.24.tar.bz2
    tar xf minimap2-2.24.tar.bz2 

    cd minimap2-2.24
    cd test
    $PREFIX/bin/minimap2 MT-human.fa MT-orang.fa > test.sam
    less test.sam
    $PREFIX/bin/minimap2  -x map-ont -d MT-human-ont.mmi MT-human.fa
    $PREFIX/bin/minimap2 -a MT-human-ont.mmi MT-orang.fa > test.sam
    less test.sam

Don't load k8/0.2.5, since a k8 executable is included in the precompiled download.
.
