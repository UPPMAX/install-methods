dorado/0.6.1
========================

<https://github.com/nanoporetech/dorado>

Used under license:
PLC 1.0


Structure creating script (makeroom_dorado_0.6.1.sh) moved to /sw/bioinfo/dorado/makeroom_0.6.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "dorado" "-v" "0.6.1" "-w" "https://github.com/nanoporetech/dorado" "-l" "PLC 1.0" "-d" "Oxford Nanopore's Basecaller" "-s" "annotation"
    ./makeroom_dorado_0.6.1.sh

    cd $SRCDIR
    wget https://cdn.oxfordnanoportal.com/software/analysis/dorado-0.6.1-linux-x64.tar.gz
    tar xfvz dorado-0.6.1-linux-x64.tar.gz
    cp -r dorado-0.6.1-linux-x64/* $PREFIX

