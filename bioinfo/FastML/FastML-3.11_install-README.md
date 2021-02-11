FastML/3.11
========================

<http://fastml.tau.ac.il>

Used under license:
GPL v2+

LOG
---

    TOOL=FastML
    VERSION=3.11
    cd /sw/bioinfo/FastML
    makeroom.sh -f -t $TOOL -v $VERSION -w http://fastml.tau.ac.il -l "GPL v2+" -d "tool for the reconstruction of ancestral sequences based on the phylogenetic relations between homologous sequences" -s phylogeny
    ./makeroom_FastML_3.11.sh 
    source SOURCEME_FastML_3.11 
    cd $SRCDIR
    wget http://fastml.tau.ac.il/source/FastML.v3.11.tgz
    tar xzf FastML.v3.11.tgz 
    cd FastML.v3.11/
    mkdir bin
    module load gcc/9.3.0
    make
    make install

Now add appropriate #! lines to scripts

    cd www/fastml
    vi *.pl

Add #!/usr/bin/env perl

    vi *.py

Modify to be #!/usr/bin/env python

Replace $PREFIX with this directory

    cd ../../..
    rmdir $PREFIX
    mv FastML.v3.11 $PREFIX

Add $modroot/bin and $modroot/ww/fastml to PATH in the mf file.
Load newer perl and bioperl, and newer raxml.

