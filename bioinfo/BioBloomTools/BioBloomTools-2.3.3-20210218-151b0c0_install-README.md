BioBloomTools/2.3.3-20210218-151b0c0
====================================

<https://github.com/bcgsc/biobloom>

Used under license:
GPL v3


Structure creating script (makeroom_BioBloomTools_2.3.3-20210218-151b0c0.sh) moved to /sw/bioinfo/BioBloomTools/makeroom_2.3.3-20210218-151b0c0.sh

I added sparsehash/2.0.4 and SDSL/2.1.1 prior to building this.

Build separately for snowy and rackham.


LOG
---

    makeroom.sh "-c" "bioinfo" "-s" "misc" "-t" "BioBloomTools" "-v" "2.3.3-20210218-151b0c0" "-w" "https://github.com/bcgsc/biobloom" "-l" "GPL v3" "-d" "Create Bloom filters for a given reference and then use it to categorize sequences"
    ./makeroom_BioBloomTools_2.3.3-20210218-151b0c0.sh

    source /sw/bioinfo/BioBloomTools/SOURCEME_BioBloomTools_2.3.3-20210218-151b0c0 && cd $SRCDIR
    module load git/2.34.1
    module load gcc/9.3.0
    module load zlib/1.2.11
    module load boost/1.75.0-gcc9.3.0
    module load sparsehash/2.0.4
    module load SDSL/2.1.1
    [[ -d biobloom ]] && rm -rf biobloom
    git clone --recursive https://github.com/bcgsc/biobloom
    cd biobloom
    git submodule update --init
    ./autogen.sh

    ./configure --prefix=$PREFIX --with-boost=$BOOST_ROOT/include
    make
    make check
    make install

Repeat for snowy.

    source /sw/bioinfo/BioBloomTools/SOURCEME_BioBloomTools_2.3.3-20210218-151b0c0 && cd $SRCDIR
    rm -f $PREFIX && mkdir $PREFIX
    module load git/2.34.1
    module load gcc/9.3.0
    module load zlib/1.2.11
    module load boost/1.75.0-gcc9.3.0
    module load sparsehash/2.0.4
    module load SDSL/2.1.1
    [[ -d biobloom ]] && rm -rf biobloom
    git clone --recursive https://github.com/bcgsc/biobloom
    cd biobloom
    git submodule update --init
    ./autogen.sh

    ./configure --prefix=$PREFIX --with-boost=$BOOST_ROOT/include
    make
    make check
    make install
