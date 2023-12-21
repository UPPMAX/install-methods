meryl/1.4.1
========================

<https://github.com/marbl/meryl>

Used under license:
Mixed open source
<https://raw.githubusercontent.com/marbl/meryl/master/README.licenses>

Structure creating script (makeroom_meryl_1.4.1.sh) moved to /sw/bioinfo/meryl/makeroom_1.4.1.sh

LOG
---

    makeroom.sh -c bioinfo -s misc -t meryl -v 1.4.1 -l "Mixed open source" -L https://raw.githubusercontent.com/marbl/meryl/master/README.licenses -w https://github.com/marbl/meryl -d "A genomic k-mer counter (and sequence utility) with nice features."
    ./makeroom_meryl_1.4.1.sh 
    source /sw/bioinfo/meryl/SOURCEME_meryl_1.4.1 
    cd $SRCDIR
    wget https://github.com/marbl/meryl/releases/download/v1.4.1/meryl-1.4.1.Linux-amd64.tar.xz
    tar xf meryl-1.4.1.Linux-amd64.tar.xz 
    rmdir $PREFIX && mv meryl-1.4.1 $PREFIX
    cd $PREFIX/bin
    file *
    ldd *
    cd ../lib

Provides a static library, so set `LIBRARY_PATH` in the mf.
