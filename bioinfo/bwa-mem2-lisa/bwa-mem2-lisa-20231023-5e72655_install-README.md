bwa-mem2-lisa/20231023-5e72655
==============================

<https://github.com/bwa-mem2/bwa-mem2/tree/bwa-mem2-lisa>

Used under license:
MIT


Structure creating script (makeroom_bwa-mem2-lisa_20231023-5e72655.sh) moved to /sw/bioinfo/bwa-mem2-lisa/makeroom_20231023-5e72655.sh

LOG
---

Errors occur if build with gcc 12+.  Here we use gcc/10.3.0.

Also load rust/1.77.0 as a dependency.

    makeroom.sh -c bioinfo -s alignment -t bwa-mem2-lisa -v 20231023-5e72655 -w https://github.com/bwa-mem2/bwa-mem2/tree/bwa-mem2-lisa -d "bwa-mem2-lisa is an accelerated version of bwa-mem2 where we accelerated the seeding phase of bwa-mem2 using: 1. LISA (Learned-Indexes for Sequence Analysis) and 2. binary interval tree. Our accelerated seeding kernels achieve up to 4.5x speedup compared to the seeding phase of bwa-mem2. Note that, bwa-mem2-lisa produces the exact same output as bwa-mem2." -l MIT
    ./makeroom_bwa-mem2-lisa_20231023-5e72655.sh 
    source /sw/bioinfo/bwa-mem2-lisa/SOURCEME_bwa-mem2-lisa_20231023-5e72655
    cd $SRCDIR
    ml gcc/10.3.0
    ml git
    git clone --recursive https://github.com/bwa-mem2/bwa-mem2 -b bwa-mem2-lisa bwa-mem2-lisa
    cd bwa-mem2-lisa/
    make -j20

Loads rust/1.77.0

    mkdir $PREFIX/bin
    cp -av bwa-mem2* $PREFIX/bin/

