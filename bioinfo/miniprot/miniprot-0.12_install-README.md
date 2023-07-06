miniprot/0.12
========================

<http://>

Used under license:
MIT


Structure creating script (makeroom_miniprot_0.12.sh) moved to /sw/bioinfo/miniprot/makeroom_0.12.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "miniprot" "-v" "0.12" "-d" "Align proteins to genomes with splicing and frameshift" "-l" "MIT" "-s" "annotation"
    ./makeroom_miniprot_0.12.sh

    # Load modules
    module load gcc/9.3.0

    # Download
    cd $SRCDIR
    git clone https://github.com/lh3/miniprot.git .
    git checkout tags/v0.12

    # make
    make 
    mkdir $PREFIX/bin
    cp miniprot $PREFIX/bin

    # test
    $PREFIX/bin/miniprot test/DPP3-hs.gen.fa.gz test/DPP3-mm.pep.fa.gz







