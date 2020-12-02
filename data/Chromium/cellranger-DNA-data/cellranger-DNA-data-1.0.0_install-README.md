Chromium Cell Ranger DNA 1.0.0 data
==============================

Available at <https://support.10xgenomics.com/single-cell-dna/software/downloads/latest>.
Explicit build instructions for each dataset are provided there as well.

These data include Sample Index Set Sequences provided by 10X.  We're providing
both the CSV and JSON versions of these.

LOG
---

    mkdir -p /sw/data/Chromium/cellranger-DNA-data
    cd /sw/data/Chromium/cellranger-DNA-data
    VERSION=1.0.0
    mkdir -p $VERSION
    cd $VERSION
    mkdir src

    wget https://cf.10xgenomics.com/supp/cell-dna/refdata-GRCh38-1.0.0.tar.gz
    wget https://cf.10xgenomics.com/supp/cell-dna/refdata-GRCh37-1.0.0.tar.gz
    wget https://cf.10xgenomics.com/supp/cell-dna/refdata-GRCm38-1.0.0.tar.gz

    for F in refdata-GRCh38-1.0.0.tar.gz refdata-GRCh37-1.0.0.tar.gz refdata-GRCm38-1.0.0.tar.gz ; do
        tar xzf $F
        mv $F src/
    done

    wget https://cf.10xgenomics.com/supp/cell-dna/chromium-shared-sample-indexes-plate.csv
    wget https://cf.10xgenomics.com/supp/cell-dna/chromium-shared-sample-indexes-plate.json

