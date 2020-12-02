Chromium-cellranger-ARC/1.0.0
========================

<https://support.10xgenomics.com/single-cell-multiome-atac-gex/software/downloads/latest>

Used under license:
https://support.10xgenomics.com/docs/license


LOG
---

The long download ticket will expire.  It's simple to get the download from the 10X Genomics website.

Precompiled Linux 64-bit executables are provided.  Good for all systems.

    TOOL=Chromium-cellranger-ARC
    VERSION=1.0.0
    makeroom.sh -f -t $TOOL -m cellranger-ARC -v $VERSION -l https://support.10xgenomics.com/docs/license -d "Cell Ranger single-cell multiome ATAC + Gene Exp." -s sw_collections -w https://support.10xgenomics.com/single-cell-multiome-atac-gex/software/downloads/latest
    ./makeroom_Chromium-cellranger-ARC_1.0.0.sh 
    cd /sw/bioinfo/Chromium-cellranger-ARC/
    source SOURCEME_Chromium-cellranger-ARC_1.0.0 
    cd $VERSION
    rmdir $PREFIX  # we will replace this with the unpacked directory
    cd src
    wget -O cellranger-arc-1.0.0.tar.gz "https://cf.10xgenomics.com/releases/cell-arc/cellranger-arc-1.0.0.tar.gz?Expires=1604705956&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1hcmMvY2VsbHJhbmdlci1hcmMtMS4wLjAudGFyLmd6IiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNjA0NzA1OTU2fX19XX0_&Signature=LNJni17PB8TO-CmaTF3L-w8Cbnr2CDNJSLtADw75SzGrkIFZ86KFmXWO78ztKD7oBVQeLBWUZXb~m6jXjTnXqv~wMxWRkedsYGswEBRBccrsWucTKRDq93kjAosZ3mnR9ApvIfHgJFE0fnhoQaZzo5mL3uFpfG0wRJjUZNBgz5itj8fAkqXNdMx4-1kA5aUHnK~17MtzWL009fNHd7xsDyodx5PogsgFv5M~74UNSY-yCFe95iioqvtYCsehTt6rNFG7OBauh~RXWFSpUd7341VtaeyCQUCSOSsnZHJIgb52gURdn4jKGonnbQvHp8j0dxZ-qfoLni8M4o76tSWPRQ__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
    tar xzf cellranger-arc-${VERSION}.tar.gz 
    mv cellranger-arc-${VERSION} $PREFIX
    cd ..


There are data as well, install as the data module cellranger-ARC-data/2020-A

