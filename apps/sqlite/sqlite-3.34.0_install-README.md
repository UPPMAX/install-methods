sqlite/3.34.0
========================

<https://www.sqlite.org/>

Used under license:
public domain
<https://www.sqlite.org/copyright.html>

Structure creating script (makeroom_sqlite_3.34.0.sh) moved to /sw/apps/sqlite/makeroom_3.34.0.sh

LOG
---

    TOOL=sqlite
    VERSION=3.34.0
    cd /sw/apps/$TOOL
    makeroom.sh -c "apps" -f -t $TOOL -v $VERSION -w "https://www.sqlite.org/" -d "C-language library that implements a small\, fast\, self-contained\, high-reliability\, full-featured\, SQL database engine" -l "public domain" -L "https://www.sqlite.org/copyright.html"
    ./makeroom_sqlite_3.34.0.sh
    source SOURCEME_sqlite_3.34.0

    cd $SRCDIR
    wget https://www.sqlite.org/2020/sqlite-autoconf-3340000.tar.gz
    tar xzf sqlite-autoconf-3340000.tar.gz
    cd sqlite-autoconf-3340000
    ./configure --prefix=$PREFIX CFLAGS=-DSQLITE_ENABLE_COLUMN_METADATA=1
    make
    make install
    cd $SRCDIR
    rm -rf sqlite-autoconf-3340000

