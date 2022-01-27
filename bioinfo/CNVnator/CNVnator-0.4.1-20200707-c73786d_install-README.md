CNVnator/0.4.1-20200707-c73786d
===============================

<https://github.com/abyzovlab/CNVnator>

Used under license:
Custom AS IS
<https://github.com/abyzovlab/CNVnator/blob/master/license.rtf>

Structure creating script (makeroom_CNVnator_0.4.1-20200707-c73786d.sh) moved to /sw/bioinfo/CNVnator/makeroom_0.4.1-20200707-c73786d.sh

LOG
---

    makeroom.sh -f -t CNVnator -v 0.4.1-20200707-c73786d -w https://github.com/abyzovlab/CNVnator -d "a tool for CNV discovery and genotyping from depth-of-coverage by mapped reads" -l "Custom AS IS" -L https://github.com/abyzovlab/CNVnator/blob/master/license.rtf 
    ./makeroom_CNVnator_0.4.1-20200707-c73786d.sh 
    source /sw/bioinfo/CNVnator/SOURCEME_CNVnator_0.4.1-20200707-c73786d && cd $SRCDIR
    ml python/2.7.15
    ml perl_modules/5.18.4
    ml ROOT/6.20.04  # also loads gcc/9.3.0
    ml bioinfo-tools
    ml samtools/1.9
    ml git/2.34.1
    git clone https://github.com/abyzovlab/CNVnator
    cp -av $SAMTOOLS_ROOT/../src/samtools-1.9.tar.bz2 .
    tar xf samtools-1.9.tar.bz2 
    cd samtools-1.9/
    make
    cd ..
    cd CNVnator/
    ln -s ../samtools-1.9 samtools
    make
    rmdir $PREFIX
    mv CNVnator $PREFIX
    cd $PREFIX

Check for proper #! lines, and redo two.

    head -n 1 *.py *.pl
    vi callbaf.py cnvnator2VCF.pl 

Load python/2.7.15 perl/5.18.4 and perl_modules/5.18.4 when this is loaded.

