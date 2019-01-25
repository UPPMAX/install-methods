StringTie 1.2.0
===============

Transcript assembly and quantification for RNA-Seq

<https://ccb.jhu.edu/software/stringtie/>

Log
---

    TOOLDIR=/sw/apps/bioinfo/StringTie
    VERSION=1.3.3
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    CLUSTERDIR=$TOOLDIR/$VERSION/$CLUSTER
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    mkdir $VERSION
    mkdir -p mf
    cd $VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PREFIX=$PWD
    cd ../src
    [[ -f stringtie-${VERSION}.tar.gz ]] || wget http://ccb.jhu.edu/software/stringtie/dl/stringtie-${VERSION}.tar.gz
    tar xzf stringtie-${VERSION}.tar.gz 
    mv stringtie-${VERSION} stringtie-${VERSION}_${CLUSTER}
    cd stringtie-${VERSION}_${CLUSTER}

The README makes it seem simple to compile, and it is.

    module load gcc/6.3.0
    make release

Make sure the link line includes `-lpthreads` so we have threading capability.

Does it have any weird dynamic library dependencies (it shouldn't).

    ./stringtie
    ldd stringtie

Stage for the module.

    cp stringtie $PREFIX/

In the mf, simply add `$VERSIONDIR` to `PATH`.

Repeat this for tintin.

