GroopM/2.0.0
========================

<http://ecogenomics.github.io/GroopM/>

Used under license:
GPL v3 license
<>

Structure creating script (makeroom_GroopM_2.0.0.sh) moved to /sw/bioinfo/GroopM/makeroom_2.0.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "GroopM" -v "2.0.0" -w "http://ecogenomics.github.io/GroopM/" -c "bioinfo" -l "GPL v3 license" -d "metagenomic binning toolset. It leverages spatio-temporal dynamics \\(differential coverage\\) to accurately \\(and almost automatically\\) extract population genomes from multi-sample metagenomic datasets." -x "INSTALL" -s "misc"
    ./makeroom_GroopM_2.0.0.sh
    cd /sw/bioinfo/GroopM
    . SOURCEME_GroopM_2.0.0
    cd $SRCDIR
    ml git/2.28.0
    git clone https://github.com/minillinim/GroopM
#build BamM/1.7.3 within module
    git clone --recursive https://github.com/minillinim/BamM
    git clone https://github.com/codebrainz/libcfu
    cd libcfu
    ml bioinfo-tools automake zlib/1.2.11 gcc/8.3.0 htslib/1.3.2 libtool/2.4.6
    ./autogen.sh
    ./configure --prefix=$PREFIX
    make -j4
    make install
    cd ../BamM/c
    ./configure --with-libcfu-inc=$PREFIX/include/cfu --with-libcfu-lib=$PREFIX/lib --with-libhts-inc=$HTSLIB_ROOT/include/htslib --with-libhts-lib=$HTSLIB_ROOT/lib --prefix=$PREFIX
    cd ..    
    ml bioinfo-tools biopython/1.78 samtools/1.12 bwa/0.7.17 hdf5/1.10.5
    python3 setup.py install --prefix $PREFIX --with-libcfu-inc $PREFIX/include/cfu --with-libcfu-lib $PREFIX/lib --with-libhts-inc $HTSLIB_ROOT/include/htslib --with-libhts-lib $HTSLIB_ROOT/lib
    PYTHONUSERBASE=$PREFIX pip install --user pysam
    PYTHONUSERBASE=$PREFIX pip install --user nose


# install GroopM

    cd ../GroopM/
    PYTHONUSERBASE=$PREFIX pip install --user numexpr
    PYTHONUSERBASE=$PREFIX pip install --user tables
    PYTHONUSERBASE=$PREFIX pip install --user .


