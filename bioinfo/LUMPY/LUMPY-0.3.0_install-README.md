LUMPY/0.3.0
===========

<https://github.com/arq5x/lumpy-sv>

Used under license:
MIT

Structure creating script (makeroom_LUMPY_0.3.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/LUMPY/makeroom_0.3.0.sh

makeroom.sh invoked with:
/home/douglas/bin/makeroom.sh -t "LUMPY" -v "0.3.0" -f" -w "https://github.com/arq5x/lumpy-sv" -s "misc" -l "MIT" -d "a general probabilistic framework for structural variant discovery"

This requires a python 2.

    TOOL=LUMPY
    VERSION=0.3.0
    cd /sw/bioinfo
    makeroom.sh -t $TOOL -v $VERSION -f -w https://github.com/arq5x/lumpy-sv -s misc -l "MIT" -d "a general probabilistic framework for structural variant discovery"
    ./makeroom_LUMPY_0.3.0.sh 
    cd $TOOL
    source SOURCEME_LUMPY_0.3.0 
    cd 0.3.0/
    rmdir $PREFIX

    cd src/
    [[ -f lumpy-sv.tar.gz ]] || wget https://github.com/arq5x/lumpy-sv/releases/download/${VERSION}/lumpy-sv.tar.gz
    [[ -d lumpy-sv ]] && rm -rf lumpy-sv
    tar xzf lumpy-sv.tar.gz 
    mv lumpy-sv $PREFIX
    cd $PREFIX

    module load python/2.7.15
    module load gcc/6.3.0
    module load zlib/1.2.11
    module load sambamba/0.7.1
    module load samblaster/0.1.24
    module load samtools/1.9
    module load bwa/0.7.17

    virtualenv $PREFIX/venv
    $PREFIX/venv/bin/pip install pysam
    $PREFIX/venv/bin/pip install numpy

    make

    cd scripts

    sed -i 's,^#!.*python.*$,#!PREFIXPREFIX,' *.py extractSplitReads_BwaMem lumpy_smooth lumpyexpress vcfToBedpe
    sed -i 's,^#\!.*perl.*$,#!/usr/bin/env perl,' *.pl
    sed -i "s,PREFIXPREFIX,$PREFIX/venv/bin/python2.7," *.py extractSplitReads_BwaMem lumpy_smooth lumpyexpress vcfToBedpe

    cd bamkit

    sed -i 's,^#!.*python.*$,#!PREFIXPREFIX,' *.py
    sed -i "s,PREFIXPREFIX,$PREFIX/venv/bin/python2.7," *.py

Make sure the virtualenv's python can find the python .so.

    module unload python
    ldd $PREFIX/venv/bin/python2.7

For the mf file, load the modules sambamba/0.7.1, samblaster/0.1.24, samtools/1.9, bwa/0.7.17.


