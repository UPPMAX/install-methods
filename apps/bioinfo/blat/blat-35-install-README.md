blat/35
=======

Download source from https://users.soe.ucsc.edu/~kent/src/ and unzip.

Edit `src/inc/common.mk`:

    BINDIR = /sw/apps/bioinfo/blat/35/${CLUSTER}

Then:

    export MACHTYPE=x86_64
    make

