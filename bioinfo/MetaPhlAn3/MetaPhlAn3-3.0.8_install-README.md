MetaPhlAn3/3.0.8
========================

<https://huttenhower.sph.harvard.edu/metaphlan/>

Used under license:
MIT license
<>

Structure creating script (makeroom_MetaPhlAn3_3.0.8.sh) moved to /sw/bioinfo/MetaPhlAn3/makeroom_3.0.8.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "MetaPhlAn3" -v "3.0.8" -w "https://huttenhower.sph.harvard.edu/metaphlan/" -c "bioinfo" -l "MIT license" -d "is a computational tool for profiling the composition of microbial communities \\(Bacteria\\, Archaea and Eukaryotes\\) from metagenomic shotgun sequencing data \\(i.e. not 16S\\) with species-level." -s "phylogeny" -x "INSTALL" -f
    ./makeroom_MetaPhlAn3_3.0.8.sh
    cd /sw/bioinfo/MetaPhlAn
    . SOURCEME_MetaPhlAn3_3.0.8
    cd $SRCDIR
    wget https://files.pythonhosted.org/packages/48/c4/c5bddd83538afc097716ffb940d37994e320dc82d8e24e542197c37262db/MetaPhlAn-3.0.8.tar.gz
    cd MetaPhlAn 
    ml bioinfo-tools python/3.8.7 biopython/1.78 bowtie2/2.3.5.1
    PYTHONUSERBASE=$PREFIX pip install --user .
    cd $PREFIX
#    set PYTHONPATH $modroot/lib/python3.8/site-packages in mf file
    ml MetaPhlan3
    metaphlan --install 
    
