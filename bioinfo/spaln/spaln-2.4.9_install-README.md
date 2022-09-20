spaln/2.4.9
========================

<https://github.com/ogotoh/spaln>

Used under license:
GPL v2


Structure creating script (makeroom_spaln_2.4.9.sh) moved to /sw/bioinfo/spaln/makeroom_2.4.9.sh

LOG
---

    makeroom.sh "-f" "-t" "spaln" "-v" "2.4.9" "-w" "https://github.com/ogotoh/spaln" "-l" "GPL v2" "-d" "stand-alone program that maps and aligns a set of cDNA or protein sequences onto a whole genomic sequence in a single job"

    ./makeroom_spaln_2.4.9.sh
    source /sw/bioinfo/spaln/SOURCEME_spaln_2.4.9 && cd $SRCDIR

    wget https://github.com/ogotoh/spaln/archive/refs/tags/ver.2.4.9.tar.gz
    tar xf ver.2.4.9.tar.gz
    module load gcc/10.3.0
    module load zlib/1.2.11
    cd spaln-ver.2.4.9/
    cd src/
    CXX=g++ ./configure --use_zlib=1 --exec_prefix=$PREFIX/bin --table_dir=$PREFIX/table --alndbs_dir=$PREFIX/seqdb
    make
    make install
    mkdir -p $PREFIX/doc/man/man1
    cd ..
    cp *.1 $PREFIX/doc/man/man1
    cp doc/* $PREFIX/doc/
