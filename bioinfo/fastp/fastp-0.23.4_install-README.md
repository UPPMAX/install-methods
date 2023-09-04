fastp/0.23.4
============

<https://github.com/OpenGene/fastp>

Used under license:
MIT


Structure creating script (makeroom_fastp_0.23.4.sh) moved to /sw/bioinfo/fastp/makeroom_0.23.4.sh

LOG
---

    makeroom.sh "-f" "-t" "fastp" "-v" "0.23.4" "-c" "bioinfo" "-s" "misc" "-w" "https://github.com/OpenGene/fastp" "-l" "MIT" "-d" "A tool designed to provide fast all-in-one preprocessing for FastQ files. This tool is developed in C++ with multithreading supported to afford high performance."
    ./makeroom_fastp_0.23.4.sh

    source /sw/bioinfo/fastp/SOURCEME_fastp_0.23.4
    cd $SRCDIR


We need libisal and libdeflate.  We need to have yasm and nasm assemblers loaded, installed for this.

    LIBISAL_VERSION=2.30.0
    LIBDEFLATE_VERSION=1.18

    module load gcc/12.3.0
    module load nasm/2.15.05
    module load cmake/3.26.3

    cd $SRCDIR
    [[ -f libisal_${LIBISAL_VERSION}.orig.tar.xz ]] || wget http://deb.debian.org/debian/pool/main/libi/libisal/libisal_${LIBISAL_VERSION}.orig.tar.xz
    [[ -d libisal-${LIBISAL_VERSION} ]] && rm -rf libisal-${LIBISAL_VERSION}
    tar xf libisal_${LIBISAL_VERSION}.orig.tar.xz 
    cd libisal-${LIBISAL_VERSION}/
    ./autogen.sh 
    ./configure --prefix=$PREFIX
    make -j4
    make test
    make install

    cd $SRCDIR
    if [[ ! -f libdeflate-v${LIBDEFLATE_VERSION}.tar.gz ]] ; then
        wget https://github.com/ebiggers/libdeflate/archive/refs/tags/v${LIBDEFLATE_VERSION}.tar.gz
        mv -f v${LIBDEFLATE_VERSION}.tar.gz libdeflate-v${LIBDEFLATE_VERSION}.tar.gz
    fi
    [[ -d libdeflate-${LIBDEFLATE_VERSION} ]] && rm -rf libdeflate-${LIBDEFLATE_VERSION}
    tar xf libdeflate-v${LIBDEFLATE_VERSION}.tar.gz 
    cd libdeflate-${LIBDEFLATE_VERSION}/
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX
    make
    make install

    cd $SRCDIR
    if [[ ! -f fastp-v${VERSION}.tar.gz ]] ; then
        wget https://github.com/OpenGene/fastp/archive/v${VERSION}.tar.gz
        mv -f v${VERSION}.tar.gz fastp-v${VERSION}.tar.gz
    fi
    [[ -d fastp-${VERSION} ]] && rm -rf fastp-${VERSION}
    tar xf fastp-v${VERSION}.tar.gz
    cd fastp-${VERSION}/
    export LD_RUN_PATH=$PREFIX/lib:$PREFIX/lib64:$LD_RUN_PATH
    export LIBRARY_PATH=$PREFIX/lib:$PREFIX/lib64:$LIBRARY_PATH
    export CPLUS_INCLUDE_PATH=$PREFIX/include
    export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig:$PREFIX/lib64/pkgconfig:$PKG_CONFIG_PATH
    make -j4
    make install

Make sure the libraries can be found.

    cd $PREFIX/bin
    unset LD_RUN_PATH LIBRARY_PATH CPLUS_INCLUDE_PATH PKG_CONFIG_PATH
    ldd fastp

For the mf, add $modroot/bin to PATH, and that's it. We can reuse the 0.23.1 mf file, like 0.23.2 did. 


Finish up.

    cd $TOOLDIR
    ./fastp-0.23.4_post-install.sh
