MiXCR/4.7.0
========================

<https://mixcr.com>

Used under license:
custom
<https://github.com/milaboratory/mixcr/blob/develop/LICENSE>

Structure creating script (makeroom_MiXCR_4.7.0.sh) moved to /sw/bioinfo/MiXCR/makeroom_4.7.0.sh

LOG
---

    makeroom.sh -t MiXCR -v 4.7.0 -c bioinfo -s misc -w https://mixcr.com -l custom -L "https://github.com/milaboratory/mixcr/blob/develop/LICENSE" "-d" "MiXCR is a universal software for fast and accurate analysis of raw T- or B- cell receptor repertoire sequencing data."
    ./makeroom_MiXCR_4.7.0.sh
    source /sw/bioinfo/MiXCR/SOURCEME_MiXCR_4.7.0 && cd $SRCDIR
    wget https://github.com/milaboratory/mixcr/releases/download/v4.7.0/mixcr-4.7.0.zip
    cd $PREFIX
    mkdir bin && cd bin
    unzip $SRCDIR/mixcr-4.7.0.zip

    

