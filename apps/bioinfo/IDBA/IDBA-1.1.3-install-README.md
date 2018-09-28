# IDBA-1.1.3-install-README.md, douglas.scofield@ebc.uu.se, linus.nilsson@uppmax.uu.se

TITLE
=====

    IDBA 1.1.3

DESCRIPTION
-----------

    IDBA 1.1.3

    Peng, Y., et al. (2010) IDBA- A Practical Iterative de Bruijn Graph De Novo
    Assembler. RECOMB. Lisbon.

    Peng, Y., et al. (2012) IDBA-UD: a de novo assembler for single-cell and
    metagenomic sequencing data with highly uneven depth, Bioinformatics, 28,
    1420-1428.


WEBSITE
-------

    http://i.cs.hku.hk/~alse/hkubrg/projects/idba_ud/index.html

MODULE REQUIREMENTS
-------------------

    Simply add /sw/apps/bioinfo/IDBA/1.1.1/$CLUSTER/bin to the user PATH

LOG
---
    TOOL=/sw/apps/bioinfo/IDBA
    VERSION=1.1.3
    CLUSTER=$CLUSTER
    VERSIONDIR=$TOOL/$VERSION
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    mkdir -p mf
    cd $VERSIONDIR
    mkdir -p src
    cd src
    wget https://github.com/loneknightpy/idba/archive/${VERSION}.tar.gz
    tar xzf ${VERSION}.tar.gz
    cd idba-${VERSION}
    module load build-tools
    aclocal
    autoconf
    automake --add-missing
    ./configure --prefix=$TOOL/$VERSION/$CLUSTER
    patch bin/Makefile ../../../1.1.3_patch
    make clean 
    make -j8
    make install
    cd ../
    rm -rf idba-${VERSION}
    cd $TOOL/$VERSION
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done
    chgrp -R sw $TOOL/$VERSION
    chmod -R g+rwx $TOOL/$VERSION
    

The configured install procedure is extremely limited.  There are
many files in the bin/ directory that are not configured to be installed
by default, but many users will want them.  So the patch step above modifies the bin_PROGRAMS
variable in the resulting bin/Makefile
