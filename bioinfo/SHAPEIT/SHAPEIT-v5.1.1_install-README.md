SHAPEIT/v5.1.1
========================

<http://>

Used under license:



Structure creating script (makeroom_SHAPEIT_v5.1.1.sh) moved to /sw/bioinfo/SHAPEIT/makeroom_v5.1.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "SHAPEIT" "-v" "v5.1.1" "-f"
    ./makeroom_SHAPEIT_v5.1.1.sh

    cd $SRCDIR

These are all directly downloaded, statically compiled binaries.
The tarballs under the release tag are all images, it appears.

    wget https://github.com/odelaneau/shapeit5/releases/download/v5.1.1/ligate_static
    wget https://github.com/odelaneau/shapeit5/releases/download/v5.1.1/phase_common_static
    wget https://github.com/odelaneau/shapeit5/releases/download/v5.1.1/phase_rare_static
    wget https://github.com/odelaneau/shapeit5/releases/download/v5.1.1/switch_static

Check each, then copy to the PREFIX and create unversioned symlinks.

    file *
    chmod +x *

    ./ligate_static
    ./phase_common_static
    ./phase_rare_static
    ./switch_static

    cp -av * $PREFIX
    cd $PREFIX




SHAPEIT/v4.2.2
==============

<https://github.com/odelaneau/shapeit4>

Used under license:
MIT

Structure creating script (makeroom_SHAPEIT_v4.2.2.sh) moved to /sw/bioinfo/SHAPEIT/makeroom_v4.2.2.sh


LOG
---

Build from tagged github archive.  It needs some rework in the makefile

    TOOL=SHAPEIT
    VERSION=v4.2.2
    cd /sw/bioinfo/SHAPEIT/
    makeroom.sh -f -t $TOOL -v $VERSION -l MIT -w https://github.com/odelaneau/shapeit4 -d "fast and accurate method for estimation of haplotypes (aka phasing) for SNP array and sequencing data; version 4 is a refactored and improved version of the SHAPEIT algorithm with multiple key additional features"
    ./makeroom_SHAPEIT_v4.2.2.sh 
    source /sw/bioinfo/SHAPEIT/SOURCEME_SHAPEIT_v4.2.2 
    cd $SRCDIR
    wget https://github.com/odelaneau/shapeit4/archive/v4.2.2.tar.gz
    tar xf v4.2.2.tar.gz 
    cd shapeit4-4.2.2/

Load the modules required for building

    module load gcc/12.3.0
    module load binutils/2.41
    module load boost/1.83.0-gcc12.3.0
    module load libcurl/8.4.0
    module load zlib/1.2.12
    module load bzip2/1.0.8
    module load xz/5.2.6
    module load bioinfo-tools htslib/1.17

Now edit the makefile. First create an 'orig' tree for comparison.

    cd $SRCDIR
    tar xf v4.2.2.tar.gz -C shapeit4-4.2.2_orig --strip-components 1

Now edit the makefile. I am adding cluster-specific setting of compile
arguments, which provides little just now.  This is a `diff` of the original
tree and the modified tree.  Only `makefile` is modified.  We use `HTSLIB_ROOT`
and `BOOST_ROOT`, and `-march=native`, and the additional `-ldl` library.

    5,6c5,6
    < HTSLIB_INC=$(HOME)/Tools/htslib-1.11
    < HTSLIB_LIB=$(HOME)/Tools/htslib-1.11/libhts.a
    ---
    > HTSLIB_INC=$(HTSLIB_ROOT)/include/htslib
    > HTSLIB_LIB=$(HTSLIB_ROOT)/lib/libhts.a
    9,11c9,11
    < BOOST_INC=/usr/include
    < BOOST_LIB_IO=/usr/lib/x86_64-linux-gnu/libboost_iostreams.a
    < BOOST_LIB_PO=/usr/lib/x86_64-linux-gnu/libboost_program_options.a
    ---
    > BOOST_INC=$(BOOST_ROOT)/include
    > BOOST_LIB_IO=$(BOOST_ROOT)/lib/libboost_iostreams.a
    > BOOST_LIB_PO=$(BOOST_ROOT)/lib/libboost_program_options.a
    25c25,35
    < #CXXFLAG=-O3 -march=native
    ---
    > ifeq ($(CLUSTER),rackham)
    > 	CXXFLAG=-O3 -march=native
    > else ifeq ($(CLUSTER),snowy)
    > 	CXXFLAG=-O3 -march=native
    > else ifeq ($(CLUSTER),bianca)
    > 	CXXFLAG=-O3 -march=native
    > else ifeq ($(CLUSTER),miarka)
    > 	CXXFLAG=-O3 -march=native
    > else
    > 	CXXFLAG=-O3
    > endif
    28c38
    < CXXFLAG=-O3 -mavx2 -mfma 
    ---
    > #CXXFLAG=-O3 -mavx2 -mfma 
    37c47
    < DYN_LIBS=-lz -lbz2 -lm -lpthread -llzma -lcurl -lssl -lcrypto
    ---
    > DYN_LIBS=-lz -lbz2 -lm -lpthread -llzma -lcurl -lssl -lcrypto -ldl


