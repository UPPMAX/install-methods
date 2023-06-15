bali-phy/3.6.1
========================

<https://github.com/bredelings/BAli-Phy>

Used under license:



Structure creating script (makeroom_bali-phy_3.6.1.sh) moved to /sw/bioinfo/bali-phy/makeroom_3.6.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "bali-phy" "-v" "3.6.1" "-d" "estimates multiple sequence alignments and evolutionary trees from DNA, amino acid, or codon sequences." "-w" "https://github.com/bredelings/BAli-Phy" "-s" "annotation"
    ./makeroom_bali-phy_3.6.1.sh

    TOOL=bali-phy
    VERSION=3.6.1

    module load gcc/11.2.0 
    module load boost/1.78.0_gcc11.2.0
    module load meson/0.57.2
    module load ninja/1.10.0

    # git clone
    cd $SRCDIR
    git clone https://github.com/bredelings/BAli-Phy.git .
    git reset --hard 898b7c9 #Checkout 3.6.1.

    # Meson build and test.
    meson build --prefix=$PREFIX
    ninja -C build install
    ninja -C build test


    # Tested about half way through the tutorial. Everything worked fine.
    https://www.bali-phy.org/Tutorial4.html
    wget http://www.bali-phy.org/examples.tgz


