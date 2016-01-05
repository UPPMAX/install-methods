StringTie 1.2.0
===============

Transcript assembly and quantification for RNA-Seq

<https://ccb.jhu.edu/software/stringtie/>

Log
---

    TOOLDIR=/sw/apps/bioinfo/StringTie
    VERSION=1.2.0
    CLUSTER=milou
    CLUSTERDIR=$TOOLDIR/$VERSION/$CLUSTER
    mkdir -p $TOOLDIR
    cd $TOOLDIR
    mkdir $VERSION
    mkdir -p mf
    cd $VERSION
    mkdir src $CLUSTER
    cd src
    wget http://ccb.jhu.edu/software/stringtie/dl/stringtie-${VERSION}.tar.gz
    tar xzf stringtie-${VERSION}.tar.gz 
    cd stringtie-${VERSION}/

The README makes it seem simple to compile, and it is.

    module load gcc/4.9.2
    make release

Make sure the link line includes -lpthreads so we have threading capability.

Does it have any weird dynamic library dependencies (it shouldn't).

    ./stringtie
    ldd stringtie

Stage for the module.

    cp stringtie ../../milou/

In the mf, simply add $VERSIONDIR to the PATH.

Repeat this for tintin.

