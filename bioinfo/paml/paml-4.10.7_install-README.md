paml/4.10.7
========================

<http://abacus.gene.ucl.ac.uk/software/paml.html>

Used under license:
other


Structure creating script (makeroom_paml_4.10.7.sh) moved to /sw/bioinfo/paml/makeroom_4.10.7.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "paml" "-v" "4.10.7" "-w" "http://abacus.gene.ucl.ac.uk/software/paml.html" "-c" "bioinfo" "-l" "other" "-d" "PAML is a package of programs for phylogenetic analyses of DNA or protein sequences using maximum likelihood." "-x" "INSTALL" "-f"
    ./makeroom_paml_4.10.7.sh
    source /sw/bioinfo/paml/SOURCEME_paml_4.10.7 && cd $SRCDIR

    wget https://github.com/abacus-gene/paml/archive/refs/tags/4.10.7.tar.gz
    tar xzf paml${VERSION}.tar.gz
    cd paml${VERSION}
    cd src
    
    module load gcc/12.3.0

Modify in Makefile compiler to explicitly use gcc. Then:

    make -f Makefile
    
    mkdir ../bin
    mv baseml basemlg codeml pamp evolver yn00 chi2 ../bin
    cd ..
    #test
    ls -lF bin/
    bin/baseml

Now copy whole tree over to `$PREFIX`.

    cp -av * $PREFIX/

Remove source.

    cd ..
    rm -rf paml${VERSION}

We can use the mf from 4.6, which adds `$modroot/bin` to `PATH`, but also
define `PAML_ROOT` since there are other things available there.

