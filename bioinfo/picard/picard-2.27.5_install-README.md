picard/2.27.5
========================

<http://>

Used under license:



Structure creating script (makeroom_picard_2.27.5.sh) moved to /sw/bioinfo/picard/makeroom_2.27.5.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "picard" "-v" "2.27.5" "-f"
    ./makeroom_picard_2.27.5.sh

    TOOL=picard
    VERSION=2.27.5

    cd $PREFIX
    wget https://github.com/broadinstitute/picard/releases/download/${VERSION}/picard.jar







picard/2.23.4
========================

A single Java `.jar` file.  Load the latest java as well.


<https://broadinstitute.github.io/picard/>

Used under license:
MIT

Structure creating script (makeroom_picard_2.23.4.sh) moved to /sw/bioinfo/picard/makeroom_2.23.4.sh


LOG
---

    cd /sw/bioinfo/picard
    TOOL=picard
    VERSION=2.23.4
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://broadinstitute.github.io/picard/ -d "a set of command line tools for manipulating high-throughput sequencing (HTS) data and formats such as SAM/BAM/CRAM and VCF" -l MIT
    ./makeroom_picard_2.23.4.sh
    source SOURCEME_picard_2.23.4

    cd $PREFIX
    wget https://github.com/broadinstitute/picard/releases/download/${VERSION}/picard.jar

Module file from 2.20.4 is fine
