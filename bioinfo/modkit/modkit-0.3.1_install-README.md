modkit/0.3.1
========================

<https://github.com/nanoporetech/modkit>

Used under license:
GPL v3


Structure creating script (makeroom_modkit_0.3.1.sh) moved to /sw/bioinfo/modkit/makeroom_0.3.1.sh

LOG
---

    ./makeroom.sh "-t" "modkit" "-v" "0.3.1" "-w" "https://github.com/nanoporetech/modkit" "-c" "bioinfo" "-l" "GPL v3" "-d" "bioinformatics tool for working with modified bases from Oxford Nanopore" "-s" "misc" "-f"
    ./makeroom_modkit_0.3.1.sh
    source /sw/bioinfo/modkit/SOURCEME_modkit_0.3.1 && cd $TOOLDIR
    cd $PREFIX
    wget https://github.com/nanoporetech/modkit/releases/download/v0.3.1/modkit_v0.3.1_centos7_x86_64.tar.gz
    tar xzvf modkit_v0.3.1_centos7_x86_64.tar.gz
    rm modkit_v0.3.1_centos7_x86_64.tar.gz
    mv dist/* .
    ./modkit
Get tests
    cd $SRCDIR
    git clone https://github.com/nanoporetech/modkit.git
    cd modkit/
    cp -r tests $PREFIX/
    cd $PREFIX/tests
    ml rust
    ml pysam
    ml minimap2
    ml bioperl
    bash make_crams.sh
    etc...    

