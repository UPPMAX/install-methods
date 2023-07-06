Salmon/1.10.1
============

<https://salmon.readthedocs.io/en/latest>

Used under license:
GPL v3


Structure creating script (makeroom_Salmon_1.10.1.sh) moved to /sw/bioinfo/Salmon/makeroom_1.10.1.sh

LOG
---

    makeroom.sh "-f" "-c" "bioinfo" "-s" "misc" "-t" "Salmon" "-v" "1.10.1" "-w" "https://salmon.readthedocs.io/en/latest" "-d" "a tool for wicked-fast transcript quantification from RNA-seq data" "-l" "GPL v3"
    ./makeroom_Salmon_1.10.1.sh

    source /sw/bioinfo/Salmon/SOURCEME_Salmon_1.10.1 && cd $SRCDIR

No prebuilt binaries here. Build from source.

    wget https://github.com/COMBINE-lab/salmon/archive/refs/tags/v1.10.1.tar.gz
    tar xf v1.10.1.tar.gz
    cd salmon-1.10.1/
    mkdir build
    cd build
    ml cmake/3.26.3
    ml gcc/10.3.0
    ml bzip2/1.0.8
    ml zlib/1.2.12
    ml xz/5.2.6
    ml jemalloc/5.0.1  # cmake finds correctly
    ml libcurl/7.85.0  # cmake finds correctly

We have a staden module but it is very old, so let it build and download its own.

Give cmake hints for modules it can't find easily.  Also, because of compilation errors, turn off interprocedural optimisations with `-DNO_IPO=TRUE` following <https://github.com/COMBINE-lab/salmon/issues/455>.

    cmake .. -DNO_IPO=TRUE -DCMAKE_INSTALL_PREFIX=$PREFIX -DBOOST_ROOT=$BOOST_ROOT -DBZIP2_INCLUDE_DIR:PATH=$BZIP2_ROOT/include -DBZIP2_LIBRARY_RELEASE:FILEPATH=$BZIP2_ROOT/lib/libbz2.so -DZLIB_INCLUDE_DIR:PATH=$ZLIB_ROOT/include -DZLIB_LIBRARY_RELEASE:FILEPATH=$ZLIB_ROOT/lib/libz.so -DLIBLZMA_INCLUDE_DIR:PATH=$LIBLZMA_ROOT/include -DLIBLZMA_LIBRARY_RELEASE:FILEPATH=$LIBLZMA_ROOT/lib/liblzma.so

    make
    make install

    LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH make test

These should all pass.

Now set RPATH in the salmon executable.

    ml patchelf/0.10

    cd $PREFIX/bin

    patchelf --set-rpath "$PREFIX/lib:$LD_LIBRARY_PATH" salmon

    module purge

    ldd salmon

