MetaPhlAn4/4.0
========================

<https://huttenhower.sph.harvard.edu/metaphlan/>

Used under license:
MIT license


Structure creating script (makeroom_MetaPhlAn4_4.0.sh) moved to /sw/bioinfo/MetaPhlAn4/makeroom_4.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "MetaPhlAn4" "-v" "4.0" "-w" "https://huttenhower.sph.harvard.edu/metaphlan/" "-c" "bioinfo" "-l" "MIT license" "-d" "is a computational tool for profiling the composition of microbial communities \(Bacteria\, Archaea and Eukaryotes\) from metagenomic shotgun sequencing data \(i.e. not 16S\) with species-level." "-s" "phylogeny" "-x" "INSTALL"
    ./makeroom_MetaPhlAn4_4.0.sh
    source /sw/bioinfo/MetaPhlAn4/SOURCEME_MetaPhlAn4_4.0 && cd $SRCDIR
    git clone https://github.com/biobakery/MetaPhlAn.git
    cd MetaPhlAn/
    ml bioinfo-tools
    ml biopython/1.80-py3.10.8
    ml bowtie2/2.5.1
    PYTHONUSERBASE=$PREFIX pip install --user .
    
# Needed???
#    ml MetaPhlan3
#    metaphlan --install
    

