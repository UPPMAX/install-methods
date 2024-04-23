bwa/0.7.18
==========

<https://github.com/lh3/bwa>

Used under license:
GPL v3


Structure creating script (makeroom_bwa_0.7.18.sh) moved to /sw/bioinfo/bwa/makeroom_0.7.18.sh

LOG
---

    makeroom.sh "-f" "-t" "bwa" "-v" "0.7.18" "-w" "https://github.com/lh3/bwa" "-d" "BWA is a software package for mapping DNA sequences against a large reference genome, such as the human genome. It consists of three algorithms: BWA-backtrack, BWA-SW and BWA-MEM. The first algorithm is designed for Illumina sequence reads up to 100bp, while the rest two for longer sequences ranged from 70bp to a few megabases. BWA-MEM and BWA-SW share similar features such as the support of long reads and chimeric alignment, but BWA-MEM, which is the latest, is generally recommended as it is faster and more accurate. BWA-MEM also has better performance than BWA-backtrack for 70-100bp Illumina reads." "-l" "GPL v3"
    ./makeroom_bwa_0.7.18.sh
    source /sw/bioinfo/bwa/SOURCEME_bwa_0.7.18
    cd $SRCDIR

    ml gcc/12.3.0
    ml zlib/1.3
    wget https://github.com/lh3/bwa/archive/refs/tags/v0.7.18.tar.gz

    tar xf v0.7.18.tar.gz

    cd bwa-0.7.18/

Yep. 

    make
    ml purge
    ldd bwa

No longer uses bzip2.

Perl scripts using env?

    head -n 1 *.pl

Install.

    mkdir -p $PREFIX/{bin/,share/man/man1/}
    cp -av bwa *.pl $PREFIX/bin/
    cp -av *.1 $PREFIX/share/man/man1/

