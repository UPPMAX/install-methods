ORFfinder/0.4.3
===============

<https://www.ncbi.nlm.nih.gov/orffinder>

Used under license:
Public domain


Structure creating script (makeroom_ORFfinder_0.4.3.sh) moved to /sw/bioinfo/ORFfinder/makeroom_0.4.3.sh

LOG
---

    makeroom.sh "-t" "ORFfinder" "-v" "0.4.3" "-c" "bioinfo" "-s" "annotation" "-w" "https://www.ncbi.nlm.nih.gov/orffinder" "-d" "ORF finder searches for open reading frames (ORFs) in a DNA sequence" "-l" "Public domain"
    ./makeroom_ORFfinder_0.4.3.sh
    source /sw/bioinfo/ORFfinder/SOURCEME_ORFfinder_0.4.3 && cd $SRCDIR

The existing RPATH information in the `ORFfinder` executalbe gives clues to the library and compiler versions used to create the executable.

    /opt/ncbi/gcc/7.3.0/lib/gcc/x86_64-redhat-linux-gnu/7.3.0/:/opt/ncbi/gcc/7.3.0/lib64/:/export/home/web/public/htdocs/staff/resenchu/ORFfinder/SVNCL/trunk/internal/c++/lib:/opt/ncbi/gcc/7.3.0/lib/gcc/x86_64-redhat-linux-gnu/7.3.0/../../../../lib64:/opt/ncbi/64/lzo-2.05/lib64:/opt/ncbi/64/libuv-1.35.0/GCC481-DebugOptMT64/lib:/opt/ncbi/64/nghttp2-1.40.0/GCC730-DebugOptMT64/lib:/netopt/ncbi_tools64/c++.by-date/20210331/GCC730-Release64/lib:/netopt/ncbi_tools64/lzo-2.05/lib64:/netopt/ncbi_tools64/libuv-1.35.0/GCC481-DebugOptMT64/lib:/netopt/ncbi_tools64/nghttp2-1.40.0/GCC730-DebugOptMT64/lib

So GCC 7.3.0, nghttp2 1.40.0 and libuv 1.35.0.  We went with newer versions of
these; for the libraries, more recent versions, but no more recent than May
2021, the release date of this executable of ORFfinder.

The build of nghttp2 requires a python >= 3.8. We don't worry about that
functionality for this module but the configure process requires it to be
available.

    module load gcc/9.3.0
    module load python/3.9.5

    cd $SRCDIR

    wget https://ftp.ncbi.nlm.nih.gov/genomes/TOOLS/ORFfinder/linux-i64/ORFfinder.gz
    gunzip ORFfinder.gz 
    file ORFfinder 
    chmod +x ORFfinder 
    ./ORFfinder 

Need libuv.

    cd $SRCDIR
    wget https://github.com/libuv/libuv/archive/refs/tags/v1.41.0.tar.gz
    tar xf v1.41.0.tar.gz 
    cd libuv-1.41.0/
    sh ./autogen.sh 
    ml gcc/9.3.0
    ./configure --prefix=$PREFIX
    make -j10
    make install

Need libnghttp2.

    cd $SRCDIR
    wget https://github.com/nghttp2/nghttp2/releases/download/v1.43.0/nghttp2-1.43.0.tar.gz
    tar xf nghttp2-1.43.0.tar.gz 
    cd nghttp2-1.43.0/
    ./configure --prefix=$PREFIX
    make -j10
    make install

Now update RPATH in the ORFfinder executable.

    module load patchelf

    patchelf --set-rpath $PREFIX/lib:$LD_RUN_PATH ORFfinder 

    ml purge
    ./ORFfinder 

