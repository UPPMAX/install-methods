WhatsHap/2.3-20240529-be88057
========================

<https://whatshap.readthedocs.io/en/latest/>

Used under license:
MIT


Structure creating script (makeroom_WhatsHap_2.3-20240529-be88057.sh) moved to /sw/bioinfo/WhatsHap/makeroom_2.3-20240529-be88057.sh

LOG
---

    makeroom.sh -t WhatsHap -v 2.3-20240529-be88057 -l MIT -w https://whatshap.readthedocs.io/en/latest/ -c bioinfo -s annotation -d "WhatsHap is a software for phasing genomic variants using DNA sequencing reads, also called read-based phasing or haplotype assembly. It is especially suitable for long reads, but works also well with short reads."
    ./makeroom_WhatsHap_2.3-20240529-be88057.sh 
    source /sw/bioinfo/WhatsHap/SOURCEME_WhatsHap_2.3-20240529-be88057
    cd $SRCDIR
    ml git/2.44.0 python/3.11.8
    ml gcc/12.3.0
    cd $PREFIX
    virtualenv venv 
    source venv/bin/activate
    which python3
    which pip3
    cd $SRCDIR
    git clone --recursive https://github.com/whatshap/whatshap
    cd whatshap
    git reset --hard be88057
    pip3 install .
    cd $PREFIX
    which whatshap
    mkdir $PREFIX/bin
    cd $PREFIX/bin
    ln -s $(which whatshap) .
    cd $TOOLDIR/mf
    vi 2.3-20240529-be88057 
    cd $TOOLDIR
    ./WhatsHap-2.3-20240529-be88057_post-install.sh 
