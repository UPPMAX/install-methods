fasta/36.3.8h
=============

FASTA package of bioinformatics programs

W. R. Pearson and D. J. Lipman (1988), “Improved Tools for Biological Sequence
    Analysis”, PNAS 85:2444-2448, 
W. R. Pearson (1996) “Effective protein sequence comparison” Meth.  Enzymol. 
    266:227-258
Pearson et. al. (1997) Genomics 46:24-36

<http://faculty.virginia.edu/wrpearson/fasta/>

In the mf file, add to PATH
    $modroot/bin
    $modroot/misc
    $modroot/scripts
Add to the user MANPATH:
    $modroot/man

LOG
---

    TOOL=/sw/bioinfo/fasta
    VERSION=36.3.8h
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    PREFIX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ( test -L $CL || ln -s rackham $CL ) ; done
    mkdir src
    cd src
    wget http://faculty.virginia.edu/wrpearson/fasta/fasta36/fasta-${VERSION}.tar.gz
    tar xzf fasta-${VERSION}.tar.gz
    mv fasta-${VERSION} $PREFIX  # creates $PREFIX from the unpacked tarball
    cd $PREFIX
    cd src
    make -f ../make/Makefile.linux64_sse2 all

Test following README.

    ../bin/fasta36 -q ../seq/mgstm1.aa ../seq/prot_test.lseg

Set execute permissions for all scripts and change `#!` lines for some python ones.
Also enable the man pages.

    cd $PREFIX/scripts
    chmod +x *.pl *.py
    sed -i 's,^#!/usr/bin/python.*$,#!/usr/bin/env python,' *.py

    cd $PREFIX
    mkdir man
    cd man
    ln -s ../doc man1

Use the mf from the initial version.
