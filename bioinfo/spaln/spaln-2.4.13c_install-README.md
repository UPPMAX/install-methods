spaln/2.4.13c
=============

<https://github.com/ogotoh/spaln>

Used under license:
GPL v2


Structure creating script (makeroom_spaln_2.4.13c.sh) moved to /sw/bioinfo/spaln/makeroom_2.4.13c.sh

Note that using zlib/1.2.12 results in compilation errors, so I stuck with zlib/1.2.11:

    g++ -O3 -Wall -DM_THREAD=1 -DUSE_ZLIB=1 -c spaln.cc
    In file included from spaln.cc:29:
    blksrc.h: In member function 'void MakeDbs::putsq(int)':
    blksrc.h:111:23: error: cannot convert 'gzFile' {aka 'gzFile_s*'} to 'FILE*'
      111 |   if (gzseq) fputc(c, gzseq);
          |                       ^~~~~
          |                       |
          |                       gzFile {aka gzFile_s*}
    In file included from stdtype.h:25,
                     from cmn.h:25,
                     from seq.h:25,
                     from aln.h:26,
                     from spaln.cc:25:
    /usr/include/stdio.h:573:34: note:   initializing argument 2 of 'int fputc(int, FILE*)'
      573 | extern int fputc (int __c, FILE *__stream);
          |                            ~~~~~~^~~~~~~~
    In file included from spaln.cc:29:
    blksrc.h: In destructor 'MakeDbs::~MakeDbs()':
    blksrc.h:122:21: error: cannot convert 'gzFile' {aka 'gzFile_s*'} to 'FILE*'
      122 |   if (gzseq) fclose(gzseq);
          |                     ^~~~~
          |                     |
          |                     gzFile {aka gzFile_s*}

and so on.



LOG
---

    makeroom.sh "-f" "-t" "spaln" "-v" "2.4.13c" "-w" "https://github.com/ogotoh/spaln" "-l" "GPL v2" "-d" "stand-alone program that maps and aligns a set of cDNA or protein sequences onto a whole genomic sequence in a single job"
    ./makeroom_spaln_2.4.13c.sh

    source /sw/bioinfo/spaln/SOURCEME_spaln_2.4.13c && cd $SRCDIR

    wget https://github.com/ogotoh/spaln/archive/refs/tags/ver.2.4.13c.tar.gz
    tar xf ver.2.4.13c.tar.gz
    module load gcc/10.3.0
    module load zlib/1.2.11
    cd spaln-ver.2.4.13c/
    cd src/
    CXX=g++ ./configure --use_zlib=1 --exec_prefix=$PREFIX/bin --table_dir=$PREFIX/table --alndbs_dir=$PREFIX/seqdb
    make
    make install
    mkdir -p $PREFIX/doc/man/man1
    cd ..
    cp *.1 $PREFIX/doc/man/man1
    cp doc/* $PREFIX/doc/

