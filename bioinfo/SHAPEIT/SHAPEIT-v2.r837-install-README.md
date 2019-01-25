SHAPEIT v2.r837
===============

Haplotype phasing.

<https://mathgen.stats.ox.ac.uk/genetics_software/shapeit/shapeit.html>

LOG
---

    VERSION=v2.r837
    cd /sw/apps/bioinfo/
    mkdir SHAPEIT
    cd SHAPEIT/
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy; do ln -s $CLUSTER $CK ; done
    mkdir src
    cd src
    wget https://mathgen.stats.ox.ac.uk/genetics_software/shapeit/shapeit.${VERSION}.GLIBCv2.12.Linux.static.tgz
    tar xzf shapeit.${VERSION}.GLIBCv2.12.Linux.static.tgz 
    cp -av LICENCE bin example $PFX/
    cd ..

Use mf from IMPUTE2 and add message about availability of example data.

    cd ..
    mkdir mf
    cd mf
    cp ../../IMPUTE2/mf/2.3.2 v2.r837
    vi v2.r837 


### 2018/11/27

Add their `extractPIRs` tool as well.

    cd /sw/apps/bioinfo/SHAPEIT/$VERSION
    cd src/
    wget https://mathgen.stats.ox.ac.uk/genetics_software/shapeit/files/extractPIRs.v1.r68.x86_64.tgz
    tar xzf extractPIRs.v1.r68.x86_64.tgz 
    cd extractPIRs.v1.r68.x86_64
    cp -av extractPIRs $PFX/bin/
    cd ..
    rm -rf extractPIRs.v1.r68.x86_64

The `example/` directory duplicates files in the SHAPEIT bundle.
