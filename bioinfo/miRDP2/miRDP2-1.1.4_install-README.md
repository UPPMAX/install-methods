miRDP2/1.1.4
========================

<https://sourceforge.net/projects/mirdp2/>

Used under license:
GPL v3


Structure creating script (makeroom_miRDP2_1.1.4.sh) moved to /sw/bioinfo/miRDP2/makeroom_1.1.4.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "miRDP2" "-v" "1.1.4" "-w" "https://sourceforge.net/projects/mirdp2/" "-l" "GPL v3" "-d" "miRDeep-P2 (miRDP2) is developed to accurately and fast analyze microRNAs (miRNAs) transcriptome in plants" "-s" "misc"
    ./makeroom_miRDP2_1.1.4.sh
    source /sw/bioinfo/miRDP2/SOURCEME_miRDP2_1.1.4 && cd $SRCDIR
    wget https://sourceforge.net/projects/mirdp2/files/version%201.1.4/miRDP2_manual-v1.1.4.pdf
    wget https://sourceforge.net/projects/mirdp2/files/version%201.1.4/miRDP2-v1.1.4.tar.gz
    wget https://sourceforge.net/projects/mirdp2/files/version%201.1.4/update_log
    wget https://sourceforge.net/projects/mirdp2/files/version%201.1.4/ncRNA_rfam.tar.gz
    tar xzvf ncRNA_rfam.tar.gz
    tar xzvf miRDP2-v1.1.4.tar.gz
    rm *.gz
    cd 1.1.4/
    vi miRDP2-v1.1.4_pipeline.bash
    ./miRDP2-v1.1.4_pipeline.bash --help
    ml bioinfo-tools  BioPerl/1.7.8-perl5.32.1 blast/2.14.1+ bowtie2/2.5.2 samtools/1.19 
    cp -r miRDP2-v1.1.4_pipeline.bash scripts/ $PREFIX/
    mkdir $PREFIX/data
    cp *.fa $PREFIX/data/
    cp miRDP2_manual-v1.1.4.pdf $PREFIX/
    cd $PREFIX
    git clone https://github.com/TF-Chan-Lab/miRDeep-P2_pipeline.git pipeline
    cd pipeline/scripts
make the header of the pl scripts: 
    #!/bin/env perl
    chmod +x *.pl 

