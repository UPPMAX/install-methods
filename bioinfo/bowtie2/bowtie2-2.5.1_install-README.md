bowtie2/2.5.1
=============

<https://bowtie-bio.sourceforge.net/bowtie2/index.shtml>

Used under license:
GPL v3


Structure creating script (makeroom_bowtie2_2.5.1.sh) moved to /sw/bioinfo/bowtie2/makeroom_2.5.1.sh

One important break from previous bowtie2 versions, I replace $PREFIX with the unzipped directory, meaning that bin/ no longer follows $modroot for setting the PATH.

LOG
---

    makeroom.sh -f -t bowtie2 -v 2.5.1 -w https://bowtie-bio.sourceforge.net/bowtie2/index.shtml -d "an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences" -l "GPL v3"
    ./makeroom_bowtie2_2.5.1.sh 
    source /sw/bioinfo/bowtie2/SOURCEME_bowtie2_2.5.1 && cd $SRCDIR

    wget https://downloads.sourceforge.net/project/bowtie-bio/bowtie2/2.5.1/bowtie2-2.5.1-linux-x86_64.zip
    unzip bowtie2-2.5.1-linux-x86_64.zip 

    rmdir $PREFIX
    mv bowtie2-2.5.1-linux-x86_64 $PREFIX
