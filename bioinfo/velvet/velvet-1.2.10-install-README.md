velvet/1.2.10
=============

Velvet assembler, but max kmer 64

<https://www.ebi.ac.uk/~zerbino/velvet/>

Compile with OPENMP, and provide three versions:

* default
* with long sequences set
* with long sequences set and big assembly set

Add message to module load.


LOG
---


    TOOLVERSION=1.2.10
    VERSION=${TOOLVERSION}
    TOOL=/sw/apps/bioinfo/velvet
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    mkdir bin
    cd ../src
    [[ -f velvet_${TOOLVERSION}.tgz ]] || wget https://www.ebi.ac.uk/~zerbino/velvet/velvet_${TOOLVERSION}.tgz
    tar xzf velvet_${TOOLVERSION}.tgz
    cd velvet_${TOOLVERSION}
    make MAXKMERLENGTH=64 OPENMP=1
    cp -av velvet? $PFX/bin/
    make clean
    make MAXKMERLENGTH=64 OPENMP=1 LONGSEQUENCES=1
    for F in velvet? ; do cp -av $F $PFX/bin/${F}_longsequences; done
    make clean
    make MAXKMERLENGTH=64 OPENMP=1 LONGSEQUENCES=1 BIGASSEMBLY=1
    for F in velvet? ; do cp -av $F $PFX/bin/${F}_longsequences_bigassembly; done

    cp -av contrib $PFX/

Remove source tree.

    cd ..
    rm -rf velvet_${TOOLVERSION}

