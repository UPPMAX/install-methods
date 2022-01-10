Chromium-cellranger/6.1.2
========================

<https://support.10xgenomics.com/single-cell-vdj/software/pipelines/latest/what-is-cell-ranger>

Used under license:
https://support.10xgenomics.com/docs/license


Structure creating script (makeroom_Chromium-cellranger_6.1.2.sh) moved to /sw/bioinfo/Chromium-cellranger/makeroom_6.1.2.sh

LOG
---

    makeroom.sh -t "Chromium-cellranger" -v "6.1.2" -l "https://support.10xgenomics.com/docs/license" -d "Cell line analysis system" -w "https://support.10xgenomics.com/single-cell-vdj/software/pipelines/latest/what-is-cell-ranger" -m "cellranger" -f
    ./makeroom_Chromium-cellranger_6.1.2.sh


    TOOL=Chromium-cellranger
    VERSION=6.2.1
    cd /sw/bioinfo/$TOOL
    source SOURCEME_Chromium-cellranger_6.2.1
    cd $SRCDIR

      curl -o cellranger-6.1.2.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-6.1.2.tar.gz?Expires=1638575082&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1leHAvY2VsbHJhbmdlci02LjEuMi50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2Mzg1NzUwODJ9fX1dfQ__&Signature=L2FURqd5byU6C0CRyBFUiiY2TeVn7o~Jgwvl6umhZj7Oy5xg5F1ADqH1mOpASSN2LezazITMN~YetMiOuUfA9f2K-zjhQCWVovnlgEUSkX0lVnAO7Dx6CDiGE0BcY~MopBSbD9Dlas0q4H92vvwbXvOeXHK-KXUEmoeXNySlWDezSBIGWjkFRu5r7c1RTemZSm3wQTqNwdgzzPTt8IKHHvQL80htiw19zfDA8vdI5Z-N5qEgx-2UGYIrhZk-SH4ucIKkA9XutBShN5~p9ntZDQWh8EiMR47cTzhbG7eaKHWHNT5Gi3yWLwLv0RuekCBDKuZI7NAGqXCypnE4YKe-Kg__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
    tar xzf cellranger-${VERSION}.tar.gz 
    rmdir $PREFIX
    mv cellranger-${VERSION} $PREFIX
    cd $PREFIX
    cellranger testrun --id=tiny


6.2.1 uses the same databases as 5.0.1



