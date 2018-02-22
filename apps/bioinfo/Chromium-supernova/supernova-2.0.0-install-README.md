supernova/2.0.0
================

Chromium Supernova assembler

Download: <https://support.10xgenomics.com/de-novo-assembly/software/downloads/latest>

Installation: <https://support.10xgenomics.com/de-novo-assembly/software/pipelines/latest/installation>

As I did for Cellranger, I restructured the directories, previously they were
`/sw/apps/bioinfo/Chromium/supernova/...`, so I lifted supernova to
`Chromium-supernova` and the module is still available under `supernova/xxx`.

I also decoupled the cellranger data version from the module version, since
that is what 10X Genomics did as well.

LOG
---

The long download ticket will expire, but I'll xxx it out nonetheless.  It's
simple to get the download from the 10X Genomics website.

Precompiled Linux 64-bit executables are provided.  Good for all systems.

    TOOL=/sw/apps/bioinfo/Chromium-supernova
    VERSION=2.0.0
    C=rackham   # base cluster

    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    PFX=$PWD/$C
    mkdir src
    cd src
    wget -O supernova-${VERSION}.tar.gz "http://cf.10xgenomics.com/releases/assembly/supernova-${VERSION}.tar.gz?Expires=1518470682&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9hc3NlbWJseS9zdXBlcm5vdmEtMi4wLjAudGFyLmd6IiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNTE4NDcwNjgyfX19XX0_&Signature=aa3rm3BPI1eBmV2lA6JlsZF~KISmRCIOGmk97ZsCt9pNGL6KwFIqfuvz7lLCNSeg-Ff5Da9qbWIND9oW~BwD-iZqk4nb~kjMBubzCQONGWcyRllXXN8~Fijufk0ys34TSjpFQ4InuCO9FEmusid9pwfa6Ke1tioqQ1AZUK5vBOuht6Q9-dXMJT6iRKT2vlgqQRLZXAbQYJjvwuJE4VULu6ZDmeBnJKPpLdh8g6zNYkfR3tqay-FaTynhM1MgNWmONVgr8bsMUZtV1wYXkE2zaKxf9THLJiWsTZWEMr~uAu--2Tx7sQuYVqFAeZMfZIJ-xKBw6p6XCIWD~vtsR-ZMEg__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
    tar xzf supernova-${VERSION}.tar.gz
    mv supernova-${VERSION} $PFX
    cd ..
    for S in milou irma bianca ; do ln -s $C $S; done

The data version 1.0.2 is already available at `/sw/data/uppnex/Chromium/cellranger/`.


According to the installation instructions (see above), just add
`/sw/apps/bioinfo/Chromium-supernova/$VERSION/$C` to `PATH` in the mf file.
After doing that, do `supernova sitecheck` and then `supernova testrun
--id=tiny`, saving output of both.

    module load bioinfo-tools supernova/2.0.0
    cd $TOOL/$VERSION
    supernova sitecheck | tee sitecheck-${CLUSTER}.txt
    supernova testrun --id=tiny | tee testrun-tiny-${CLUSTER}.txt

