FastTree/2.1.10
===============

Use the precompiled executables.

    VERSION=2.1.10
    cd /sw/apps/bioinfo/
    mkdir FastTree
    cd FastTree
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir rackham
    PFX=$PWD/rackham
    for CL in milou bianca irma ; do ln -s rackham $CL; done
    mkdir src
    cd src
    wget http://www.microbesonline.org/fasttree/FastTree
    wget http://www.microbesonline.org/fasttree/FastTreeDbl
    wget http://www.microbesonline.org/fasttree/FastTreeMP
    chmod +x  FastTree FastTreeDbl FastTreeMP
    cp -av FastTree FastTreeDbl FastTreeMP $PFX/

Update the mf file from 2.1.8 to incluce FastTreeDbl.
