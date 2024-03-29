Chromium-cellranger/6.0.2
========================

<https://support.10xgenomics.com/single-cell-vdj/software/pipelines/latest/what-is-cell-ranger>

Used under license:
https://support.10xgenomics.com/docs/license


Structure creating script (makeroom_Chromium-cellranger_6.0.2.sh) moved to /sw/bioinfo/Chromium-cellranger/makeroom_6.0.2.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "Chromium-cellranger" -v "6.0.2" -l "https://support.10xgenomics.com/docs/license" -d "Cell line analysis system" -w "https://support.10xgenomics.com/single-cell-vdj/software/pipelines/latest/what-is-cell-ranger" -m "cellranger" -f"
    ./makeroom_Chromium-cellranger_6.0.2.sh

    TOOL=Chromium-cellranger
    VERSION=5.0.1
    cd /sw/bioinfo/$TOOL
    source SOURCEME_Chromium-cellranger_6.0.2
    cd $SRCDIR
    wget -O cellranger-${VERSION}.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-6.0.2.tar.gz?Expires=1625090828&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1leHAvY2VsbHJhbmdlci02LjAuMi50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2MjUwOTA4Mjh9fX1dfQ__&Signature=llRG-66KFSK3GZPPLBFg-GOTeDfjDXD0kdghEmXoR0nLMbbBTkrgbxt~eeozDXC0WfVWae83SAz2G2alf1BI4ceQZj6BeCMU~~zOu6hcpXbcgMmIeaibzmOj28F2Z1hqrdeHxWR091DXwEndVw2Bot4z~dLXxCPZdt6NWcPhkehJUtbDz0FvgEf13yZvkWiz2Gl0tnJwRUlusGMU166E3DZHPmwNrpFZ2ODfuBLUWe4pixv~sme0Fhuj245QZVNzMDhoJPj9Kw6BsmF0FVV5~XQ7EBHVkJ~hI7JEROVQhlNP13vgtrgQHYON~jjbWs699FEgOSVitZcdP1Bs4ZQ5Ng__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"

    tar xzf cellranger-${VERSION}.tar.gz 
    rmdir $PREFIX
    mv cellranger-${VERSION} $PREFIX
    cd $PREFIX
    cellranger testrun --id=tiny


6.0.2 uses the same databases as 5.0.1






Chromium-cellranger/5.0.1
========================

<https://support.10xgenomics.com/single-cell-vdj/software/pipelines/latest/what-is-cell-ranger>

Used under license:
https://support.10xgenomics.com/docs/license

Structure creating script (makeroom_Chromium-cellranger_5.0.1.sh) moved to /sw/bioinfo/Chromium-cellranger/makeroom_5.0.1.sh

LOG
---

    TOOL=Chromium-cellranger
    VERSION=5.0.1
    makeroom.sh -t "Chromium-cellranger" -v "5.0.1" -l "https://support.10xgenomics.com/docs/license" -d "Cell line analysis system" -s "sw_collections" -w "https://support.10xgenomics.com/single-cell-vdj/software/pipelines/latest/what-is-cell-ranger" -c "bioinfo" -f
    ./makeroom_Chromium-cellranger_5.0.1.sh

##Precompiled Linux 64-bit executables are provided.  Good for all systems.

    cd /sw/bioinfo/$TOOL
    source SOURCEME_Chromium-cellranger_5.0.1
    cd $VERSION
    rmdir $PREFIX  # we will replace this with the unpacked directory
    cd src
    wget -O cellranger-5.0.1.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-5.0.1.tar.gz?Expires=1611262784&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1leHAvY2VsbHJhbmdlci01LjAuMS50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2MTEyNjI3ODR9fX1dfQ__&Signature=nio0OBa72oKJ4HodCdZHiAG--8hufsvtWotdifFr-gIYXnP308wcOGSS-oTU9qVYujdX04Dw9JjsB3JlI5e05ge108vo1Qk~BtLz7qaaCl6to3dV2XA4A7AOv9M5QAFiTsdkMQZytktJ~VzMA2KEZy84QZRm6Qm-aDByEUb0ZPUQUlfZFFJbsEUK4vmHaKe31z-l1BTMEGbKNIIE76XACnv9kLy8Q2HGZBMFOKj7sDuzgFn25gcvzsEblqnuhSaW3LRnWM3Ep4ZgmXRTKp9IlAMIU1qm51kPFwI6xh6g32lG5gs69MoTtLiwzyicJ2dRZNA~XlXaEPZYcTiMspBQ2g__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
    tar xzf cellranger-${VERSION}.tar.gz 
    mv cellranger-${VERSION} $PREFIX
# test
    cellranger testrun --id=tiny

# There are new data as well, 5.0.0.  Installed as a data module and loaded automatically.
