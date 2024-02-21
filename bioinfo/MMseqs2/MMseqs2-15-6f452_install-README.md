MMseqs2/15-6f452
================

<https://github.com/soedinglab/mmseqs2>

Used under license:
GPL v3


Structure creating script (makeroom_MMseqs2_15-6f452.sh) moved to /sw/bioinfo/MMseqs2/makeroom_15-6f452.sh

LOG
---

    makeroom.sh -f -t MMseqs2 -v 15-6f452 -d "ultra fast and sensitive sequence search and clustering suite" -w https://github.com/soedinglab/mmseqs2 -l "GPL v3" -c bioinfo -s alignment
    ./makeroom_MMseqs2_15-6f452.sh 
    source /sw/bioinfo/MMseqs2/SOURCEME_MMseqs2_15-6f452 && cd $SRCDIR

There are precompiled static builds for chips with SSE 4.1, and chips with the later AVX2.  For us, snowy is the former, all other clusters are the latter.  This can be checked with:

    cat /proc/cpuinfo | grep -i --color avx2
    cat /proc/cpuinfo | grep -i --color sse4_1

Download the precompileds and install.

    wget https://github.com/soedinglab/MMseqs2/releases/download/15-6f452/mmseqs-linux-avx2.tar.gz
    wget https://github.com/soedinglab/MMseqs2/releases/download/15-6f452/mmseqs-linux-sse41.tar.gz

    rm -f $VERSIONDIR/snowy
    tar xf mmseqs-linux-sse41.tar.gz 
    mv mmseqs $VERSIONDIR/snowy

    tar xf mmseqs-linux-avx2.tar.gz 
    rmdir $PREFIX
    mv mmseqs $PREFIX

There's a bin/ within each, and also a userguide.pdf.
