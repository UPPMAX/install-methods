# Stacks-1.19-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

Stacks 1.19

DESCRIPTION
-----------

Stacks short-read variant pipeline

WEBSITE
-------

    http://creskolab.uoregon.edu/stacks/

MODULE REQUIREMENTS
-------------------

Perl DBI with MySql driver

Perl Spreadsheet::WriteExcel


Samtools and Google Sparsehash should be installed to enable the
usage of BAM files and to speed up the operation of Stacks.

Stacks has a complete web interface via Apache to view results from
a loaded MySql database.  This module does not implement that, but it
does include tools for filling a MySql database if you happen to have
gotten that to work for you personally.

LOG
---

    STACKS_DIR=/sw/apps/bioinfo/Stacks
    VERSION=1.19
    mkdir -p $STACKS_DIR/$VERSION/milou
    cd $STACKS_DIR/$VERSION/
    wget http://creskolab.uoregon.edu/stacks/source/stacks-$VERSION.tar.gz
    tar xvzf stacks-$VERSION.tar.gz
    mv stacks-$VERSION/* milou/ && rmdir stacks-$VERSION
    cd milou

Install Google sparsehash to this directory

    wget https://sparsehash.googlecode.com/files/sparsehash-2.0.2.tar.gz
    tar xvzf sparsehash-2.0.2.tar.gz
    cd sparsehash-2.0.2
    ./configure --prefix=$STACKS_DIR/$VERSION/milou
    make && make install
    cd ..

So now sparsehash is installed, include files in $STACKS_DIR/$VERSION/milou/include
Use libbam.a and include files from the samtools 0.1.19 module.

    ./configure --prefix=$STACKS_DIR/$VERSION/milou --enable-sparsehash --with-sparsehash-include-path=$STACKS_DIR/$VERSION/milou/include --enable-bam --with-bam-include-path=/sw/apps/bioinfo/samtools/0.1.19/src --with-bam-lib-path=/sw/apps/bioinfo/samtools/0.1.19/src

The setting of CPLUS_INCLUDE_DIR in version 1.12 was not necessary for 1.19.
Continuing...

    make && make install

Files are added to $STACKS_DIR/$VERSION/milou/bin.  Now install suggested perl
packages.  I am skipping the MySql interface packages, but will install
Spreadsheet::WriteExcel to a local directory following the script at
https://www.uppmax.uu.se/faq/installing-local-perl-packages and will add this
local directory to PERL5LIB.

    export STACKS_PERL=$STACKS_DIR/$VERSION/milou/perl-packages
    mkdir -p $STACKS_PERL
    wget -O- http://cpanmin.us | perl - -l $STACKS_PERL App::cpanminus local::lib
    echo 'eval `perl -I $STACKS_PERL/lib/perl5 -Mlocal::lib=$STACKS_PERL`' > ./stacks_perl_profile 
    echo 'export PATH=$STACKS_PERL/bin/:$PATH' >> ./stacks_perl_profile 
    source ./stacks_perl_profile
    cpanm Spreadsheet::WriteExcel

Create mf file and have it add $STACKS_DIR/$VERSION/milou/bin to the user PATH,
and $STACKS_PERL/lib/perl5 to PERL5LIB.


