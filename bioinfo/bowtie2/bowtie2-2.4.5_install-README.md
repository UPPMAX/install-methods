bowtie2/2.4.5
==============

<https://bowtie-bio.sourceforge.net/bowtie2/index.shtml>

Used under license:



Structure creating script (makeroom_bowtie2_2.4.5.sh) moved to /sw/bioinfo/bowtie2/makeroom_2.4.5.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "bowtie2" "-v" "2.4.5" "-f"
    ./makeroom_bowtie2_2.4.5.sh


    TOOL=/sw/bioinfo/bowtie2
    VERSION=2.4.5
    cd $SRCDIR

# Download and extract

    wget https://github.com/BenLangmead/bowtie2/releases/download/v2.4.5/bowtie2-2.4.5-linux-x86_64.zip
    unzip bowtie2-2.4.5-linux-x86_64.zip
    mv bowtie2-${VERSION}-linux-x86_64 $PREFIX/bin



