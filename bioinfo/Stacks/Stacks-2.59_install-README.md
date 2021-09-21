Stacks/2.59
========================

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
    VERSION=2.59
    makeroom.sh -f -t $TOOL -v $VERSION -w http://catchenlab.life.illinois.edu/stacks/ -s misc -l "GPL v3" -d "Software pipeline for building loci from short-read sequences"
    ./makeroom_${TOOL}_${VERSION}.sh

    source /sw/bioinfo/Stacks/SOURCEME_Stacks_2.59 && cd $TOOLDIR/${VERSION}/src

    [[ -f stacks-${VERSION}.tar.gz ]] || wget http://catchenlab.life.illinois.edu/stacks/source/stacks-${VERSION}.tar.gz
    tar xzf stacks-${VERSION}.tar.gz
    cd stacks-${VERSION}

    module load gcc/9.3.0
    module load perl_modules/5.26.2
    module load MariaDB/10.1.29

#    export STACKS_PERL=$PREFIX/perl-packages
#    mkdir -p $STACKS_PERL
#    wget -O- http://cpanmin.us | perl - -l $STACKS_PERL App::cpanminus local::lib
#    echo 'eval `perl -I $STACKS_PERL/lib/perl5 -Mlocal::lib=$STACKS_PERL`' > ./stacks_perl_profile 
#    echo 'export PATH=$STACKS_PERL/bin/:$PATH' >> ./stacks_perl_profile 
#    source ./stacks_perl_profile
#    cpanm Spreadsheet::WriteExcel
#    cpanm DBI
#    cpanm DBD::mysql

    ./configure --prefix=$PREFIX

    make -j 8 && make install


The mf file should load `perl/5.26.2` and `MariaDB/10.1.29`.

