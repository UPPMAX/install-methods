# miniasm-20160128-install-README.md

Miniasm long noisy-read assembler

<https://github.com/lh3/miniasm>

I am using a fork from Dinghua Li, that fixes an integer overflow problem that
may occur with large genomes.  This has not yet been brought into miniasm, so I
am giving this version the date of the commit in Dinghua Li's repository.

<https://github.com/voutcn/miniasm/commit/b39d7577d30bca8f368370945995e576c00c358d>


LOG
---

    cd /sw/apps/bioinfo
    mkdir miniasm
    cd miniasm/
    mkdir 20160128 mf
    cd 20160128
    mkdir src milou
    cd src/
    git clone https://github.com/voutcn/miniasm
    cd miniasm/

    module load gcc/5.3.0

    make
    ./miniasm
    ./minidot
    mkdir -p ../../milou/man/man1
    cp miniasm.1 ../../milou/man/man1/
    mkdir -p ../../milou/bin
    cp miniasm minidot ../../milou/bin
    cd ../../
    ln -s ./milou nestor
    ln -s ./milou halvan
    ln -s ./milou irma


Use mf from fermi.

    cd ../mf
    cp /sw/apps/bioinfo/fermi/mf/fermi-1.1-r751-beta miniasm-20160128
    vi miniasm-20160128 
