bwa-mem2/2.2.1-20211213-edc703f
===============================

<https://github.com/bwa-mem2/bwa-mem2>

Used under license:
MIT
<https://github.com/bwa-mem2/bwa-mem2/blob/master/LICENSE>

Structure creating script (makeroom_bwa-mem2_2.2.1-20211213-edc703f.sh) moved to /sw/bioinfo/bwa-mem2/makeroom_2.2.1-20211213-edc703f.sh

LOG
---

    makeroom.sh -t bwa-mem2 -v 2.2.1-20211213-edc703f -w https://github.com/bwa-mem2/bwa-mem2 -d "Bwa-mem2 is the next version of the bwa-mem algorithm in bwa. It produces alignment identical to bwa and is ~1.3-3.1x faster depending on the use-case, dataset and the running machine." -l MIT -L https://github.com/bwa-mem2/bwa-mem2/blob/master/LICENSE -c bioinfo -s alignment
    ./makeroom_bwa-mem2_2.2.1-20211213-edc703f.sh 
    source /sw/bioinfo/bwa-mem2/SOURCEME_bwa-mem2_2.2.1-20211213-edc703f && cd $SRCDIR
    ml git
    git clone --recursive https://github.com/bwa-mem2/bwa-mem2
    cd bwa-mem2/
    git submodule sync --recursive
    git reset --hard edc703f

    ml zlib/1.2.11
    ml intel/20.4
    make CXX=icpc multi -j 10

The `multi` builts multi-architecture executables.

    mkdir -p $PREFIX/bin
    cp -av bwa-mem2* $PREFIX/bin
    cd $PREFIX/bin

Make sure it recognises instruction subsets on various clusters: rackham, snowy, miarka. It does.

