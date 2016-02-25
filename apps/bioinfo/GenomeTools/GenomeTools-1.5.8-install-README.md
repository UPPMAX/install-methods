# GenomeTools-1.5.8-install-README.md

The versatile open source genome analysis software, based on `libgenometools` C
library.

<http://genometools.org/>

Log
---

    cd /sw/apps/bioinfo/
    cd GenomeTools/
    cd 1.3.5_kalkyl/

    cat HOWTOINSTALL 

Make sure 64-bit is used for compilation, I am guessing we will not need to be
explicit about those as suggested for 1.3.5.  I also do not know why `cairo=no`
and `curses=no` was used while compiling 1.3.5, but I am ignoring those.

    cd ..
    mkdir 1.5.8
    mkdir mf
    cd 1.5.8/
    mkdir milou src
    cd milou
    P=$PWD

Sets prefix directory ofr installation.

    ln -s ./milou nestor
    ln -s ./milou tintin
    ln -s ./milou halvan
    cd src
    wget http://genometools.org/pub/genometools-1.5.8.tar.gz
    tar xzf genometools-1.5.8.tar.gz 
    cd genometools-1.5.8/
    module load gcc/4.9.2

Check compilation lines, make sure 64-bit is clear.  Does it check x86_64?

    view Makefile
    make -n prefix=$P

    make prefix=$P
    make prefix=$P install

Set up mf, start with previous and update for BioPerl and Perl.

    cd mf
    cp /sw/mf/common/bioinfo-tools/misc/genometools/1.3.5 1.5.8

