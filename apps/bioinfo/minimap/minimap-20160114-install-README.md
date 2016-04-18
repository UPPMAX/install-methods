# minimap-20160114-install-README.md

Miniasm long noisy-read overlap finger

<https://github.com/lh3/minimap>


LOG
---

    cd /sw/apps/bioinfo
    mkdir minimap
    cd minimap/
    mkdir 20160114 mf
    cd 20160114
    mkdir src milou
    cd src/
    git clone https://github.com/lh3/minimap
    cd minimap/

    module load gcc/5.3.0

    make
    ./minimap
    mkdir -p ../../milou/man/man1
    cp minimap.1 ../../milou/man/man1/
    mkdir -p ../../milou/bin
    cp minimap ../../milou/bin
    cd ../../
    ln -s ./milou nestor
    ln -s ./milou halvan
    ln -s ./milou irma


Use mf from miniasm.

    cd ../mf
    cp /sw/apps/bioinfo/miniasm/mf/20160128 20160114
    vi 20160114

