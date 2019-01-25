Stacks/1.48
===========

Stacks short-read variant pipeline

<http://catchenlab.life.illinois.edu/stacks/>


LOG
---

    VERSION=1.48
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    TOOL=Stacks
    cd /sw/apps/bioinfo
    mkdir $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CC in bianca irma ; do ln -s $CLUSTER $CC; done
    mkdir src
    cd src
    [[ -f stacks-${VERSION}.tar.gz ]] || wget http://catchenlab.life.illinois.edu/stacks/source/stacks-${VERSION}.tar.gz
    [[ -d stacks-${VERSION} ]] && rm -rf stacks-${VERSION}
    tar xzf stacks-${VERSION}.tar.gz

    module load gcc/6.3.0

Install sparsehash for better memory management.

    SH_VERSION=2.0.3
    [[ -f sparsehash-${SH_VERSION}.tar.gz ]] || wget https://github.com/sparsehash/sparsehash/archive/sparsehash-${SH_VERSION}.tar.gz
    [[ -d sparsehash-sparsehash-${SH_VERSION} ]] && rm -rf sparsehash-${SH_VERSION}
    tar xzf sparsehash-${SH_VERSION}.tar.gz
    cd sparsehash-sparsehash-${SH_VERSION}
    ./configure --prefix=$PFX
    make && make install
    cd ..
    rm -rf sparsehash-sparsehash-${SH_VERSION}

Install required perl modules `Spreadsheet::WriteExcel` and `DBD::mysql`, so
load newer perl and MariaDB prior to installing.

    module load perl/5.24.1
    module load MariaDB/10.1.29

    export STACKS_PERL=$PFX/perl-packages
    mkdir -p $STACKS_PERL
    wget -O- http://cpanmin.us | perl - -l $STACKS_PERL App::cpanminus local::lib
    echo 'eval `perl -I $STACKS_PERL/lib/perl5 -Mlocal::lib=$STACKS_PERL`' > ./stacks_perl_profile 
    echo 'export PATH=$STACKS_PERL/bin/:$PATH' >> ./stacks_perl_profile 
    source ./stacks_perl_profile
    cpanm Spreadsheet::WriteExcel
    cpanm DBI
    cpanm DBD::mysql

Stacks has a complete web interface via Apache to view results from
a loaded MySql database.  This module does not implement that, but it
does include tools for filling a MySql database if you happen to have
gotten that to work for you personally.

    cd stacks-${VERSION}
    ./configure --prefix=$PFX --enable-sparsehash --with-sparsehash-include-path=$PFX/include

    make && make install

    cd ..
    rm -rf stacks-${VERSION}


The mf file should load `perl/5.24.1` and `MariaDB/10.1.29`.


