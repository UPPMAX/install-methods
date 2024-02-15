seqstats/20170404-e6f482f
========================

<https://github.com/clwgg/seqstats>

Used under license:
MIT


Structure creating script (makeroom_seqstats_20170404-e6f482f.sh) moved to /sw/bioinfo/seqstats/makeroom_20170404-e6f482f.sh

LOG
---

    makeroom.sh -f -t seqstats -v 20170404-e6f482f -w https://github.com/clwgg/seqstats -l MIT -d "Seqstats is a small tool written in C on top of the excellent klib library by Heng Li. It provides general summary statistics of both read and assembly files. It can read fastq and fasta files, either gzipped or plain." -c bioinfo -s misc
    ./makeroom_seqstats_20170404-e6f482f.sh 
    source /sw/bioinfo/seqstats/SOURCEME_seqstats_20170404-e6f482f
    cd $SRCDIR
    ml git/2.34.1
    git clone --recursive https://github.com/clwgg/seqstats
    cd seqstats/
    git reset --hard e6f482f
    ml gcc/12.3.0
    ml zlib/1.3
    make
    cp -av seqstats $PREFIX

Adjust mf file

    cd $TOOLDIR/mf
    vi 20170404-e6f482f 

Wrap up.

    cd $TOOLDIR
    ./seqstats-20170404-e6f482f_post-install.sh 
