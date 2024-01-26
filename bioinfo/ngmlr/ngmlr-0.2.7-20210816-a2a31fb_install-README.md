ngmlr/0.2.7-20210816-a2a31fb
============================

<https://github.com/philres/ngmlr>

Used under license:
MIT


Structure creating script (makeroom_ngmlr_0.2.7-20210816-a2a31fb.sh) moved to /sw/bioinfo/ngmlr/makeroom_0.2.7-20210816-a2a31fb.sh

LOG
---

    makeroom.sh -t ngmlr -v 0.2.7-20210816-a2a31fb -w https://github.com/philres/ngmlr -c bioinfo -s alignment -d "NGMLR is a long-read mapper designed to align PacBio or Oxford Nanopore (standard and ultra-long) to a reference genome with a focus on reads that span structural variations" -l MIT
    ./makeroom_ngmlr_0.2.7-20210816-a2a31fb.sh 
    source /sw/bioinfo/ngmlr/SOURCEME_ngmlr_0.2.7-20210816-a2a31fb
    cd $SRCDIR
    ml git/2.34.1
    git clone --recursive https://github.com/philres/ngmlr
    cd ngmlr
    git reset --hard a2a31fb
    ml cmake/3.26.3
    ml gcc/12.3.0
    ml zlib/1.3
    echo $PREFIX
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_DEFAULT_CMP0074=NEW 
    make
    make install
    cd $PREFIX/bin
    ml purge
    ldd ngmlr 
