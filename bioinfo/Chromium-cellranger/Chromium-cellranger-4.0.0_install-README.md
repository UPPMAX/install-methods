Chromium-cellranger/4.0.0
========================

<https://support.10xgenomics.com/single-cell-vdj/software/pipelines/latest/what-is-cell-ranger>

Used under license:
https://support.10xgenomics.com/docs/license


LOG
---

The long download ticket will expire.  It's simple to get the download from the 10X Genomics website.

Precompiled Linux 64-bit executables are provided.  Good for all systems.

    TOOL=Chromium-cellranger
    VERSION=4.0.0
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -m cellranger -v $VERSION -l https://support.10xgenomics.com/docs/license -d "Cell line analysis system" -s sw_collections -w https://support.10xgenomics.com/single-cell-vdj/software/pipelines/latest/what-is-cell-ranger
    ./makeroom_Chromium-cellranger_4.0.0.sh 
    source SOURCEME_Chromium-cellranger_4.0.0
    cd $VERSION
    rmdir $PREFIX  # we will replace this with the unpacked directory
    cd src
    wget -O cellranger-4.0.0.tar.gz "https://cf.10xgenomics.com/releases/cell-vdj/cellranger-4.0.0.tar.gz?Expires=1604696374&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC12ZGovY2VsbHJhbmdlci00LjAuMC50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2MDQ2OTYzNzR9fX1dfQ__&Signature=kKbHmGAeiFFOFUMNonz-LXE47p737KbU-5rmrO-cjUXkTGELke77BK~7yk2ZxBOfQxPTZPaedMOsgIP2-MRZ07Itdh0HgYPK9XSfzrOIXbAVPVG-KwSX2IINZi9HIqrAlBNwmn8px~ly1D4lSxqz16qEhhPblcrIT8yi0WA2cCigkY2qauVhnuD9YzQRaNJHKFcIc1AXqUTsP0mQVNzl0YQ3-QH~1x0e9h--HSRr9vBt1lcfdnfAO-cZYmY~XkJ3ENjY7VrEfLj3VSyk8UZqNtrKj4Xtz2VA56x1jMOLgIfCg5hBs7vB7EkMFwYBMQ-d77fYJjbOPZ6ntNWvWqed4A__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
    tar xzf cellranger-${VERSION}.tar.gz 
    mv cellranger-${VERSION} $PREFIX
    cd ..

There are new data as well, 4.0.0.  Installed as a data module.
