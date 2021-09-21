Chromium-cellranger-ATAC/2.0.0
========================

<https://support.10xgenomics.com/single-cell-atac/software/downloads/latest>

Used under license:
Misc non-commercial


Structure creating script (makeroom_Chromium-cellranger-ATAC_2.0.0.sh) moved to /sw/bioinfo/Chromium-cellranger-ATAC/makeroom_2.0.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "Chromium-cellranger-ATAC" -v "2.0.0" -m "cellranger-ATAC" -l "Misc non-commercial" -w "https://support.10xgenomics.com/single-cell-atac/software/downloads/latest" -d "et of analysis pipelines that process Chromium Single Cell ATAC data" -f
    ./makeroom_Chromium-cellranger-ATAC_2.0.0.sh

    TOOL=Chromium-cellranger-ATAC
    VERSION=2.0.0
    cd /sw/bioinfo/${TOOL}
    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR
    curl -o cellranger-atac-2.0.0.tar.gz
    "https://cf.10xgenomics.com/releases/cell-atac/cellranger-atac-2.0.0.tar.gz?Expires=1625188316&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1hdGFjL2NlbGxyYW5nZXItYXRhYy0yLjAuMC50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2MjUxODgzMTZ9fX1dfQ__&Signature=Y3S0uPwHXQkBTuE8fXxMSdne4OnT-zlA6sy2atZhps8k~FPKmklG1X-Gj9dpuGG05CmF4OozXfJrkSFPBgWHxEF4a64cxS5z~tMputjkP9WdrSynpmwuXJ4rmaFHCTHwdz1AKc-6vA4I~TcGZcP8my52ils-W54FIL6vUqyC4yzaFAaeY0CJ7o-XHqVm1iq-MnFsq-ELON~VHyhtNDcblVeUOLoE6LBo9ootuPG3fiZ~N-z3CZqc8~MFgc6wBGhg9IPkYp45l0Hbge47kCKWxxfnxbCbh1W7ISSjRXjN0vd6xjfthKdudUZIjnfTrM4JwB6mTDrJ~GgZqtpGZqDkIA__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
    tar xfvz cellranger-atac-2.0.0.tar.gz
    rmdir $PREFIX
    mv cellranger-atac-${VERSION} $PREFIX
    cd $PREFIX
    cellranger testrun --id=tiny





Chromium-cellranger-ATAC/1.2.0
========================

<https://support.10xgenomics.com/single-cell-atac/software/pipelines/latest/what-is-cell-ranger-atac>

Used under license:
Misc non-commercial

Structure creating script (makeroom_Chromium-cellranger-ATAC_1.2.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Chromium-cellranger-ATAC/makeroom_1.2.0.sh

LOG
---

    TOOL=Chromium-cellranger-ATAC
    VERSION=1.2.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_Chromium-cellranger-ATAC_1.2.0.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    wget http://
    tar xvf 
    make

