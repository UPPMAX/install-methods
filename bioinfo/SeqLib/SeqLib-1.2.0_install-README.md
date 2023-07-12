SeqLib/1.2.0
========================

git/2.34.1
JsonCpp/1.9.5
automake/1.16.1
autoconf/2.69
m4/1.4.17
libcurl/7.85.0
zlib/1.2.12
bzip2/1.0.8
xz/5.2.6
zstd/1.5.2
gcc/10.3.0

<https://github.com/walaj/SeqLib>

Used under license:
Apache 2.0
<https://raw.githubusercontent.com/walaj/SeqLib/master/LICENSE>

Structure creating script (makeroom_SeqLib_1.2.0.sh) moved to /sw/bioinfo/SeqLib/makeroom_1.2.0.sh

LOG
---

    makeroom.sh -c bioinfo -s misc -t SeqLib -v 1.2.0  -w https://github.com/walaj/SeqLib -l "Apache 2.0" -L https://raw.githubusercontent.com/walaj/SeqLib/master/LICENSE -d "C++ htslib/bwa-mem/fermi interface for interrogating sequence data"
    ./makeroom_SeqLib_1.2.0.sh 
    source /sw/bioinfo/SeqLib/SOURCEME_SeqLib_1.2.0
    cd $SRCDIR

    ml gcc/10.3.0
    ml git/2.34.1
    ml automake/1.16.1
    ml autoconf/2.69
    ml m4/1.4.17
    ml ml libcurl/7.85.0
    ml JsonCpp/1.9.5
    ml zlib/1.2.12
    ml bzip2/1.0.8
    ml xz/5.2.6
    ml zstd/1.5.2

    git clone --recursive https://github.com/walaj/SeqLib.git
    cd SeqLib/

Configure htslib.

    cd htslib/
    make distclean
    autoreconf
    ./configure --enable-libcurl
    cd ..

Configure bwa, add `-fcommon` flag.

    cd bwa
    vi Makefile

Add `-fcommon` flag to `CFLAGS` definition, so that the line becomes

    CFLAGS=     -g -Wall -Wno-unused-function -O2 -fcommon

Back to main dir.

    cd ..

Configure fermi-lite, add `-fcommon` flag.

    cd fermi-lite/
    vi Makefile 

Add `-fcommon` flag to `CFLAGS` definition, so that the line becomes

    CFLAGS=     -g -Wall -O2 -Wno-unused-function -fcommon #-fno-inline-functions -fno-inline-functions-called-once

Back to main dir.

    cd ..

Now build everything.

    make
    make install
    make seqtools


Installing into PREFIX
----------------------

Note that the install does not add anything to `$PREFIX`, only the build directory. Pain in the ass. Dummy something up.

    mkdir $PREFIX/include
    cp -av SeqLib $PREFIX/include/
    cp -av htslib $PREFIX/include/
    cp -av bin lib $PREFIX/

