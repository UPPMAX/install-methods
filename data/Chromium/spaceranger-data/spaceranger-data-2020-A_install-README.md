Chromium spaceranger 2020-A data
==============================

Available at <https://support.10xgenomics.com/spatial-gene-expression/software/downloads/latest>

So far these data only include Visium Sample Dual Index Sets provided by 10X.  We providing
both the CSV and JSON versions of these.  spaceranger references are provided by the
cellranger-data/3.0.0 module.

LOG
---

    mkdir -p /sw/data/Chromium/spaceranger
    VERSION=2020-A
    mkdir -p $VERSION
    cd $VERSION
    mkdir src

    wget https://cf.10xgenomics.com/supp/spatial-exp/refdata-gex-GRCh38-2020-A.tar.gz
    echo 'md5sum should be dfd654de39bff23917471e7fcc7a00cd'
    md5sum refdata-gex-GRCh38-2020-A.tar.gz | tee refdata-gex-GRCh38-2020-A.tar.gz.md5
    tar xzf refdata-gex-GRCh38-2020-A.tar.gz
    mv refdata-gex-GRCh38-2020-A.tar.gz* src/
    wget https://cf.10xgenomics.com/supp/spatial-exp/refdata-gex-mm10-2020-A.tar.gz
    echo 'md5sum should be 886eeddde8731ffb58552d0bb81f533d'
    md5sum refdata-gex-mm10-2020-A.tar.gz | tee refdata-gex-mm10-2020-A.tar.gz.md5
    tar xzf refdata-gex-mm10-2020-A.tar.gz
    mv refdata-gex-mm10-2020-A.tar.gz* src/
    wget https://support.10xgenomics.com/sample_index_sets/Dual_Index_Kit_TT_Set_A.csv
    wget https://support.10xgenomics.com/sample_index_sets/Dual_Index_Kit_TT_Set_A.json

