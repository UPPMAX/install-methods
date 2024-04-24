gzip/1.12
========================

<https://www.gnu.org/software/gzip/>

Used under license:
GPL v3


Structure creating script (makeroom_gzip_1.12.sh) moved to /sw/apps/gzip/makeroom_1.12.sh

LOG
---

    makeroom.sh "-f" "-t" "gzip" "-v" "1.12" "-c" "apps" "-w" "https://www.gnu.org/software/gzip/" "-l" "GPL v3" "-d" "popular data compression program"
    ./makeroom_gzip_1.12.sh

    source /sw/apps/gzip/SOURCEME_gzip_1.12
    cd $SRCDIR

    wget https://ftp.gnu.org/gnu/gzip/gzip-1.12.tar.gz
    tar xf gzip-1.12.tar.gz

Configure and build.
