MEMEsuite/5.1.1
========================

<http://meme-suite.org>

Used under license:
University of California open-source AS IS

Structure creating script (makeroom_MEMEsuite_5.1.1.sh) moved to /sw/bioinfo/MEMEsuite/makeroom_5.1.1.sh

Keep local copies of the databases.


LOG
---

    TOOL=MEMEsuite
    VERSION=5.1.1
    cd /sw/bioinfo/MEMEsuite
    makeroom.sh -f -s "sw_collections" -t "MEMEsuite" -v "5.1.1" -w "http://meme-suite.org" -l "University of California open-source AS IS" -d "Motif-based sequence analysis tools"
    ./makeroom_MEMEsuite_5.1.1.sh
    source SOURCEME_MEMEsuite_5.1.1
    cd $VERSIONDIR
    cd src/
    [[ -f meme-5.1.1.tar.gz ]] || wget http://meme-suite.org/meme-software/5.1.1/meme-5.1.1.tar.gz
    [[ -d meme-5.1.1 ]] && rm -rf meme-5.1.1
    tar xzf meme-5.1.1.tar.gz 
    module load gcc/9.2.0 openmpi/3.1.3
    module load perl/5.26.2 perl_modules/5.26.2
    module load python/3.7.2
    cd meme-5.1.1/
    #  use system versions instead of bundled versions: leave these options off --enable-build-libxml2 --enable-build-libxslt
    ./configure --prefix=$PREFIX --with-url=http://meme-suite.org --with-db=/sw/data/MEMEsuite/latest
    make
    make test
    make install

As Linus also found, 2 failed tests related to some diff with a .tsv table and .html.

