fastp/0.23.2
============

<https://github.com/OpenGene/fastp>

Used under license:
MIT


Structure creating script (makeroom_fastp_0.23.2.sh) moved to /sw/bioinfo/fastp/makeroom_0.23.2.sh

LOG
---

    makeroom.sh "-f" "-t" "fastp" "-v" "0.23.2" "-c" "bioinfo" "-s" "misc" "-w" "https://github.com/OpenGene/fastp" "-l" "MIT" "-d" "A tool designed to provide fast all-in-one preprocessing for FastQ files. This tool is developed in C++ with multithreading supported to afford high performance."
    ./makeroom_fastp_0.23.2.sh

    source /sw/bioinfo/fastp/SOURCEME_fastp_0.23.2
    cd $SRCDIR

We need libisal and libdeflate.  We need to have yasm and nasm assemblers loaded, installed for this.

    module load gcc/10.3.0
    module load nasm/2.15.05

    wget http://deb.debian.org/debian/pool/main/libi/libisal/libisal_2.30.0.orig.tar.xz
    tar xf libisal_2.30.0.orig.tar.xz 
    cd libisal-2.30.0/
    ./autogen.sh 
    ./configure --prefix=$PREFIX
    make
    make install
    cd ..

    wget https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.8.tar.gz
    mv v1.8.tar.gz libdeflate-v1.8.tar.gz
    tar xf libdeflate-v1.8.tar.gz 
    cd libdeflate-1.8/
    make PREFIX=$PREFIX install
    cd ..

    wget https://github.com/OpenGene/fastp/archive/v${VERSION}.tar.gz
    tar xf v${VERSION}.tar.gz
    cd fastp-0.23.1/
    export LD_RUN_PATH=$PREFIX/lib:$LD_RUN_PATH
    export LIBRARY_PATH=$PREFIX/lib
    export CPLUS_INCLUDE_PATH=$PREFIX/include
    make -j4
    make install

