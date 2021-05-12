BamM/1.7.3
========================

<https://github.com/Ecogenomics/BamM>

Used under license:
GPL v3 license
<>

Structure creating script (makeroom_BamM_1.7.3.sh) moved to /sw/bioinfo/BamM/makeroom_1.7.3.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "BamM" -v "1.7.3" -w "https://github.com/Ecogenomics/BamM" -c "bioinfo" -l "GPL v3 license" -d "provide a faster\, more stable interface to parsing BAM files than PySam\, but doesn\'t implement all/any of PySam\'s features." -x "INSTALL" -s "misc"
    ./makeroom_BamM_1.7.3.sh
    cd $SRCDIR
    ml bioinfo-tools git/2.28 biopython/1.73 automake zlib gcc/8.3.0 htslib/1.3.2
    git clone --recursive https://github.com/minillinim/BamM
    git clone https://github.com/codebrainz/libcfu
    cd libcfu
    ./autogen.sh
    ./configure --prefix=$PREFIX
    make -j4
    make install
    cd ../BamM/c
    ./configure --with-libcfu-inc=$PREFIX/include/cfu --with-libcfu-lib=$PREFIX/lib --with-libhts-inc=$HTSLIB_ROOT/include/htslib --with-libhts-lib=$HTSLIB_ROOT/lib --prefix=$PREFIX
    
    cd ..
    python2 setup.py install --prefix $PREFIX --with-libcfu-inc $PREFIX/include/cfu --with-libcfu-lib $PREFIX/lib --with-libhts-inc $HTSLIB_ROOT/include/htslib --with-libhts-lib $HTSLIB_ROOT/lib
    cd ..
    PYTHONUSERBASE=$PREFIX pip install --user pysam
    cd $PREFIX

#TESTS
#   include samtools and bwa in module
    ml BamM patchelf
    cd $SRCDIR/BamM
    patchelf --print-rpath $PREFIX/lib//python2.7/site-packages/bamm/libBamM.a
    patchelf --set-rpath $PREFIX/lib:/sw/bioinfo/htslib/1.3.2/rackham/lib $PREFIX/lib/python2.7/site-packages/bamm/libBamM.a
    nosetests



