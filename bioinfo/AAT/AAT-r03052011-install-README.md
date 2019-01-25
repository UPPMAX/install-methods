AAT/r03052011
=============

AAT Analysis and Annotation Tool packag

Huang X, Adams MD, Zhou H, Kerlavage, AR.  1997.  A for analyzing and annotating
genomic sequences.  Genomics 46:37-45. http://aatpackage.sourceforge.net/AAT.pdf

<http://aatpackage.sourceforge.net/>


LOG
---

    TOOL=/sw/apps/bioinfo/AAT
    VERSION=r03052011
    CLUSTER=milou
    CLUSTERDIR=$TOOL/$VERSION/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL/$VERSION
    mkdir mf src
    cd src
    wget http://sourceforge.net/projects/aatpackage/files/latest/download?source=files
    tar xvzf AATpackage-r03052011.tgz
    cd AATpackage-r03052011/
    ./configure --prefix="/sw/apps/bioinfo/AAT/r03052011/milou"
    make && make install
    cd bin
    cp AAT.pl extCollapse.pl ../../../milou/bin/
    cd matrices
    cp BS ../../../milou/bin/
    chmod 664 ../../../milou/bin/BS

Steal an mf from another project, we need to add $CLUSTERDIR/bin to PATH, and
create the environment variable AATPATH to contain $CLUSTERDIR/bin, this is used
by the AAT.pl script

    cd ../mf
    # etc...

For the mf file, add /sw/apps/bioinfo/AAT/r03052011/milou/bin to the user's PATH.
