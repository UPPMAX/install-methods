GraphAligner/1.0.17b
====================

<https://github.com/maickrau/GraphAligner>

Used under license:
MIT

Structure creating script (makeroom_GraphAligner_1.0.17b.sh) moved to /sw/bioinfo/GraphAligner/makeroom_1.0.17b.sh

It wants to build static, so I had to add a def of `LIBRARY_PATH` to jemalloc/5.0.1 and why not, jemalloc/3.6.0.

LOG
---

    makeroom.sh -c bioinfo -s alignment -t GraphAligner -v 1.0.17b -w https://github.com/maickrau/GraphAligner -l "MIT" -d "Seed-and-extend program for aligning long error-prone reads to genome graphs" -k "genome-graph PacBio Oxford-Nanopore long-read"
    ./makeroom_GraphAligner_1.0.17b.sh 
    source /sw/bioinfo/GraphAligner/SOURCEME_GraphAligner_1.0.17b && cd $SRCDIR

    ml gcc/10.3.0 xz/5.2.6 zlib/1.2.12 bzip2/1.0.8
    ml boost/1.81.0-gcc10.3.0
    ml jemalloc/5.0.1
    ml openblas/0.3.21
    ml protobuf/21.12-gcc10.3.0
    ml python/3.10.8
    ml sparsehash/2.0.4
    ml Tcl-Tk/8.6.11
    ml zstd/1.5.2
    ml readline/6.2-11
    ml libicu/5.2-4
    ml sqlite/3.34.0
    ml SDSL/2.1.1

    git clone --recursive https://github.com/maickrau/GraphAligner

    cd GraphAligner/
    make bin/GraphAligner

    mkdir $PREFIX/bin
    cp -av bin/GraphAligner  $PREFIX/bin

