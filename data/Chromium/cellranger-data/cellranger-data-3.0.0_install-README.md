Chromium cellranger 3.0.0 data
==============================

Available at <https://support.10xgenomics.com/single-cell-gene-expression/software/downloads/latest>.
Explicit build instructions for each dataset are provided there as well.

These data include Sample Index Set Sequences provided by 10X.  We're providing
both the CSV and JSON versions of these.

LOG
---

    mkdir -p /sw/data/Chromium/cellranger
    VERSION=3.0.0
    mkdir -p $VERSION
    cd $VERSION
    mkdir src

    wget http://cf.10xgenomics.com/supp/cell-exp/chromium-shared-sample-indexes-plate.csv
    wget http://cf.10xgenomics.com/supp/cell-exp/chromium-shared-sample-indexes-plate.json
    wget http://cf.10xgenomics.com/supp/cell-exp/chromium-single-cell-sample-indexes-plate-v1.csv
    wget http://cf.10xgenomics.com/supp/cell-exp/chromium-single-cell-sample-indexes-plate-v1.json
    wget http://cf.10xgenomics.com/supp/cell-exp/gemcode-single-cell-sample-indexes-plate.csv
    wget http://cf.10xgenomics.com/supp/cell-exp/gemcode-single-cell-sample-indexes-plate.json

    wget http://cf.10xgenomics.com/supp/cell-exp/refdata-cellranger-ercc92-1.2.0.tar.gz
    tar xzf refdata-cellranger-ercc92-1.2.0.tar.gz
    mv refdata-cellranger-ercc92-1.2.0.tar.gz src/

    for DAT in refdata-cellranger-GRCh38-${VERSION}.tar.gz refdata-cellranger-hg19-${VERSION}.tar.gz refdata-cellranger-mm10-${VERSION}.tar.gz refdata-cellranger-hg19-and-mm10-${VERSION}.tar.gz
    do
        wget http://cf.10xgenomics.com/supp/cell-exp/$DAT
        tar xzf $DAT
        mv $DAT src/
    done
