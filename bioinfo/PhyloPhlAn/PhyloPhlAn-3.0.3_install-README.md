PhyloPhlAn/3.0.3
========================

<https://github.com/biobakery/phylophlan/wiki>

Used under license:
MIT license


Structure creating script (makeroom_PhyloPhlAn_3.0.3.sh) moved to /sw/bioinfo/PhyloPhlAn/makeroom_3.0.3.sh

LOG
---
TOOL=PhyloPhlAn
VERSION=3.0.3

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "PhyloPhlAn" "-v" "3.0.3" "-w" "https://github.com/biobakery/phylophlan/wiki" "-c" "bioinfo" "-l" "MIT license" "-d" "is an integrated pipeline for large-scale phylogenetic profiling of genomes and metagenomes." "-s" "phylogeny" "-x" "INSTALL" "-f"
    ./makeroom_PhyloPhlAn_3.0.3.sh

    source /sw/bioinfo/PhyloPhlAn/SOURCEME_PhyloPhlAn_3.0.3 && cd $SRCDIR
    git clone https://github.com/biobakery/phylophlan

    cd $PREFIX
    ml bioinfo-tools
    ml biopython/1.80-py3.10.8

## We go for a virtualenv this time    
    virtualenv --system-site-packages venv
    source venv/bin/activate
    which pip #should pioint to venv

    pip install dendropy seaborn
    cd ../src/phylophlan/
    python setup.py install
    cd $PREFIX
    cd venv/
    cd bin/
    phylophlan

    mkdir $PREFIX/bin
    cd $PREFIX/bin
    ln -s $PREFIX/venv/bin/* .

    deactivate

## mf file
    depends-on biopython/1.80-py3.10.8
   still needed
