rvtests/2.0.6
========================

<https://github.com/zhanxw/rvtests>

LOG
---

I did..

    TOOL=rvtests
    VERSION=2.0.6
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/bioinfo/$TOOL/$VERSION
    /home/jonass/uppmax/bin/makeroom.sh

NOTE: I use my own script which is located at /sw/apps/bioinfo/rvtests/makeroom_2.0.6.sh

    ./makeroom_rvtests_2.0.6.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    wget https://github.com/zhanxw/rvtests/releases/download/v2.0.6/rvtests-20171010-0cd5f3-linux64-static.tar.gz
    tar xvf rvtests-20171010-0cd5f3-linux64-static.tar.gz
    cd rvtests/executables
    mkdir ../../../rackham/bin/
    cp -av * ../../../rackham/bin/

(Doug here) The attempt to build from source ran into odd problems:

    g++ -o /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/executable/rvtest Main.o DataConsolidator.o ModelFitter.o TabixUtil.o ModelManager.o ModelParser.o Model.o GenotypeExtractor.o VCFGenotypeExtractor.o BGenGenotypeExtractor.o KGGGenotypeExtractor.o DataLoader.o GenotypeCounter.o SingleDummy.o -O2 -DNDEBUG -D__STDC_LIMIT_MACROS -std=c++0x -Wall -Wno-unused-function -fopenmp -DGIT_VERSION="\"a6f79347c6eaf1a8fa7950a42a2be2df32747128\"" -D_USE_KNETFILE -static /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/regression/lib-regression.a /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/libVcf/lib-vcf.a /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/libBgen/lib-bgen.a /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/base/lib-base.a /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/libsrc/lib-goncalo.a /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/third/samtools/bcftools/libbcf.a /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/third/samtools/libbam.a /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/third/tabix/libtabix.a /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/third/pcre/lib/libpcreposix.a /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/third/pcre/lib/libpcre.a /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/third/gsl/lib/libgsl.a /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/third/zlib/libz.a /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/third/bzip2/libbz2.a /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/third/nlopt/lib/libnlopt.a /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/third/sqlite/lib/libsqlite3.a /sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/third/zstd/lib/libzstd.a  -lm -lpthread
    /usr/bin/ld: cannot find -lpthread
    /usr/bin/ld: cannot find -lm
    /usr/bin/ld: cannot find -ldl
    /usr/bin/ld: cannot find -lpthread
    /usr/bin/ld: cannot find -lc
    collect2: error: ld returned 1 exit status
    make[1]: *** [/sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/executable/rvtest] Error 1
    make[1]: Leaving directory `/sw/apps/bioinfo/rvtests/2.0.6/src/rvtests/src'
    make: *** [release] Error 2

This is because of the `-static` flag on the link line.  We don't have static
versions of `libpthread`, `libm`, `libdl`, nor `libc`.  We don't absolutely
need to build this tool from source, but I have run into this problem before so
requested the installation of the `glibc-static` RPM, which provides them all.
