cellranger/2.20
================

Chromium Cell Ranger

<https://support.10xgenomics.com/single-cell-gene-expression/software/downloads/latest>

Note: I restructured the directories, previously they were
`/sw/apps/bioinfo/Chromium/cellranger/...`, so I lifted cellranger to
`Chromium-cellranger`.

I also decoupled the cellranger data version from the module version, since
that is what 10X Genomics did as well.

LOG
---

The long download ticket will expire, but I'll xxx it out nonetheless.  It's
simple to get the download from the 10X Genomics website.

Precompiled Linux 64-bit executables are provided.  Good for all systems.

    TOOL=/sw/apps/bioinfo/Chromium-cellranger
    VERSION=2.2.0
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    cellranger-2.2.0.tar.gz "http://cf.10xgenomics.com/releases/cell-exp/cellranger-2.2.0.tar.gz?Expires=1534467495&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9jZWxsLWV4cC9jZWxscmFuZ2VyLTIuMi4wLnRhci5neiIsIkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTUzNDQ2NzQ5NX19fV19&Signature=dCLhqHeckJDIMHSjDNbmWIh9or-gs055SZCr6EHd9bmKO14ZYQy~oLTVkYO6b8Okdw8FQND~BJABzf8x17K2tlH4DC7iEztmId5MVEgqduLQ68bKT9fUgHcQWtFSbVNp8nGkc7AorHlFuWm2qLFU6jWVTIdA3OI2SRMnVdjeQhk6oMOZL~ilkL-rdbd5ueO2Ff88J0R-b55DUTAhrQrs-0Aff60NVH9xBSptB~3MU4QL23moK~EV1q~4ex1l5QVyi9-rmHxo3glsAqNErWmToiJCf5SOWN-XyxvDd4f5KY5Emgo9JZKbHRgqZ5ELGoDJivFPFVNmLJqUvMQUfJNYAQ__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
    tar xzf cellranger-2.2.0.tar.gz 
    mv cellranger-2.2.0 ../rackham
    cd ..
    for S in irma bianca ; do ln -fs rackham $S; done

The data version 1.0.2 is already available at `/sw/data/uppnex/Chromium/cellranger/`.

