EAGLE/1.1.3
===========

<https://github.com/tony-kuo/eagle>

Used under license:
GPL v3


Structure creating script (makeroom_EAGLE_1.1.3.sh) moved to /sw/bioinfo/EAGLE/makeroom_1.1.3.sh

LOG
---

Clone the repository and reset to the indicated commit. The only change from
the 1.1.3 release is an update to the tool version number to match the release
number.

    makeroom.sh -t EAGLE -v 1.1.3 -c bioinfo -s misc -w https://github.com/tony-kuo/eagle -d "Explicit Alternative Genome Likelihood Evaluator" -l "GPL v3" 
    ./makeroom_EAGLE_1.1.3.sh 
    source /sw/bioinfo/EAGLE/SOURCEME_EAGLE_1.1.3 && cd $SRCDIR
    ml git/2.34.1
    git clone https://github.com/tony-kuo/eagle
    cd eagle/
    git reset --hard d6fb2e9

Now load the things to compile against htslib/1.17. Note all the make variable
changes. Why did they choose to compile with `-march=native`? Override that. Note
also that we must add `-lzstd` to the libraries because of the way we compile
htslib/1.17, and also add `-ldl` to the list of libraries needed because that was
left out by the developers.

    ml gcc/11.3.0
    ml libcurl/7.85.0
    ml zlib/1.2.12
    ml bzip2/1.0.8
    ml xz/5.2.6
    ml zstd/1.5.2
    ml bioinfo-tools
    ml htslib/1.17
    mkdir $PREFIX/bin
    make CFLAGS="-Wall -O2 -pthread" HTSDIR="$HTSLIB_ROOT/../src/htslib-1.17" LDLIBS="-lm -lz -llzma -lbz2 -lzstd -lpthread -ldl -lcurl" PREFIX=$PREFIX install

Now provide and adjust the scripts.

    ml python/3.10.8
    cp -av scripts $PREFIX/
    cd $PREFIX/scripts
    sed -i -e '1i#!'"$(which python)" *.py
    sed -i -e '1i#!/usr/bin/env perl' *.pl
    chmod +x *.sh *.pl *.py

Check RPATH and script imports.

    cd ../bin
    ml purge
    ldd eagle
    ldd eagle-rc 

    cd ../scripts
    ./compare2TruthData.py --help
    ./compile_likelihoods.py --help


Add $modroot/bin and $modroot/scripts to PATH.

