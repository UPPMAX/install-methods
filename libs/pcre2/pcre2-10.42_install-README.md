pcre2/10.42
========================

<https://github.com/PCRE2Project/pcre2>

Used under license:
PCRE2 Licence
<https://raw.githubusercontent.com/PCRE2Project/pcre2/master/LICENCE>

Structure creating script (makeroom_pcre2_10.42.sh) moved to /sw/libs/pcre2/makeroom_10.42.sh

LOG
---

    makeroom.sh -f -c libs -t pcre2 -v 10.42 -w https://github.com/PCRE2Project/pcre2 -l "PCRE2 Licence" -L https://raw.githubusercontent.com/PCRE2Project/pcre2/master/LICENCE
    ./makeroom_pcre2_10.42.sh 

    source /sw/libs/pcre2/SOURCEME_pcre2_10.42
    cd $SRCDIR

    wget https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.42/pcre2-10.42.tar.bz2
    tar xf pcre2-10.42.tar.bz2 
    cd pcre2-10.42/

    ml bzip2/1.0.8 zlib/1.2.12

    ./configure --prefix=$PREFIX --enable-pcre2-16 --enable-pcre2-32 --enable-jit --enable-pcre2grep-libz --enable-pcre2grep-libbz2
    make -j10
    make check
    make install

Edit mf.

    cd $TOOLDIR/mf
    vi 10.42

Wrap up.

    cd $TOOLDIR
    ./pcre2-10.42_post-install.sh 
