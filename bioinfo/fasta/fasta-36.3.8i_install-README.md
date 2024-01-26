fasta/36.3.8i
=============

W. R. Pearson and D. J. Lipman (1988), "Improved Tools for Biological Sequence
    Analysis", PNAS 85:2444-2448, 
W. R. Pearson (1996) "Effective protein sequence comparison", Meth.  Enzymol. 
    266:227-258
Pearson et. al. (1997) Genomics 46:24-36


<https://fasta.bioch.virginia.edu/wrpearson/fasta/>

Used under license:
Apache 2.0
<https://fasta.bioch.virginia.edu/wrpearson/fasta/readme.COPYRIGHT>

Structure creating script (makeroom_fasta_36.3.8i.sh) moved to /sw/bioinfo/fasta/makeroom_36.3.8i.sh

LOG
---

    makeroom.sh "-f" "-t" "fasta" "-v" "36.3.8i" "-c" "bioinfo" "-s" "alignment" "-w" "https://fasta.bioch.virginia.edu/wrpearson/fasta/" "-d" "protein and DNA sequence similarity searching and alignment programs" "-l" "Apache 2.0" "-L" "https://fasta.bioch.virginia.edu/wrpearson/fasta/readme.COPYRIGHT"
    ./makeroom_fasta_36.3.8i.sh

    source /sw/bioinfo/fasta/SOURCEME_fasta_36.3.8i && cd $SRCDIR

    wget https://fasta.bioch.virginia.edu/wrpearson/fasta/fasta36/fasta-${VERSION}.tar.gz
    tar xf fasta-${VERSION}.tar.gz
    rmdir $PREFIX
    mv fasta-${VERSION} $PREFIX  # creates $PREFIX from the unpacked tarball
    cd $PREFIX
    cd src
    make -f ../make/Makefile.linux64_sse2 all

Test following README.

    ../bin/fasta36 -q ../seq/mgstm1.aa ../seq/prot_test.lseg

All the python and perl scripts under `scripts/` now use env, good.

    cd $PREFIX/scripts
    chmod +x *.pl *.py *.sh

Change these to look for blast commands in the PATH. Remove all uses of
`BLAST_PATH`, some of these even refer to scripts in this package.

    vi *.sh

    cd $PREFIX
    mkdir man
    cd man
    ln -s ../doc man1

The perl scripts under `misc/` need changing.

    cd $PREFIX/misc
    sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' *.pl


Document the PDF doc for the package when updating the mf.