Now build,

    make -j 3

and copy over to the `PREFIX`.

    cp -av bin $PREFIX/
    cd $PREFIX/bin
    rm -f .gitignore 
    ln -s shapeit4.2 shapeit4
    ln -s shapeit4.2 shapeit

Make sure we can load it.

    module purge
    ldd shapeit4
    ./shapeit4

If it worked, clean up.

    cd $SRCDIR/shapeit4-4.2.2
    make clean


### Build on other clusters

Get ready to build.

    cd $VERSIONDIR
    rm -f snowy bianca
    mkdir snowy bianca

Since we use `-march=native`, we have to build separate for most of the other
clusters separately. Miarka shares the rackham executable.

On snowy-lr1:

    source /sw/bioinfo/SHAPEIT/SOURCEME_SHAPEIT_v4.2.2 
    cd $SRCDIR/shapeit4-4.2.2
    make clean

    module load gcc/12.3.0
    module load binutils/2.41
    module load boost/1.83.0-gcc12.3.0
    module load libcurl/8.4.0
    module load zlib/1.2.12
    module load bzip2/1.0.8
    module load xz/5.2.6
    module load bioinfo-tools htslib/1.17

    make -j 3

    cp -av bin $PREFIX/
    cd $PREFIX/bin
    rm -f .gitignore 
    ln -s shapeit4.2 shapeit4
    ln -s shapeit4.2 shapeit

    module purge
    ldd shapeit4
    ./shapeit4

    cd $SRCDIR/shapeit4-4.2.2
    make clean

Connect to the transit server for sens2017625, then:

    cd /sw/bioinfo/SHAPEIT
    mkdir /home/douglas/sens2017625/SHAPEIT
    rsync -Pa *4.2.2* /home/douglas/sens2017625/SHAPEIT/

Then on bianca:

    cd /proj/sens2017625/nobackup/wharf/douglas/douglas-sens2017625/SHAPEIT
    source SOURCEME_SHAPEIT_v4.2.2
    cd $VERSION/src/
    cp -av shapeit4-4.2.2 shapeit4-4.2.2_bianca
    cd $VERSION/src/shapeit4-4.2.2_bianca
    make clean

    echo "PREFIX = $PREFIX"

    module load gcc/12.3.0
    module load binutils/2.41
    module load boost/1.83.0-gcc12.3.0
    module load libcurl/8.4.0
    module load zlib/1.2.12
    module load bzip2/1.0.8
    module load xz/5.2.6
    module load bioinfo-tools htslib/1.17

    make -j 3

Back on the transit server for sens2017625:

    rsync -Pa  /home/douglas/sens2017625/SHAPEIT/v4.2.2/src/shapeit4-4.2.2_bianca douglas@rackham5.uppmax.uu.se:/sw/bioinfo/SHAPEIT/v4.2.2/src/

This moves the bianca-built source tree back to the src/ directory of the module.

From rackham, install into the bianca prefix:

    cd /sw/bioinfo/SHAPEIT
    source SOURCEME_SHAPEIT_v4.2.2
    export PREFIX=/sw/bioinfo/SHAPEIT/v4.2.2/bianca
    cd $SRCDIR
    cd shapeit4-4.2.2_bianca
    cp -av bin $PREFIX/
    cd $PREFIX/bin
    rm -f .gitignore 
    ln -s shapeit4.2 shapeit4
    ln -s shapeit4.2 shapeit

    module purge
    ldd shapeit4
    ./shapeit4


