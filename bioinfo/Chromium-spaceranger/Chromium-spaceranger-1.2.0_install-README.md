Chromium-spaceranger/1.2.0
========================

<https://support.10xgenomics.com/spatial-gene-expression/software/pipelines/latest/what-is-space-ranger>

Used under license:


Structure creating script (makeroom_Chromium-spaceranger_1.0.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Chromium-spaceranger/makeroom_1.0.0.sh

The module name is spaceranger.


LOG
---

    TOOL=Chromium-spaceranger
    MODULENAME=spaceranger
    VERSION=1.2.0
    cd /sw/bioinfo

    makeroom.sh -f -t ${TOOL} -m ${MODULENAME} -v ${VERSION} -w https://support.10xgenomics.com/spatial-gene-expression/software/pipelines/latest/what-is-space-ranger -c bioinfo -s misc -d "set of analysis pipelines that process Visium spatial RNA-seq output and brightfield microscope images in order to detect tissue, align reads, generate feature-spot matrices, perform clustering and gene expression analysis, and place spots in spatial context on the slide image"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd Chromium-spaceranger/
    source SOURCEME_${TOOL}_${VERSION} 

    cd $VERSION/src
    wget -O spaceranger-${VERSION}.tar.gz "https://cf.10xgenomics.com/releases/spatial-exp/spaceranger-1.2.0.tar.gz?Expires=1605577128&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvc3BhdGlhbC1leHAvc3BhY2VyYW5nZXItMS4yLjAudGFyLmd6IiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNjA1NTc3MTI4fX19XX0_&Signature=L~4zh4ZjT~VEeUqSJ1lXy9lresTuy~CJ8LahlS-RJHKsK8B~iGkBHHc3LpS1qb3e5WopNS1UpTPVBYT-iqrEtZ5hyLeFu9krNqCOuWI0h8zhXOtKVSzLqrM78GIq5bGZ9d1kZc0aU~jxDIoxGXmGhdRbnpti~MgI8s8H7qw24c6jYngn5BBJs4LUpmGdvMhzUlr3FX-BSci2tKiX9nJneWthrlkhnKdJkIKkG9hQ8hVS2rpUN84xDFCAGljskU0v08rHUuUdkjw7DE41y7E7Yvzx6EdKtRIkJLnlYs~6kUbX5yyAmwJFrduHUnmdQWoao0fU1iYPw4PLCeYK0LSldQ__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
    echo "md5 from download site is fc21902700779111afc3c813bbb0ff5e"
    md5sum spaceranger-${VERSION}.tar.gz | tee spaceranger-${VERSION}.tar.gz.md5
    tar xzf spaceranger-${VERSION}.tar.gz 
    rmdir $PREFIX
    mv ${MODULENAME}-${VERSION} $PREFIX

MD5s match.


The reference data they are suggesting for GRCh38 and mm10 seems
to be the same as for `cellranger-data/3.0.0`.  Do the MD5s match?

    md5sum /sw/data/Chromium/cellranger-data/3.0.0/src/refdata-cellranger-GRCh38-3.0.0.tar.gz 
    md5sum /sw/data/Chromium/cellranger-data/3.0.0/src/refdata-cellranger-mm10-3.0.0.tar.gz 

Yes, MD5s match, so load `cellranger-data/3.0.0` with this module.  This is
installed like cellranger, longranger etc. so use the cellranger mf file as a
template.  Include mention of the reference data.

    cd /sw/bioinfo/${TOOL}/mf
    vi ${VERSION}

Rename module and and install mf files

    mv /sw/mf/common/bioinfo-tools/misc/${TOOL} /sw/mf/common/bioinfo-tools/misc/${MODULENAME}
    rsync -Pa ${VERSION} /sw/mf/common/bioinfo-tools/misc/${MODULENAME}/
    all_mflink -f $MODULENAME ${VERSION}


Chromium-spaceranger/1.2.0
========================

<https://support.10xgenomics.com/spatial-gene-expression/software/pipelines/latest/what-is-space-ranger>

Used under license:

<>

Structure creating script (makeroom_Chromium-spaceranger_1.2.0.sh) moved to /sw/bioinfo/Chromium-spaceranger/makeroom_1.2.0.sh

LOG
---

    TOOL=Chromium-spaceranger
    VERSION=1.2.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/Chromium-spaceranger/1.2.0/src
    /home/douglas/bin/makeroom.sh -f" -t "Chromium-spaceranger" -m "spaceranger" -v "1.2.0" -w "https://support.10xgenomics.com/spatial-gene-expression/software/pipelines/latest/what-is-space-ranger" -c "bioinfo" -s "misc" -d "set of analysis pipelines that process Visium spatial RNA-seq output and brightfield microscope images in order to detect tissue\, align reads\, generate feature-spot matrices\, perform clustering and gene expression analysis\, and place spots in spatial context on the slide image"
    ./makeroom_Chromium-spaceranger_1.2.0.sh
