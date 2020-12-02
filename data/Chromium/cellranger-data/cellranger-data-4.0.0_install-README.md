Chromium cellranger 4.0.0 data
==============================

Available at <https://support.10xgenomics.com/single-cell-gene-expression/software/downloads/latest>.
Explicit build instructions for each dataset are provided there as well.

These data include Sample Index Set Sequences provided by 10X.  We're providing
both the CSV and JSON versions of these.

LOG
---

    mkdir -p /sw/data/Chromium/cellranger
    cd /sw/data/Chromium/cellranger
    VERSION=4.0.0
    mkdir -p $VERSION
    cd $VERSION
    mkdir src

    wget https://cf.10xgenomics.com/supp/cell-vdj/refdata-cellranger-vdj-GRCh38-alts-ensembl-4.0.0.tar.gz
    wget https://cf.10xgenomics.com/supp/cell-vdj/refdata-cellranger-vdj-GRCm38-alts-ensembl-4.0.0.tar.gz

    tar xzf refdata-cellranger-vdj-GRCh38-alts-ensembl-4.0.0.tar.gz
    mv refdata-cellranger-vdj-GRCh38-alts-ensembl-4.0.0.tar.gz src/
    tar xzf refdata-cellranger-vdj-GRCm38-alts-ensembl-4.0.0.tar.gz
    mv refdata-cellranger-vdj-GRCm38-alts-ensembl-4.0.0.tar.gz src/

    wget https://cf.10xgenomics.com/supp/cell-vdj/chromium-shared-sample-indexes-plate.csv
    wget https://cf.10xgenomics.com/supp/cell-vdj/chromium-shared-sample-indexes-plate.json
    wget https://cf.10xgenomics.com/supp/cell-vdj/Chromium-i7-Multiplex-Kit-N-Set-A-sample-indexes-plate.csv
    wget https://cf.10xgenomics.com/supp/cell-vdj/Chromium-i7-Multiplex-Kit-N-Set-A-sample-indexes-plate.json

