picard/3.1.1
============

<https://broadinstitute.github.io/picard/>

Used under license:
MIT


Structure creating script (makeroom_picard_3.1.1.sh) moved to /sw/bioinfo/picard/makeroom_3.1.1.sh

LOG
---

    makeroom.sh -f -t picard -v 3.1.1 -s misc -w https://broadinstitute.github.io/picard/ -d "a set of command line tools for manipulating high-throughput sequencing (HTS) data and formats such as SAM/BAM/CRAM and VCF" -l MIT
    ./makeroom_picard_3.1.1.sh 
    source /sw/bioinfo/picard/SOURCEME_picard_3.1.1
    cd $SRCDIR

    wget https://github.com/broadinstitute/picard/releases/download/3.1.1/picard.jar
    mv picard.jar $PREFIX

    cd ../../mf
    rm -f 3.1.1 && cp -av 2.19.2 3.1.1 
    vi 3.1.1 

Load java/OpenJDK_17+35 and also define $PICARD to point directly to the picard.jar
