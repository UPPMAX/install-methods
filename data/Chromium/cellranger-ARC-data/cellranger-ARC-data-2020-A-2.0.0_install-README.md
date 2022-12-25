Chromium Cell Ranger ARC 2020-A data
==============================

Available at <https://support.10xgenomics.com/single-cell-multiome-atac-gex/software/downloads/latest>
Explicit build instructions for each dataset are provided there as well.

LOG
---

    mkdir -p /sw/data/Chromium/cellranger-ARC-data
    cd /sw/data/Chromium/cellranger-ARC-data
    VERSION=2020-A-2.0.0
    mkdir -p $VERSION
    cd $VERSION
    mkdir src 

    wget https://cf.10xgenomics.com/supp/cell-arc/refdata-cellranger-arc-GRCh38-${VERSION}.tar.gz
    wget https://cf.10xgenomics.com/supp/cell-arc/refdata-cellranger-arc-mm10-${VERSION}.tar.gz

    for F in refdata-cellranger-arc-GRCh38-${VERSION}.tar.gz refdata-cellranger-arc-mm10-${VERSION}.tar.gz
    do
        tar xzf $F
        mv $F src/
    done

