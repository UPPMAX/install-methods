phylip/3.697
========================

<https://phylipweb.github.io/phylip/>

Used under license:



Structure creating script (makeroom_phylip_3.697.sh) moved to /sw/bioinfo/phylip/makeroom_3.697.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "phylip" "-v" "3.697" "-w" "https://phylipweb.github.io/phylip/" "-s" "phylogeny"
    ./makeroom_phylip_3.697.sh

    # Download
    cd $SRCDIR
    wget https://phylipweb.github.io/phylip/download/phylip-3.697.tar.gz
    tar xfvz phylip-3.697.tar.gz --strip-components=1

    # make
    cd src
    mv Makefile.unx Makefile
    make install
    mkdir $PREFIX/bin
    cp $SRCDIR/exe/* $PREFIX/bin















phylip/3.698
========================

<https://phylipweb.github.io/phylip/>

Used under license:



Structure creating script (makeroom_phylip_3.698.sh) moved to /sw/bioinfo/phylip/makeroom_3.698.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "phylip" "-v" "3.698" "-w" "https://phylipweb.github.io/phylip/" "-s" "phylogeny"
    ./makeroom_phylip_3.698.sh

    # Download
    cd $SRCDIR 
