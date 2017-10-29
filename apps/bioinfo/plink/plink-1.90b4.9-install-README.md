plink/1.90b4.9
===============

With plink, start to make the beta number be part of the version we label it with.

Use the precompiled version for 64-bit linux.

<https://www.cog-genomics.org/plink2>

LOG
---

    TOOL=/sw/apps/bioinfo/plink
    VERSION=1.90b4.9
    CLUSTER=rackham
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    for C in milou bianca irma ; do rm -f $C && ln -s rackham $C; done
    cd src
    wget https://www.cog-genomics.org/static/bin/plink171013/plink_linux_x86_64.zip
    cd ../$CLUSTER
    unzip ../src/plink_linux_x86_64.zip 
