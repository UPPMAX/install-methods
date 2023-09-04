rtgtools/3.12.1
===============

<https://github.com/RealTimeGenomics/rtg-tools>

Used under license:
BSD 2-clause
<https://raw.githubusercontent.com/RealTimeGenomics/rtg-tools/master/LICENSE.txt>

Structure creating script (makeroom_rtgtools_3.12.1.sh) moved to /sw/bioinfo/rtgtools/makeroom_3.12.1.sh

LOG
---

    makeroom.sh -f -t rtgtools -v 3.12.1 -d "Utilities for accurate VCF comparison and manipulation" -l "BSD 2-clause" -L https://raw.githubusercontent.com/RealTimeGenomics/rtg-tools/master/LICENSE.txt 
    ./makeroom_rtgtools_3.12.1.sh 
    source /sw/bioinfo/rtgtools/SOURCEME_rtgtools_3.12.1
    cd $SRCDIR
    wget https://github.com/RealTimeGenomics/rtg-tools/releases/download/3.12.1/rtg-tools-3.12.1-linux-x64.zip
    unzip rtg-tools-3.12.1-linux-x64.zip 
    rmdir $PREFIX && mv rtg-tools-3.12.1 $PREFIX
    cd $PREFIX
    ./rtg
    cp -av rtg.cfg rtg.cfg-orig
    vi rtg.cfg

Change to `RTG_TALKBACK=false`.  Then:

    jre/bin/java -version

Now install rtgcore.
