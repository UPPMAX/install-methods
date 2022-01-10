fastqtk/0.27
============

<https://github.com/ndaniel/fastqtk>

Used under license:
MIT


Structure creating script (makeroom_fastqtk_0.27.sh) moved to /sw/bioinfo/fastqtk/makeroom_0.27.sh

LOG
---

    makeroom.sh -t fastqtk -v 0.27 -s misc -w https://github.com/ndaniel/fastqtk -d "fast and lightweight tool for interleaving/deinterleaving/counting/trimming FASTQ files" -l MIT
    ./makeroom_fastqtk_0.27.sh
    source /sw/bioinfo/fastqtk/SOURCEME_fastqtk_0.27 && cd $TOOLDIR
    cd $SRCDIR
    wget https://github.com/ndaniel/fastqtk/archive/refs/tags/v0.27.tar.gz
    tar xf v0.27.tar.gz 
    cd fastqtk-0.27/
    ml gcc/9.3.0
    cd fastqtk-0.27/
    make
    ./test.sh
    cp -av fastqtk $PREFIX
