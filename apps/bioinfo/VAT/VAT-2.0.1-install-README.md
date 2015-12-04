VAT 2.0.1
=========

VAT 2.0.1 - Variant Annotation Tool


http://vat.gersteinlab.org/index.php


    cd /sw/apps/bioinfo
    mkdir VAT
    mkdir 2.0.1 mf
    cd 2.0.1
    mkdir milou tintin src
    ln -s ./milou halvan
    ln -s ./milou nestor
    cd src
    wget https://s3.amazonaws.com/vat-releases/vat-2.0.1.tar.gz
    tar xzf vat-2.0.1.tar.gz
    cd vat-2.0.1/

There are several prereqs, some of which are required of a web instance or
Amazon Web Services (libs3) are being used.  We will not enable those.  It
also needs GSN, GD, tabix, BlatSuite, libbios, and vcftools.  We have some
available as modules or by default.  Figure out what we are missing.

    ./configure --prefix=/sw/apps/bioinfo/VAT/2.0.1/milou

Looks like libbios and GSL, along with BLAT.  Might as well also load VCF tools.

    module load gsl/1.16
    module load tabix/0.2.6
    module load blat/34
    module load vcftools/0.1.12

Get libbios, build and install it locally.

    wget http://homes.gersteinlab.org/people/lh372/VAT/libbios-1.0.0.tar.gz
    tar xvzf libbios-1.0.0.tar.gz 
    cd libbios-1.0.0/
    ./configure --prefix=/sw/apps/bioinfo/VAT/2.0.1/milou
    make
    make install

Set variables so libbios can be found during configure.

    cd ../vat-2.0.1/
    export CPPFLAGS="-I/sw/apps/bioinfo/VAT/2.0.1/milou/include"
    export LDFLAGS="-L/sw/apps/bioinfo/VAT/2.0.1/milou/lib"
    ./configure --prefix=/sw/apps/bioinfo/VAT/2.0.1/milou
    make
    make install

This installation automatically copies default.vatrc to $HOME/.vatrc.  This is
not acceptable so we will issue a message during module load.  See the mf file
for the way I have chosen to handle this.

Now for tintin.

    cd /sw/apps/bioinfo/VAT/2.0.1/src/
    rm -rf libbios-1.0.0
    tar xzf libbios-1.0.0.tar.gz
    cd libbios-1.0.0
    ./configure --prefix=/sw/apps/bioinfo/VAT/2.0.1/tintin
    make
    make install
    cd ..
    rm -rf vat-2.0.1
    tar xzf vat-2.0.1.tar.gz
    cd vat-2.0.1/
    export CPPFLAGS="-I/sw/apps/bioinfo/VAT/2.0.1/tintin/include"
    export LDFLAGS="-L/sw/apps/bioinfo/VAT/2.0.1/tintin/lib"
    ./configure --prefix=/sw/apps/bioinfo/VAT/2.0.1/tintin
    make
    make install
