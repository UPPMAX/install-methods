skani/0.2.1
===========

<https://github.com/bluenote-1577/skani/>

Used under license:
MIT


Structure creating script (makeroom_skani_0.2.1.sh) moved to /sw/bioinfo/skani/makeroom_0.2.1.sh

LOG
---

It offers a prebuilt static executable, but notes that it also runs slow,
perhaps quite a bit slower for some tasks. So, build ourselves, using the rust
module. Build with gcc/12.3.0, and load other compression libraries just in
case.


    makeroom.sh -t skani -v 0.2.1 -c bioinfo -s alignment -w https://github.com/bluenote-1577/skani/ -l MIT -d "Fast, robust ANI and aligned fraction for (metagenomic) genomes and contigs."
    ./makeroom_skani_0.2.1.sh 
    source /sw/bioinfo/skani/SOURCEME_skani_0.2.1
    cd $SRCDIR
    ml git/2.44.0
    git clone https://github.com/bluenote-1577/skani
    cd skani
    ml rust/1.77.0
    ml gcc/12.3.0
    ml zlib/1.3
    ml bzip2/1.0.8
    ml xz/5.4.5

    cargo build --release

Test.

    ./target/release/skani dist refs/e.coli-EC590.fasta refs/e.coli-K12.fasta

    ldd ./target/release/skani

Turns out it uses liblzma from xz/5.4.5, as well as the library from gcc/12.3.0. Now unload modules to see if it stores RPATH correctly.

    ml purge
    ldd ./target/release/skani

Yep! Copy to prefix and wrap up.

    mkdir $PREFIX/bin
    cp -av ./target/release/skani $PREFIX/bin/

    cd $TOOLDIR/mf
    vi 0.2.1 

    cd $TOOLDIR

    ./skani-0.2.1_post-install.sh 
