gzip/1.13
========================

<https://www.gnu.org/software/gzip/>

Used under license:
GPL v3


Structure creating script (makeroom_gzip_1.13.sh) moved to /sw/apps/gzip/makeroom_1.13.sh

LOG
---

    makeroom.sh "-f" "-t" "gzip" "-v" "1.13" "-c" "apps" "-w" "https://www.gnu.org/software/gzip/" "-l" "GPL v3" "-d" "popular data compression program"
    ./makeroom_gzip_1.13.sh
    source /sw/apps/gzip/SOURCEME_gzip_1.13
    cd $SRCDIR
    wget https://ftp.gnu.org/gnu/gzip/gzip-1.13.tar.gz
    tar xf gzip-1.13.tar.gz
    cd gzip-1.13/
    ml gcc/12.3.0
    ./configure --help
    ./configure --prefix=$PREFIX
    make -j10
    make check
    make install
