TrimGalore/0.4.4
================

<http://www.bioinformatics.babraham.ac.uk/projects/trim_galore/>

Log
---

    TOOL=/sw/bioinfo/TrimGalore
    VERSION=0.6.1
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    for CL in irma bianca snowy ; do ln -s $CLUSTER $CL; done
    mkdir src
    cd src/
    wget https://github.com/FelixKrueger/TrimGalore/archive/${VERSION}.zip
    mkdir tmp
    cd tmp
    unzip ../${VERSION}.zip 
    cd TrimGalore-${VERSION}
    mv * $PFX/
    cd ../..
    rm -rf tmp

Now, change `#!/usr/bin/perl` to `#!/usr/bin/env perl`.

    cd $PFX
    sed -i -e 's,^#!/usr/bin/perl,#!/usr/bin/env perl,' trim_galore

