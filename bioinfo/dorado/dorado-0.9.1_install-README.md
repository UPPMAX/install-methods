dorado/0.9.1
============

<https://github.com/nanoporetech/dorado>

Used under license:
PLC 1.0


Structure creating script (makeroom_dorado_0.9.1.sh) moved to /sw/bioinfo/dorado/makeroom_0.9.1.sh

LOG
---

    makeroom.sh "-t" "dorado" "-v" "0.9.1" "-w" "https://github.com/nanoporetech/dorado" "-l" "PLC 1.0" "-d" "Oxford Nanopore's Basecaller" "-s" "annotation" "-f"
    ./makeroom_dorado_0.9.1.sh 
    source /sw/bioinfo/dorado/SOURCEME_dorado_0.9.1 && cd $SRCDIR
    ml git
    git clone https://github.com/nanoporetech/dorado.git
    wget https://cdn.oxfordnanoportal.com/software/analysis/dorado-0.9.1-linux-x64.tar.gz
    tar xf dorado-0.9.1-linux-x64.tar.gz 
    cp -r dorado-0.9.1-linux-x64/* $PREFIX/
    cp -r dorado/* $PREFIX/
    cd $PREFIX
    mkdir MODELS

    cd $TOOLDIR/mf
    vi 0.9.1

Make sure DORADO_MODELS_DIRECTORY is set to $modroot/MODELS

    ./dorado-0.9.1_post-install.sh 

Now load and download models.

    module load bioinfo-tools dorado/0.9.1
    cd $DORADO_MODELS_DIRECTORY
    dorado download
