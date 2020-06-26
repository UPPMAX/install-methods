spaln/2.4.0
========================

<http://www.genome.ist.i.kyoto-u.ac.jp/~aln_user/spaln>

Used under license:
GPL v2

Structure creating script (makeroom_spaln_2.4.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/spaln/makeroom_2.4.0.sh

LOG
---

    TOOL=spaln
    VERSION=2.4.0
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f" -s "alignment" -t "spaln" -v "2.4.0" -w "http://www.genome.ist.i.kyoto-u.ac.jp/~aln_user/spaln" -l "GPL v2" -d "stand-alone program that maps and aligns a set of cDNA or protein sequences onto a whole genomic sequence in a single job"
    ./makeroom_spaln_2.4.0.sh

    source SOURCEME_spaln_2.4.0 
    cd $VERSION
    cd src/
    wget http://www.genome.ist.i.kyoto-u.ac.jp/~aln_user/archive/spaln${VERSION}.tar.gz
    tar xzf spaln${VERSION}.tar.gz 
    cd spaln${VERSION}/
    cd src/
    module load gcc/5.4.0
    CXX=g++ ./configure --use_zlib=1 --exec_prefix=$PREFIX/bin --table_dir=$PREFIX/table --alndbs_dir=$PREFIX/seqdb
    make
    make install
    mkdir -p $PREFIX/doc/man/man1
    cd ..
    cp *.1 $PREFIX/doc/man/man1
    cp doc/* $PREFIX/doc/
