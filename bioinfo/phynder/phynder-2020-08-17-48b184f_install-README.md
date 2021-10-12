phynder/2020-08-17-48b184f
========================

<https://github.com/richarddurbin/phynder>

Used under license:
MIT


Structure creating script (makeroom_phynder_2020-08-17-48b184f.sh) moved to /sw/bioinfo/phynder/makeroom_2020-08-17-48b184f.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -f" -c "bioinfo" -t "phynder" -v "2020-08-17-48b184f" -s "phylogeny" -l "MIT" -w "https://github.com/richarddurbin/phynder" -d "Efficient likelihood calculations to place samples into a phylogenetic tree."
    ./makeroom_phynder_2020-08-17-48b184f.sh
    cd $SRCDIR

    ml bioinfo-tools
    ml htslib/1.12


    git clone https://github.com/richarddurbin/phynder.git
    cd phynder

Open Makefile and change the following

    HTSDIR=/sw/bioinfo/htslib/1.12/src/htslib-1.12/

    install: phynder
        cp phynder /sw/bioinfo/phynder/2020-08-17-48b184f/rackham/


    make
    make install
