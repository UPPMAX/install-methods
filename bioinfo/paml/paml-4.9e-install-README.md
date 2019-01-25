paml/4.9e
=========

<http://abacus.gene.ucl.ac.uk/software/paml.html>

LOG
---

    cd /sw/apps/bioinfo/paml
    VERSION=4.9e
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ..
    mkdir src
    cd src
    [[ -f paml${VERSION}.tgz ]] || wget http://abacus.gene.ucl.ac.uk/software/paml${VERSION}.tgz
    tar xzf paml${VERSION}.tgz
    cd paml${VERSION}
    cd bin
    rm -f *
    cd ../src
    module load gcc/6.3.0
    make -f Makefile
    mv baseml basemlg codeml pamp evolver yn00 chi2 ../bin

Now copy whole tree over to `$PFX`.

    cd ..
    cp -av * $PFX/

Remove source.

    cd ..
    rm -rf paml${VERSION}

We can use the mf from 4.6, which adds `$modroot/bin` to `PATH`, but also
define `PAML_ROOT` since there are other things available there.
