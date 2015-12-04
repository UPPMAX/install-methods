# Stacks-1.24-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

Stacks 1.24

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

    CLUSTER=milou
    STACKS_DIR=/sw/apps/bioinfo/Stacks
    VERSION=1.24
    mkdir -p $STACKS_DIR/$VERSION/$CLUSTER
    cd $STACKS_DIR/$VERSION/
    wget http://creskolab.uoregon.edu/stacks/source/stacks-$VERSION.tar.gz
    tar xvzf stacks-$VERSION.tar.gz
    mv stacks-$VERSION/* $CLUSTER/ && rmdir stacks-$VERSION
    cd $CLUSTER

Install Google sparsehash to this directory

    wget https://sparsehash.googlecode.com/files/sparsehash-2.0.2.tar.gz
    tar xvzf sparsehash-2.0.2.tar.gz
    cd sparsehash-2.0.2
    ./configure --prefix=$STACKS_DIR/$VERSION/$CLUSTER
    make && make install
    cd ..

So now sparsehash is installed, include files in $STACKS_DIR/$VERSION/$CLUSTER/include
Use libbam.a and include files from the samtools 0.1.19 module.  They fixed a
bug in Makefile.am I reported for 1.21, so the vi workaround is no longer
necessary.

    ./configure --prefix=$STACKS_DIR/$VERSION/$CLUSTER --enable-sparsehash --with-sparsehash-include-path=$STACKS_DIR/$VERSION/$CLUSTER/include --enable-bam --with-bam-include-path=/sw/apps/bioinfo/samtools/0.1.19/src --with-bam-lib-path=/sw/apps/bioinfo/samtools/0.1.19/src

    make && make install

Files are added to $STACKS_DIR/$VERSION/$CLUSTER/bin.  Now install suggested perl
packages.  I am skipping the MySql interface packages, but will install
Spreadsheet::WriteExcel to a local directory following the script at
https://www.uppmax.uu.se/faq/installing-local-perl-packages and will add this
local directory to PERL5LIB.

    export STACKS_PERL=$STACKS_DIR/$VERSION/$CLUSTER/perl-packages
    mkdir -p $STACKS_PERL
    wget -O- http://cpanmin.us | perl - -l $STACKS_PERL App::cpanminus local::lib
    echo 'eval `perl -I $STACKS_PERL/lib/perl5 -Mlocal::lib=$STACKS_PERL`' > ./stacks_perl_profile 
    echo 'export PATH=$STACKS_PERL/bin/:$PATH' >> ./stacks_perl_profile 
    source ./stacks_perl_profile
    cpanm Spreadsheet::WriteExcel

Create mf file and have it add $STACKS_DIR/$VERSION/$CLUSTER/bin to the user PATH,
and $STACKS_PERL/lib/perl5 to PERL5LIB.

    cd $STACKS_DIR/$VERSION/
    mkdir mf
    cd mf
    cp ../../1.22/mf/1.22 1.24

No changes necessary.


Now for tintin...
-----------------

Aaaaaand now repeat for tintin.  The mf above works for tintin as well.  
Log onto tintin, and set

    CLUSTER=tintin

Then start with the above after the CLUSTER=milou line.  Do everything 
but creating the mf file.  Turns out there are fewer Perl modules installed 
on tintin, so we install a few more things.

Setting up the mf file for the module system is simple as well.

    cd /sw/mf/common/bioinfo-tools/misc/Stacks
    ln -s .Stacks $VERSION
    chgrp -h sw $VERSION
    cd /sw/mf/milou/bioinfo-tools/misc/Stacks/
    ln -s ../../../../common/bioinfo-tools/misc/Stacks/$VERSION .
    chgrp -h sw $VERSION

This time around we have to create the Stacks/ directory for the tintin 
module.

    cd /sw/mf/tintin/bioinfo-tools/misc/
    mkdir -p Stacks
    chgrp sw Stacks
    cd Stacks
    ln -s ../../../../common/bioinfo-tools/misc/Stacks/$VERSION .
    chgrp -h sw $VERSION

Be a nice sw group member.

    cd $STACKS_DIR/$VERSION
    chgrp -R sw *
    chmod -R g+w *
    find . -type d -exec chmod g+s,o+rx {} \;

