Chromium-cellranger-ARC/2.0.2
========================

<http://>

Used under license:
https://support.10xgenomics.com/docs/license


Structure creating script (makeroom_Chromium-cellranger-ARC_2.0.2.sh) moved to /sw/bioinfo/Chromium-cellranger-ARC/makeroom_2.0.2.sh

LOG
---

The long download ticket will expire.  It's simple to get the download from the 10X Genomics website.

Precompiled Linux 64-bit executables are provided.  Good for all systems.

    TOOL=Chromium-cellranger-ARC
    VERSION=2.0.2
    makeroom.sh -f -t $TOOL -m cellranger-ARC -v $VERSION -l https://support.10xgenomics.com/docs/license -d "Cell Ranger single-cell multiome ATAC + Gene Exp." -s sw_collections -w https://support.10xgenomics.com/single-cell-multiome-atac-gex/software/downloads/latest
    ./makeroom_Chromium-cellranger-ARC_2.0.2.sh 
    cd /sw/bioinfo/Chromium-cellranger-ARC/
    source SOURCEME_Chromium-cellranger-ARC_2.0.2 
    cd $VERSION
    rmdir $PREFIX  # we will replace this with the unpacked directory
    cd src
    wget -O cellranger-arc-2.0.2.tar.gz "https://cf.10xgenomics.com/releases/cell-arc/cellranger-arc-2.0.2.tar.gz?Expires=1671653680&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1hcmMvY2VsbHJhbmdlci1hcmMtMi4wLjIudGFyLmd6IiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNjcxNjUzNjgwfX19XX0_&Signature=O8pYtxTUIDJIUruFqYyN8KsYfyMeYMEHocIFTZ93AUiQw-FunK4yuY3Y8~mxVUMjrduD2xlMm1sT43KKBrHZ-LgCi9X-Y8dqHZEAyNoFK8SYZKds3tuBm6C9Mz-yVC9nvMpap6ipNF2DVk0EPG2fXagUliCOPI8Gm5Z9oo7b-Kam8YNk7lC6SL~1Iei5Jr3yjX6FE2J-Dq4PZauXsVCU8ci5HCgVnbDp2KaGN6y9hDTv9-SGePeByojJ5dVhGhUuaXP~1c8K71yWmJbpwbaEq1JRZiguMhfjCCd2KNx0-hABD5iPtmCf8sg7UvNF1XTjLjcRHNv19T93GssJJ9bThA__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
    tar xzf cellranger-arc-${VERSION}.tar.gz 
    mv cellranger-arc-${VERSION} $PREFIX
    cd ..


There are data as well, install as the data module cellranger-ARC-data/2020-A

