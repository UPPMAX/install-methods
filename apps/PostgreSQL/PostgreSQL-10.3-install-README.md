PostgreSQL/10.3
===============

<https://www.postgresql.org/>

LOG
---


    VERSION=10.3
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps
    mkdir PostgreSQL
    cd PostgreSQL/
    mkdir $VERSION
    cd $VERSION
    mkdir src
    mkdir $CLUSTER
    [ "$CLUSTER" == "rackham" ] && for CC in bianca irma ; do ln -s $CLUSTER $CC; done
    PFX=$PWD/$CLUSTER
    echo $PFX
    cd src
    [[ -f postgresql-${VERSION}.tar.bz2 ]] || wget https://ftp.postgresql.org/pub/source/v${VERSION}/postgresql-${VERSION}.tar.bz2
    [[ -f postgresql-${VERSION}.tar.bz2.md5 ]] || wget https://ftp.postgresql.org/pub/source/v${VERSION}/postgresql-${VERSION}.tar.bz2.md5
    md5sum -c postgresql-${VERSION}.tar.bz2.md5
    [[ -d postgresql-${VERSION} ]] && rm -rf postgresql-${VERSION}
    tar xjf postgresql-${VERSION}.tar.bz2 
    cd postgresql-${VERSION}
    module load gcc/6.3.0
    ./configure --prefix=$PFX --with-openssl --with-ldap --with-libxml 
    make -j4
    make check
    make install
    cd ..
    rm -rf postgresql-${VERSION}


Use mf from MariaDB.
