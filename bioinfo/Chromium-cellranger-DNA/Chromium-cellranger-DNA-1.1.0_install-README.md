Chromium-cellranger-DNA/1.1.0
========================

<https://support.10xgenomics.com/single-cell-dna/software/downloads/latest>

Used under license:
https://support.10xgenomics.com/docs/license


LOG
---

The long download ticket will expire.  It's simple to get the download from the 10X Genomics website.

Precompiled Linux 64-bit executables are provided.  Good for all systems.

    TOOL=Chromium-cellranger-DNA
    VERSION=1.1.0
    makeroom.sh -f -t $TOOL -m cellranger-DNA -v $VERSION -l https://support.10xgenomics.com/docs/license -d "Cell Ranger DNA single-cell analysis system" -s sw_collections -w https://support.10xgenomics.com/single-cell-dna/software/downloads/latest
    ./makeroom_Chromium-cellranger-DNA_1.1.0.sh 
    cd /sw/bioinfo/Chromium-cellranger-DNA/
    source SOURCEME_Chromium-cellranger-DNA_1.1.0 
    cd $VERSION
    rmdir $PREFIX  # we will replace this with the unpacked directory
    cd src
    wget -O cellranger-dna-1.1.0.tar.gz "https://cf.10xgenomics.com/releases/cell-dna/cellranger-dna-1.1.0.tar.gz?Expires=1604702238&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1kbmEvY2VsbHJhbmdlci1kbmEtMS4xLjAudGFyLmd6IiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNjA0NzAyMjM4fX19XX0_&Signature=dUfO-UmK2RUfogxPKUVFOOJUZr9sXmfooeXoIB9GUM~f9qypz-8E3k8Q12CHqKUr8Tqo1Psi88Lm6hxfdLbcCFlERtfI93KdnO0vVGbA0-sbYnMBfCZKKsfypnaPIviKCBk4UPH1zo0LOOZMn8JL2dbzouH2WxQMGavsO90rM8gzjyxOx0C9yw8Ln--uWbxLrogK-8fNCECCTyhBGEoCXlo3H0Hb1EQEKdY1l11Fb8DgJxvEHvOVap4Fy~juDyROTkjrKXKaEUyNvsS3-gbCDepYidA0uJguJ3iW2u72KTNiWBoCN2mVufH8brKda~txRVniFfXLuSvtYq7BHmRYzA__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA" 
    tar xzf cellranger-dna-${VERSION}.tar.gz 
    mv cellranger-dna-${VERSION} $PREFIX
    cd ..


There are data as well, install as the data module cellranger-DNA-data/1.0.0.

