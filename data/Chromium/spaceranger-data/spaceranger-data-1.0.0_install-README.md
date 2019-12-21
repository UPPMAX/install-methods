Chromium spaceranger 1.0.0 data
==============================

Available at <https://support.10xgenomics.com/spatial-gene-expression/software/downloads/latest>

So far these data only include Visium Sample Dual Index Sets provided by 10X.  We providing
both the CSV and JSON versions of these.  spaceranger references are provided by the
cellranger-data/3.0.0 module.

LOG
---

    mkdir -p /sw/data/Chromium/spaceranger
    VERSION=1.0.0
    mkdir -p $VERSION
    cd $VERSION
    mkdir src

    wget https://support.10xgenomics.com/sample_index_sets/Dual_Index_Kit_TT_Set_A.csv
    wget https://support.10xgenomics.com/sample_index_sets/Dual_Index_Kit_TT_Set_A.json

