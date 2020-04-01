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
    cd src/
    wget https://github.com/arq5x/lumpy-sv/releases/download/0.3.0/lumpy-sv.tar.gz
    tar xzf lumpy-sv.tar.gz 
    cd lumpy-sv/
    module load python/2.7.15
    module load gcc/6.3.0
    PYTHONUSERBASE=$PREFIX/python_packages pip install --user pysam
    make
    cp -av * $PREFIX/
    cd ..
    rmdir lumpy-sv

This means that `$PREFIX/bin` and `$PREFIX/scripts` are added to `PATH`, and that we add our own directory to `PYTHONPATH` to pick up the pysam.

Don't forget to change the `#!` lines.

    cd $PREFIX
    cd scripts
    sed -i 's,^#!.*python.*$,#!/usr/bin/env python,' *.py
    sed -i 's,^#!.*perl.*$,#!/usr/bin/env perl,' *.pl

For the mf file, load the modules python/2.7.15, sambamba/0.7.1, samblaster/0.1.24, samtools/1.9, bwa/0.7.17.
