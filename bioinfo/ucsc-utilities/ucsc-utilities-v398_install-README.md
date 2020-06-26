ucsc-utilities/v398
========================

<http://hgdownload.soe.ucsc.edu/admin/exe/>

Used under license:
Free non-commercial

Structure creating script (makeroom_ucsc-utilities_v398.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/ucsc-utilities/makeroom_v398.sh

LOG
---

    TOOL=ucsc-utilities
    VERSION=v398
    makeroom.sh -f" -s "misc" -t "ucsc-utilities" -v "v398" -w "http://hgdownload.soe.ucsc.edu/admin/exe/" -l "Free non-commercial" -d "Kent bioinformatics utilities"
    ./makeroom_ucsc-utilities_v398.sh

    cd /sw/bioinfo/$TOOL
    source SOURCEME_ucsc-utilities_v398

    cd $PREFIX
    rsync -aP rsync://hgdownload.cse.ucsc.edu/genome/admin/exe/linux.x86_64/ ./

