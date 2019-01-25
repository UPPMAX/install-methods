# IDBA-1.1.1-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    IDBA 1.1.1

DESCRIPTION
-----------

    IDBA 1.1.1

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
    VERSION=1.1.1
    CLUSTER=milou
    VERSIONDIR=$TOOL/$VERSION
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    mkdir -p $CLUSTERDIR
    cd $TOOL
    mkdir -p mf
    cd $VERSIONDIR
    mkdir -p src
    cd src
    wget http://hku-idba.googlecode.com/files/idba-${VERSION}.tar.gz
    tar xzf idba-${VERSION}.tar.gz
    cd idba-${VERSION}
    module load gcc/4.8.3
    module load build-tools
    ./configure --prefix=/sw/apps/bioinfo/IDBA/1.1.1/milou
    make

The configured install procedure is extremely limited.  There are
many files in the bin/ directory that are not configured to be installed
by default, but many users will want them.  So

    cd bin

and apply this patch, or simply use Makefile.new which is already there:

~~~~
--- Makefile    2015-02-26 15:45:57.137067342 +0100
+++ Makefile.new    2015-02-26 15:45:42.789646706 +0100
@@ -48,8 +48,7 @@
 NORMAL_UNINSTALL = :
 PRE_UNINSTALL = :
 POST_UNINSTALL = :
-bin_PROGRAMS = idba_hybrid$(EXEEXT)
-noinst_PROGRAMS = sort_reads$(EXEEXT) parallel_rna_blat$(EXEEXT) \
+bin_PROGRAMS = idba_hybrid$(EXEEXT) sort_reads$(EXEEXT) parallel_rna_blat$(EXEEXT) \
    test$(EXEEXT) print_graph$(EXEEXT) validate_rna$(EXEEXT) \
    scaffold$(EXEEXT) shuffle_reads$(EXEEXT) fa2fq$(EXEEXT) \
    validate_contigs_mummer$(EXEEXT) filter_blat$(EXEEXT) \
~~~~

    make -f Makefile.new install

Now the mf file needs these lines to load the proper GCC library:

    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/4.8.3_milou/lib64
    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/4.8.3_milou/lib

and for the tintin mf>

    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/4.8.3_tintin/lib64
    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/4.8.3_tintin/lib
