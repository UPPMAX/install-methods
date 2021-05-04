minimap2/2.18-r1015
===================

<https://github.com/lh3/minimap2>

Used under license:
MIT

Structure creating script (makeroom_minimap2_2.18-r1015.sh) moved to /sw/bioinfo/minimap2/makeroom_2.18-r1015.sh

LOG
---


    TOOL=/sw/bioinfo/minimap2
    VERSION=2.18-r1015
    cd /sw/bioinfo
    makeroom.sh -f -c bioinfo -s assembly -t $TOOL -v $VERSION -w https://github.com/lh3/minimap2 -d "versatile pairwise aligner for genomic and spliced nucleotide sequences" -l MIT
    ./makeroom_minimap2_2.18-r1015.sh 
    source SOURCEME_minimap2_2.18-r1015 
    cd $SRCDIR
    wget https://github.com/lh3/minimap2/releases/download/v2.18/minimap2-2.18.tar.bz2
    tar xf minimap2-2.18.tar.bz2 
    module load gcc/9.3.0
    module load zlib/1.2.11
    module load python/3.8.7
    make
    make sdust
    mkdir -p $PREFIX/bin
    cp -av minimap2 sdust $PREFIX/bin/
    mkdir -p $PREFIX/man/man1
    cp -av minimap2.1 $PREFIX/man/man1/

    pip install --ignore-installed --prefix=$PREFIX .

Avoid loading python in the module file since #! line of minimap2.py refers to 3.8.7 directly.

Do load k8/0.2.5.
