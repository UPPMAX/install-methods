Stacks/2.41
============

<http://catchenlab.life.illinois.edu/stacks/>

Used under license:
GPL v3

Structure creating script (makeroom_Stacks_2.41.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Stacks/makeroom_2.41.sh


LOG
---

No longer using sparsehash ?  The README mentions an `--enable-sparsehash`
option for `./configure` but nope.

Install required perl modules `Spreadsheet::WriteExcel` and `DBD::mysql`, so
load newer perl and MariaDB prior to installing.


    TOOL=Stacks
    VERSION=2.41
    makeroom.sh -f -t $TOOL -v $VERSION -w http://catchenlab.life.illinois.edu/stacks/ -s misc -l "GPL v3" -d "Software pipeline for building loci from short-read sequences"
    ./makeroom_${TOOL}_${VERSION}.sh
    cd /sw/bioinfo/$TOOL
    source SOURCEME_${TOOL}_${VERSION}

    cd $VERSION
    cd src
    [[ -f stacks-${VERSION}.tar.gz ]] || wget http://catchenlab.life.illinois.edu/stacks/source/stacks-${VERSION}.tar.gz
    [[ -d stacks-${VERSION} ]] && rm -rf stacks-${VERSION}
    tar xzf stacks-${VERSION}.tar.gz

    module load gcc/7.4.0

    module load perl/5.26.2
    module load MariaDB/10.1.29

    export STACKS_PERL=$PREFIX/perl-packages
    mkdir -p $STACKS_PERL
    wget -O- http://cpanmin.us | perl - -l $STACKS_PERL App::cpanminus local::lib
    echo 'eval `perl -I $STACKS_PERL/lib/perl5 -Mlocal::lib=$STACKS_PERL`' > ./stacks_perl_profile 
    echo 'export PATH=$STACKS_PERL/bin/:$PATH' >> ./stacks_perl_profile 
    source ./stacks_perl_profile
    cpanm Spreadsheet::WriteExcel
    cpanm DBI
    cpanm DBD::mysql

    cd stacks-${VERSION}
    ./configure --prefix=$PREFIX

    make && make install

    cd ..
    rm -rf stacks-${VERSION}


The mf file should load `perl/5.24.1` and `MariaDB/10.1.29`.

