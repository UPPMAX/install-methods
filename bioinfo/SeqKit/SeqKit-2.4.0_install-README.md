SeqKit/2.4.0
========================

<https://bioinf.shenwei.me/seqkit/>

Used under license:
MIT


Structure creating script (makeroom_SeqKit_2.4.0.sh) moved to /sw/bioinfo/SeqKit/makeroom_2.4.0.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "SeqKit" "-v" "2.4.0" "-w" "https://bioinf.shenwei.me/seqkit/" "-c" "bioinfo" "-l" "MIT" "-d" "A cross-platform and ultrafast toolkit for FASTA/Q file manipulation"
    ./makeroom_SeqKit_2.4.0.sh
SeqKit/0.15.0
========================

<https://bioinf.shenwei.me/seqkit/>

Used under license:
MIT license
<>

Structure creating script (makeroom_SeqKit_0.15.0.sh) moved to /sw/bioinfo/SeqKit/makeroom_0.15.0.sh

LOG
---

    TOOL=SeqKit
    VERSION=0.15.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/SeqKit/0.15.0/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "SeqKit" -v "0.15.0" -w "https://bioinf.shenwei.me/seqkit/" -c "bioinfo" -l "MIT license" -d "A cross-platform and ultrafast toolkit for FASTA/Q file manipulation" -s "misc" -x "INSTALL"
    ./makeroom_SeqKit_0.15.0.sh
    cd $SRCDIR
    wget https://github.com/shenwei356/seqkit/releases/download/v0.15.0/seqkit_linux_amd64.tar.gz
    gunzip seqkit_linux_amd64.tar.gz
    tar -xvf seqkit_linux_amd64.tar
    ./seqkit version
    mv seqkit ../rackham/

