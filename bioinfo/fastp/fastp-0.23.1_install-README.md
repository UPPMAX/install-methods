fastp/0.23.1
========================

<https://github.com/OpenGene/fastp>

Used under license:
MIT


Structure creating script (makeroom_fastp_0.23.1.sh) moved to /sw/bioinfo/fastp/makeroom_0.23.1.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -t "fastp" -v "0.23.1" -w "https://github.com/OpenGene/fastp" -s "misc" -l "MIT" -d "fast all-in-one preprocessing for FastQ files"
    ./makeroom_fastp_0.23.1.sh
fastp/0.20.0
========================

<https://github.com/OpenGene/fastp>

Used under license:
MIT

Structure creating script (makeroom_fastp_0.20.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/fastp/makeroom_0.20.0.sh

makeroom.sh invoked with:
/home/douglas/bin/makeroom.sh -t "fastp" -v "0.20.0" -w "https://github.com/OpenGene/fastp" -s "misc" -l "MIT" -d "fast all-in-one preprocessing for FastQ files"

LOG
---

    makeroom.sh -f -t "fastp" -v "0.23.1" -w "https://github.com/OpenGene/fastp" -s "misc" -l "MIT" -d "fast all-in-one preprocessing for FastQ files"
    ./makeroom_fastp_0.23.1.sh 
    source /sw/bioinfo/fastp/SOURCEME_fastp_0.23.1
    cd $SRCDIR
    wget https://github.com/OpenGene/fastp/archive/v${VERSION}.tar.gz
    tar xf v${VERSION}.tar.gz

We need libisal and libdeflate.  We need to have nasm assembler loaded, installed for this.

    module load gcc/9.3.0
    module load nasm/2.15.05

    wget https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.8.tar.gz
    mv v1.8.tar.gz libdeflate-v1.8.tar.gz
    tar xf libdeflate-v1.8.tar.gz 
    cd libdeflate-1.8/
    make PREFIX=$PREFIX install
    cd ..

    wget http://deb.debian.org/debian/pool/main/libi/libisal/libisal_2.30.0.orig.tar.xz
    tar xf libisal_2.30.0.orig.tar.xz 
    cd libisal-2.30.0/
    ./autogen.sh 
    ./configure --prefix=$PREFIX
    make
    make install
    cd ..

    cd fastp-0.23.1/
    export LD_RUN_PATH=$PREFIX/lib:$LD_RUN_PATH
    export LIBRARY_PATH=$PREFIX/lib
    export CPLUS_INCLUDE_PATH=$PREFIX/include
    make -j4
    make install

