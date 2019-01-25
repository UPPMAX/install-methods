# Stacks-1.40-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

Stacks 1.40

DESCRIPTION
-----------

Stacks short-read variant pipeline

WEBSITE
-------

    http://catchenlab.life.illinois.edu/stacks/

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

First, load new build tools and GCC.  This MUST be done, we get a
compilation death on tintin without it, and it would not be right to
compile with different versions on both systems.

    module load build-tools gcc/4.8.3

    CLUSTER=milou
    STACKS_DIR=/sw/apps/bioinfo/Stacks
    VERSION=1.40
    mkdir -p $STACKS_DIR/$VERSION/$CLUSTER
    cd $STACKS_DIR/$VERSION/
    wget http://catchenlab.life.illinois.edu/stacks/source/stacks-${VERSION}.tar.gz
    tar xvzf stacks-${VERSION}.tar.gz
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
Use libbam.a and include files from the samtools 0.1.19 module.

    ./configure --prefix=$STACKS_DIR/$VERSION/$CLUSTER --enable-sparsehash --with-sparsehash-include-path=$STACKS_DIR/$VERSION/$CLUSTER/include --enable-bam --with-bam-include-path=/sw/apps/bioinfo/samtools/0.1.19/src --with-bam-lib-path=/sw/apps/bioinfo/samtools/0.1.19/src

    make && make install

Files are added to $STACKS_DIR/$VERSION/$CLUSTER/bin.  Now install suggested
perl packages.  I am installing the MySql interface packages and
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
    cpanm DBI DBD::mysql

Create mf file and have it add $STACKS_DIR/$VERSION/$CLUSTER/bin to the user
PATH, and $STACKS_PERL/lib/perl5 to PERL5LIB.  I am removing the additions
to LD_LIBRARY_PATH for gcc/4.8.3 libraries.

    cd $STACKS_DIR
    mkdir -p mf
    cd mf
    cp 1.35 1.40

Stop adding `/sw/comp/gcc/4.8.3_$Cluster/lib64` and
`/sw/comp/gcc/4.8.3_$Cluster/lib` to LD_LIBRARY_PATH.



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
    cd Stacks
    ln -s ../../../../common/bioinfo-tools/misc/Stacks/$VERSION .
    chgrp -h sw $VERSION

Be a nice sw group member.

    cd $STACKS_DIR/$VERSION
    chgrp -hR sw *
    chmod -R g+w *
    find . -type d -exec chmod g+s,o+rX {} \;

