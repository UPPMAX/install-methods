MakeHub/1.0.5-20200210-1ecd6bb
========================

<https://github.com/Gaius-Augustus/MakeHub>

Used under license:
GPL v3

Structure creating script (makeroom_MakeHub_1.0.5-20200210-1ecd6bb.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/MakeHub/makeroom_1.0.5-20200210-1ecd6bb.sh

LOG
---

    TOOL=MakeHub
    TOOLVERSION=1.0.5
    COMMIT=1ecd6bb
    COMMITDATE=20200210
    VERSION=$TOOLVERSION-$COMMITDATE-$COMMIT
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    makeroom.sh -f -s "annotation" -t "MakeHub" -v "1.0.5-20200210-1ecd6bb" -w "https://github.com/Gaius-Augustus/MakeHub" -l "GPL v3" -d "Fully automated generation of UCSC assembly hubs"
    ./makeroom_MakeHub_1.0.5-20200210-1ecd6bb.sh
    source /sw/bioinfo/MakeHub/SOURCEME_MakeHub_1.0.5-20200210-1ecd6bb
    cd $SRCDIR
    ml bioinfo-tools
    ml git/2.28.0 samtools/1.8 augustus/3.3.3
    git clone https://github.com/Gaius-Augustus/MakeHub
    rmdir $PREFIX
    mv MakeHub $PREFIX
    cd $PREFIX
    git reset --hard $COMMIT
    ln -s /sw/bioinfo/augustus/3.3.3/rackham/bin/bam2wig .

Load samtools/1.8 and augustus/3.3.3.
