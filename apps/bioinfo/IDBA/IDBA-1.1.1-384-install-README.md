# IDBA-1.1.1-384-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    IDBA 1.1.1-384

DESCRIPTION
-----------

    IDBA 1.1.1-384

Attempting to build IDBA with a maximum read length of 384.

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

    Add /sw/apps/bioinfo/IDBA/1.1.1-384/$CLUSTER/bin to the user PATH, along with
    directories for GCC libraries

LOG
---

    TOOL=/sw/apps/bioinfo/IDBA
    VERSION=1.1.1-384
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

Now we need to make an edit to attempt to enable longer read lengths.  The diff of the
original vs. edited files.

    diff -p src/sequence/short_sequence.h src/sequence/short_sequence.h.new
~~~~
*** src/sequence/short_sequence.h   2015-04-08 11:12:53.927857663 +0200
--- src/sequence/short_sequence.h.new   2015-04-08 11:13:14.206922320 +0200
*************** public:
*** 99,105 ****
          return size() < seq.size();
      }

!     static const uint32_t kMaxShortSequence = 128;
      static const uint32_t kNumBytes = (kMaxShortSequence + 3) / 4 + 2;

  private:
--- 99,105 ----
          return size() < seq.size();
      }

!     static const uint32_t kMaxShortSequence = 384;
      static const uint32_t kNumBytes = (kMaxShortSequence + 3) / 4 + 2;

  private:
~~~~


    module load gcc/4.8.3
    module load build-tools
    ./configure --prefix=/sw/apps/bioinfo/IDBA/${VERSION}/$CLUSTER
    make

The configured install procedure is extremely limited.  There are
many files in the bin/ directory that are not configured to be installed
by default, but many users will want them.  So

    cd bin

and apply this patch to Makefile:

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

Then:

    cd ..
    make install

Now the mf file needs these lines to load the proper GCC library:

    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/4.8.3_milou/lib64
    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/4.8.3_milou/lib

and for the tintin mf>

    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/4.8.3_tintin/lib64
    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/4.8.3_tintin/lib

