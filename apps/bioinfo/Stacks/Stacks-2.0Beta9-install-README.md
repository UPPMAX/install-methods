Stacks/2.0Beta9
===========

Stacks short-read variant pipeline

<http://catchenlab.life.illinois.edu/stacks/>


LOG
---

No longer using sparsehash ?  The README mentions an `--enable-sparsehash`
option for `./configure` but nope.

Install required perl modules `Spreadsheet::WriteExcel` and `DBD::mysql`, so
load newer perl and MariaDB prior to installing.


    VERSION=2.0Beta9
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

    cd stacks-${VERSION}
    ./configure --prefix=$PFX

    make && make install

    cd ..
    rm -rf stacks-${VERSION}


The mf file should load `perl/5.24.1` and `MariaDB/10.1.29`.


