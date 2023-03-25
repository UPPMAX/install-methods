MEMEsuite/5.5.1
========================

<http://meme-suite.org>

Used under license:
University of California open-source AS IS


Structure creating script (makeroom_MEMEsuite_5.5.1.sh) moved to /sw/bioinfo/MEMEsuite/makeroom_5.5.1.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-s" "sw_collections" "-t" "MEMEsuite" "-v" "5.5.1" "-w" "http://meme-suite.org" "-l" "University of California open-source AS IS" "-d" "Motif-based sequence analysis tools" "-f"

    ./makeroom_MEMEsuite_5.5.1.sh

Keep local copies of the databases.

    source /sw/bioinfo/MEMEsuite/SOURCEME_MEMEsuite_5.5.1 && cd $TOOLDIR
    cd $SRCDIR
    [[ -f meme-$VERSION.tar.gz ]] || wget http://meme-suite.org/meme-software/${VERSION}/meme-${VERSION}.tar.gz
    [[ -d meme-$VERSION ]] && rm -rf meme-$VERSION
    tar xzf meme-$VERSION.tar.gz 
    module load gcc/9.3.0 openmpi/3.1.5
    module load perl/5.26.2 perl_modules/5.26.2
    module load python/3.10.8
    cd meme-$VERSION/
    #  use system versions instead of bundled versions: leave these options off --enable-build-libxml2 --enable-build-libxslt
    ./configure --prefix=$PREFIX --with-url=http://meme-suite.org --with-db=/sw/data/MEMEsuite/latest
    make
    make test
#   no failed tests this time!
    make install


In 5.1.1:
As Linus also found, 2 failed tests related to some diff with a .tsv table and .html.
