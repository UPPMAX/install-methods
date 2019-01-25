TrimGalore/0.4.4
================

<http://www.bioinformatics.babraham.ac.uk/projects/trim_galore/>

Log
---

    TOOL=/sw/apps/bioinfo/TrimGalore
    VERSION=0.4.4
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    CC=rackham
    mkdir $CC
    for C in milou irma bianca ; do rm -f $C && ln -s $CC $C; done
    mkdir src
    cd src/
    wget http://www.bioinformatics.babraham.ac.uk/projects/trim_galore/trim_galore_v${VERSION}.zip
    mkdir tmp
    cd tmp
    unzip ../trim_galore_v${VERSION}.zip 
    mv * ../../$CC/
    cd ..
    rmdir tmp

Now, change `#!/usr/bin/perl` to `#!/usr/bin/env perl`.

    cd ../$CC
    vi trim_galore 

