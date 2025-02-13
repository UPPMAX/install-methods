grenedalf/0.6.0
========================

<https://github.com/lczech/grenedalf>

Used under license:
GPL3
<https://github.com/lczech/grenedalf/blob/master/LICENSE>

Structure creating script (makeroom_grenedalf_0.6.0.sh) moved to /sw/bioinfo/grenedalf/makeroom_0.6.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "grenedalf" "-v" "0.6.0" "-w" "https://github.com/lczech/grenedalf" "-l" "GPL3" "-L" "https://github.com/lczech/grenedalf/blob/master/LICENSE" "-d" "grenedalf is a collection of commands for working with population genetic data, in particular from pool sequencing. Its main focus are statistical analyses such as Tajima's D and Fst, following the approaches of PoPoolation and PoPoolation2" "-f"
    ./makeroom_grenedalf_0.6.0.sh
    source SOURCEME_grenedalf_0.3.0 
    cd $SRCDIR

    ml git/2.34.1 
    ml gcc/12.3.0 
    ml cmake/3.26.3
    ml zlib/1.2.12
    ml xz/5.2.6
    ml bzip2/1.0.8
    ml libdeflate/1.19

    git clone --recursive https://github.com/lczech/grenedalf.git

    cd grenedalf/

    mkdir build
    cd build

    cmake .. -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DCMAKE_INSTALL_PREFIX=$PREFIX -DBZIP2_INCLUDE_DIR:PATH=$BZIP2_ROOT/include -DBZIP2_LIBRARY_RELEASE:FILEPATH=$BZIP2_ROOT/lib/libbz2.a -DLIBLZMA_INCLUDE_DIR:PATH=$LIBLZMA_ROOT/include -DLIBLZMA_LIBRARY_RELEASE:FILEPATH=$LIBLZMA_ROOT/lib/liblzma.a -DDeflate_INCLUDE_DIR:PATH=$LIBDEFLATE_ROOT/include -DDeflate_LIBRARY_RELEASE:FILEPATH=$LIBDEFLATE_ROOT/lib64/libdeflate.a

    make

There is no `make install`, and providing `-DCMAKE_INSTALL_PREFIX=$PREFIX` does nothing.

Check library paths.

    ml patchelf
    patchelf --print-rpath ../bin/grenedalf 

Install.

    cd ..
    cp -av bin $PREFIX/
    ml purge
    cd $PREFIX/bin
    grenedalf --help
    grenedalf version

