Shasta/0.7.0
========================

<https://github.com/chanzuckerberg/shasta>

Used under license:
MIT license
<>

Structure creating script (makeroom_Shasta_0.7.0.sh) moved to /sw/bioinfo/Shasta/makeroom_0.7.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "Shasta" -v "0.7.0" -w "https://github.com/chanzuckerberg/shasta" -c "bioinfo" -l "MIT license" -d "The goal of the Shasta long read assembler is to rapidly produce accurate assembled sequence using as input DNA reads generated by Oxford Nanopore flow cells." -x "INSTALL" -s "assembly" -f
    ./makeroom_Shasta_0.7.0.sh
    cd $SRCDIR
    git clone https://github.com/chanzuckerberg/shasta
    cp -r {docs,conf} $PREFIX
    cd $PREFIX 
#---Download static executable     
    curl -O -L https://github.com/chanzuckerberg/shasta/releases/download/0.7.0/shasta-Linux-0.7.0
    chmod ugo+x shasta-Linux-0.7.0
    ln -s shasta-Linux-0.7.0 shasta
#---TEST
    cd tests/
    gunzip TinyTest.fasta.gz
    ./shasta --input tests/TinyTest.fasta
    cd ShastaRun
#---works!?
    cd ..
    rm -rf ShastaRun/



