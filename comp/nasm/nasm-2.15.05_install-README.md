nasm/2.15.05
========================

<https://www.nasm.us/>

Used under license:
BSD 2-clause
<http://opensource.org/licenses/BSD-2-Clause>

Structure creating script (makeroom_nasm_2.15.05.sh) moved to /sw/comp/nasm/makeroom_2.15.05.sh

LOG
---

    makeroom.sh -f -c comp -t nasm -v 2.15.05 -l "BSD 2-clause" -L http://opensource.org/licenses/BSD-2-Clause -d "Netwide Assembler (NASM), an asssembler for the x86 CPU architecture portable to nearly every modern platform, and with code generation for many platforms old and new" -w https://www.nasm.us/
    ./makeroom_nasm_2.15.05.sh 
    source /sw/comp/nasm/SOURCEME_nasm_2.15.05
    cd $SRCDIR
    ml gcc/9.3.0
    wget https://www.nasm.us/pub/nasm/releasebuilds/2.15.05/nasm-2.15.05.tar.gz
    tar xf nasm-2.15.05.tar.gz 
    cd nasm-2.15.05/
    ./configure --prefix=$PREFIX
    make
    make install

Directories are $PREFIX/bin and $PREFIX/share/man, so edit $TOOLDIR/mf/$VERSION to reflect this.  Then:

    cd $TOOLDIR
    ./nasm-2.15.05_post-install.sh


