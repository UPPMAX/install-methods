SHAPEIT v2.r904
===============

Haplotype phasing.

<https://mathgen.stats.ox.ac.uk/genetics_software/shapeit/shapeit.html>

LOG
---

    VERSION=v2.r904
    cd /sw/bioinfo/
    mkdir SHAPEIT
    cd SHAPEIT/
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget https://mathgen.stats.ox.ac.uk/genetics_software/shapeit/shapeit.${VERSION}.glibcv2.17.linux.tar.gz
    tar xzf shapeit.${VERSION}.glibcv2.17.linux.tar.gz
    cd shapeit.${VERSION/r/}.3.10.0-693.11.6.el7.x86_64
    cp -av LICENCE bin example $PFX/

Add their `extractPIRs` tool as well.

    cd /sw/bioinfo/SHAPEIT/$VERSION
    cd src/
    wget https://mathgen.stats.ox.ac.uk/genetics_software/shapeit/files/extractPIRs.v1.r68.x86_64.tgz
    tar xzf extractPIRs.v1.r68.x86_64.tgz 
    cd extractPIRs.v1.r68.x86_64
    mv -v extractPIRs extractPIRs.v1.r68.x86_64
    ln -s extractPIRs.v1.r68.x86_64 extractPIRs
    cp -av extractPIRs* $PFX/bin/

Its `example/` directory duplicates files in the SHAPEIT bundle.


Use mf from v2.837.


