htslib 1.3
============

    VERSION=1.3

fetch from <https://github.com/samtools/htslib>

    module load gcc/4.9.2
    autoconf

Got error so reran autoconf, no error.

    ./configure --prefix=/sw/apps/bioinfo/htslib/$VERSION/$CLUSTER
    make && make install

The mf file should set several variables so this can be properly compiled against.

    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/4.9.2_$Cluster/lib
    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/4.9.2_$Cluster/lib64
    prepend-path    CPATH             $modroot/include
    prepend-path    LIBRARY_PATH      $modroot/lib
    prepend-path    LD_LIBRARY_PATH   $modroot/lib
    prepend-path    LD_RUN_PATH       $modroot/lib
    prepend-path    PKG_CONFIG_PATH   $modroot/lib/pkgconfig
    prepend-path    MANPATH           $modroot/share/man
    prepend-path    PATH              $modroot/bin
