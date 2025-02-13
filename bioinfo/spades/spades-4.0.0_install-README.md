spades/4.0.0
============

<https://github.com/ablab/spades>

SPAdes is no longer being developed at <http://cab.spbu.ru/software/spades/> and that website no longer exists.  Use the github repository now.

Used under license:
GPLv2
<https://raw.githubusercontent.com/ablab/spades/main/LICENSE>

Structure creating script (makeroom_spades_4.0.0.sh) moved to /sw/bioinfo/spades/makeroom_4.0.0.sh

LOG
---

    makeroom.sh -f -t "spades" -v "4.0.0" -s "assembly" -w "http://cab.spbu.ru/software/spades/" -l "GPL v2" -L "https://raw.githubusercontent.com/ablab/spades/main/LICENSE" -d "SPAdes is a versatile toolkit designed for assembly and analysis of sequencing data. SPAdes is primarily developed for Illumina sequencing data, but can be used for IonTorrent as well. Most of SPAdes pipelines support hybrid mode, i.e. allow using long reads (PacBio and Oxford Nanopore) as a supplementary data."
    ./makeroom_spades_4.0.0.sh
    source /sw/bioinfo/spades/SOURCEME_spades_4.0.0

    cd $SRCDIR

The pre-built spades binaries are for RHEL 9+ so will work fine for Rocky 9 but
not on our CentOS 7.  So, build from source following
<https://ablab.github.io/spades/installation.html#downloading-and-compiling-spades-source-code>.

It provides several of its own things, but I load the following.

    module load gcc/12.3.0
    module load binutils/2.41
    module load python/3.10.8
    module load cmake/3.26.3

Get the tarball and build separately for snowy.

    wget https://github.com/ablab/spades/releases/download/v4.0.0/SPAdes-4.0.0.tar.gz
    tar xf SPAdes-4.0.0.tar.gz

Add missing header to `SPAdes-4.0.0/src/projects/mts/kmer_multiplicity_counter.cpp`.

    vi SPAdes-4.0.0/src/projects/mts/kmer_multiplicity_counter.cpp

Add `#include <optional>` after the system `#include` lines.

Next, enable building tests.

    vi SPAdes-4.0.0/src/CMakeLists.txt

Where you see other `add_subdirectory(` statements, add

    add_subdirectory(test/debruijn)
    add_subdirectory(test/examples)
    add_subdirectory(test/include_test)

Now create a snowy copy of the source tree.

    cp -a SPAdes-4.0.0 SPAdes-4.0.0_snowy

Before building, set up the venv.  Do this on snowy as well.

    cd $PREFIX
    virtualenv venv
    source venv/bin/activate
    module unload python
    which python3

This should show the python3 in the venv.

Now build the tools.  Do this on snowy as well for the `_snowy` tree.

    cd $SRCDIR/SPAdes-4.0.0

    ./spades_compile.sh -atj20

This will also install and test.

Now point the `.py` files at the venv python3.

    cd $PREFIX/bin
    which python3

Verify this is still the venv python3.


    sed -i '1i#!'"$(which python3)" spades.py spades_init.py 

Make sure to do all the same in the `_snowy` tree.
