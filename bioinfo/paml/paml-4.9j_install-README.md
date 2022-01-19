paml/4.9j
========================

<http://abacus.gene.ucl.ac.uk/software/paml.html>

Used under license:
other


Structure creating script (makeroom_paml_4.9j.sh) moved to /sw/bioinfo/paml/makeroom_4.9j.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "paml" "-v" "4.9j" "-w" "http://abacus.gene.ucl.ac.uk/software/paml.html" "-c" "bioinfo" "-l" "other" "-d" "PAML is a package of programs for phylogenetic analyses of DNA or protein sequences using maximum likelihood." "-x" "INSTALL" "-f"
    ./makeroom_paml_4.9j.sh

    cd $SRCDIR
    [[ -f paml${VERSION}.tgz ]] || wget http://abacus.gene.ucl.ac.uk/software/paml${VERSION}.tgz
    tar xzf paml${VERSION}.tgz
    cd paml${VERSION}
    cd bin
    rm -f *
    cd ../src
    
    module load gcc/9.3.0
    make -f Makefile
    mv baseml basemlg codeml pamp evolver yn00 chi2 mcmctree infinitesites ../bin

Now copy whole tree over to `$PREFIX`.

    cd ..
    cp -av * $PREFIX/

Remove source.

    cd ..
    rm -rf paml${VERSION}

We can use the mf from 4.6, which adds `$modroot/bin` to `PATH`, but also
define `PAML_ROOT` since there are other things available there.

