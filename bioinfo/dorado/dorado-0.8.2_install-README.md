dorado/0.8.2
========================

<https://github.com/nanoporetech/dorado>

Used under license:
PLC 1.0


Structure creating script (makeroom_dorado_0.8.2.sh) moved to /sw/bioinfo/dorado/makeroom_0.8.2.sh

LOG
---

    makeroom.sh "-t" "dorado" "-v" "0.8.2" "-w" "https://github.com/nanoporetech/dorado" "-l" "PLC 1.0" "-d" "Oxford Nanopore's Basecaller" "-s" "annotation" "-f"
    ./makeroom_dorado_0.8.2.sh

    source /sw/bioinfo/dorado/SOURCEME_dorado_0.8.2 && cd $SRCDIR
    ml git
    git clone https://github.com/nanoporetech/dorado.git    
    wget https://cdn.oxfordnanoportal.com/software/analysis/dorado-0.8.2-linux-x64.tar.gz
    tar xvfz dorado-0.8.2-linux-x64.tar.gz
    cp -r dorado-0.8.2-linux-x64 $PREFIX
    # Extra material
    ml git
    git clone https://github.com/nanoporetech/dorado.git
    cd dorado
    cp -r * $PREFIX
    # test in interactive session with gpu
    cd $PREFIX/tests/data/pod5/ 
    dorado basecaller hac dna_r10.4.1_e8.2_400bps_5khz/ >calls.bam
    bg
    nvidia-smi
    # dorado should show up
