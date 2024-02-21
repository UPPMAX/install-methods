metaMDBG/0.3-20240117-57f4493
========================

<https://github.com/GaetanBenoitDev/metaMDBG>

Used under license:
MIT


Structure creating script (makeroom_metaMDBG_0.3-20240117-57f4493.sh) moved to /sw/bioinfo/metaMDBG/makeroom_0.3-20240117-57f4493.sh

LOG
---

    makeroom.sh -f -t metaMDBG -v 0.3-20240117-57f4493 -w https://github.com/GaetanBenoitDev/metaMDBG -d "a lightweight assembler for long and accurate metagenomics reads" -c bioinfo -s assembly -l MIT -k "metagenomics PacBio-HiFi"
    ./makeroom_metaMDBG_0.3-20240117-57f4493.sh 
    source /sw/bioinfo/metaMDBG/SOURCEME_metaMDBG_0.3-20240117-57f4493
    cd $SRCDIR

    ml git/2.34.1
    git clone --recursive https://github.com/GaetanBenoitDev/metaMDBG
    cd metaMDBG/
    git reset --hard 57f4493
    ml -git

    ml cmake/3.26.3
    ml gcc/12.3.0
    ml gsl/2.7

    ml bioinfo-tools
    ml htslib/1.19 
    ml wfmash/0.12.5
    ml zlib/1.3
    ml minimap2/2.26-r1175

    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_DEFAULT_CMP0074=NEW 
    make
    make install

There is no install step, so copy `bin/` over to PREFIX.

    ll bin/
    cp -av bin $PREFIX/

Check libraries.

    ml purge
    cd $PREFIX/bin
    ldd metaMDBG 

Final install.

    cd $TOOLDIR
    ./metaMDBG-0.3-20240117-57f4493_post-install.sh

Test the module. Get SRA SRR15275213, human gut microbiome mentioned by the tree README.

    source /sw/bioinfo/metaMDBG/SOURCEME_metaMDBG_0.3-20240117-57f4493
    cd $SRCDIR
    ml purge

    ml bioinfo-tools
    ml sratools/3.0.7
    vdb-config --prefetch-to-cwd
    prefetch SRR15275213 -O $PWD/SRR15275213
    fasterq-dump SRR15275213
    pigz -p 10 SRR15275213.fastq 

    ml metaMDBG/0.3-20240117-57f4493
