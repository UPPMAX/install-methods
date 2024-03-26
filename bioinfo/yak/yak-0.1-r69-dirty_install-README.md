yak/0.1-r69-dirty
=================

<https://github.com/lh3/yak>

Used under license:
MIT


Structure creating script (makeroom_yak_0.1-r69-dirty.sh) moved to /sw/bioinfo/yak/makeroom_0.1-r69-dirty.sh

LOG
---

    makeroom.sh -t yak -v 0.1-r69-dirty -w https://github.com/lh3/yak -d "Yak is initially developed for two specific use cases: 1) to robustly estimate the base accuracy of CCS reads and assembly contigs, and 2) to investigate the systematic error rate of CCS reads. It achieves the goals by comparing sequences to the k-mer spectrum of short reads or by comparing spectra. No reference genome or truth data is needed." -l MIT -c bioinfo -s misc
    ./makeroom_yak_0.1-r69-dirty.sh 
    source /sw/bioinfo/yak/SOURCEME_yak_0.1-r69-dirty
    cd $SRCDIR
    ml git/2.34.1
    git clone https://github.com/lh3/yak
    cd yak/
    git reset --hard f37704a 
    ml gcc/12.3.0
    make
    cp -av yak $PREFIX

In the mf file, only modroot should be added to PATH.

    cd $TOOLDIR/mf
    vi 0.1-r69-dirty 

Wrap up.

    cd ..
    ./yak-0.1-r69-dirty_post-install.sh 
