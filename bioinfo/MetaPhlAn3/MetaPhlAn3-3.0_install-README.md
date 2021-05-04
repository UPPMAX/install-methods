MetaPhlAn3/3.0
========================

<https://huttenhower.sph.harvard.edu/metaphlan/>

Used under license:
MIT license
<>

Structure creating script (makeroom_MetaPhlAn3_3.0.sh) moved to /sw/bioinfo/MetaPhlAn3/makeroom_3.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "MetaPhlAn3" -v "3.0" -w "https://huttenhower.sph.harvard.edu/metaphlan/" -c "bioinfo" -l "MIT license" -d "is a computational tool for profiling the composition of microbial communities \(Bacteria\, Archaea and Eukaryotes\) from metagenomic shotgun sequencing data \(i.e. not 16S\) with species-level." -s "phylogeny" -x "INSTALL"
    ./makeroom_MetaPhlAn3_3.0.sh
    . SOURCEME_MetaPhlAn3_3.0
    cd $SRCDIR
    git clone https://github.com/biobakery/MetaPhlAn.git
    cd MetaPhlAn 
    git checkout 3.0
    ml bioinfo-tools python/3.8.7 bowtie2/2.3.5.1 
    PYTHONUSERBASE=$PREFIX pip install --user biopython==1.68
    PYTHONUSERBASE=$PREFIX pip install --user MetaPhlAn
    cd $PREFIX
    makedir metaphlan_databases
# fill with last version (v3) of .tar and .md5 files and the "mpa_latest" file
#    set PYTHONPATH $modroot/lib/python3.8/site-packages in mf file
    ml MetaPhlan3
    metaphlan --install --bowtie2db metaphlan_databases
#include biopython/1.78 and bowtie2/2.3.5.1 in mf file
#test module somewhere else
    metaphlan <fastq file> --input_type fastq -o profiled_outputfile.txt
    
