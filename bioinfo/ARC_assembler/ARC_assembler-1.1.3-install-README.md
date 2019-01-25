# ARC_assembler-1.1.3-install-README.md

TITLE
=====

    ARC assembler 1.1.3

DESCRIPTION
-----------

    ARC: Assembly by Reduced Complexity

    No publication yet apparently, see website for more.

WEBSITE
-------

    http://ibest.github.io/ARC/

MODULE REQUIREMENTS
-------------------

    BioPython
    Bowtie2 or BLAT (BLAT required FastQ patch)
    Newbler or Spades

Newbler is 'older' and though it should work, I expect Spades to be more
efficient... we will see.  Blat requires a patch to accept FastQ input, and I
do not want to build a custon Blat so I am going with bowtie2.  I am choosing
these modules.

    python/2.7.9
    biopython/1.65
    bowtie2/2.2.3
    spades/3.5.0

The biopython/1.64 module required python/2.7.6, which is broken as far as
using sqlite3 is concerned, at least with respect to ARC_assembler
expectations.  So, I build a new biopython/1.65 module that loads python/2.7.9,
which is not broken in the same way.


LOG
---

    TOOL=/sw/apps/bioinfo/ARC_assembler
    VERSION=1.1.3
    TOOLDIR=$TOOL/$VERSION
    CLUSTER=milou
    CLUSTERDIR=$TOOLDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    mkdir -p $CLUSTERDIR/python_packages
    cd $TOOL
    mkdir -p mf
    cd $TOOLDIR
    mkdir -s src
    cd src
    git clone git://github.com/ibest/ARC.git
    cd ARC
    module load python/2.7.9
    python setup.py install --prefix=$CLUSTERDIR/python_packages

The mf file is completed, it sets prepends to PATH and PYTHONPATH so everything
can be found, and loads the modules listed above.

After all this, I tested by doing

    module load bioinfo-tools ARC_assembler
    cd $TOOLDIR/src/ARC/test_data
    ARC

Then clean up afterward.

    ./clean
