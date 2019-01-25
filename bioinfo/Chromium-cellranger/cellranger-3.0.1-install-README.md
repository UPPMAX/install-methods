cellranger/3.0.1
================

Chromium Cell Ranger

<https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/installation>

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
    VERSION=3.0.1
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget -O cellranger-3.0.1.tar.gz "http://cf.10xgenomics.com/releases/cell-exp/cellranger-3.0.1.tar.gz?Expires=1546912527&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9jZWxsLWV4cC9jZWxscmFuZ2VyLTMuMC4xLnRhci5neiIsIkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTU0NjkxMjUyN319fV19&Signature=V15Aw9NjAb5A9ZYGGDk4084HuFFvn35ip1Ix1AIBopCnjqgcQtZIsqwFXC8F-4z-ZFeEkL6iu9LNGkIagCmXz3XGBfUkH77gsxRWwJpHyJ5hkH-eXCPiWmZqycx-SjnFTvQDA949hHJgHa6qtItIfJgIi24CkgqqEMX0K3Q9sbd1-6H6xv~H2LGYLt3srw-oNuQHSUScbYFfMSEqxwKNVLT1omI7hKkRvJxw8Zb4w~T8lUnEznuDRs-oFeLc5Qzj4sPMyk7JPV8oGXgLLFZi08VJgkJtJtUJeNY92z68987g9zT7hHtRVhfkjvtohIa5o3pKjXzdq4e30ULMSNXmow__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
    tar xzf cellranger-${VERSION}.tar.gz 
    mv cellranger-${VERSION} ../rackham
    cd ..
    for S in snowy irma bianca ; do ln -fs rackham $S; done

Seems there's a new data version, 3.0.0, so I'll install that as well.

The data version 1.0.2 is already available at `/sw/data/uppnex/Chromium/cellranger/`.

