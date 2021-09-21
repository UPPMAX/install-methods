cellranger-ATAC-data/1.2.0
==========================

A data module for Cell Ranger ATAC data version 2.0.0.

LOG
---
    TOOL=cellranger-ATAC-data
    VERSION=2.0.0
    PREFIX=/sw/data/Chromium/${TOOL}/${VERSION}/rackham
    SRCDIR=/sw/data/Chromium/${TOOL}/${VERSION}/src
    mkdir -p $PREFIX $SRCDIR
    cd $SRCDIR
    wget https://cf.10xgenomics.com/supp/cell-atac/refdata-cellranger-arc-GRCh38-2020-A-2.0.0.tar.gz
    wget https://cf.10xgenomics.com/supp/cell-atac/refdata-cellranger-arc-mm10-2020-A-2.0.0.tar.gz
    wget https://cf.10xgenomics.com/supp/cell-atac/refdata-cellranger-atac-GRCh38-and-mm10-2020-A-2.0.0.tar.gz
    wget https://cf.10xgenomics.com/supp/cell-atac/chromium-shared-sample-indexes-plate.csv
    wget https://cf.10xgenomics.com/supp/cell-atac/chromium-shared-sample-indexes-plate.json

    cp -av chromium-shared-sample-indexes-plate.* $PREFIX/
    cd $PREFIX
    for F in $SRCDIR/*.tar.gz ; do
        tar xzvf $F &
    done
In the mf file, set `CELLRANGER_ATAC_DATA` and `CELLRANGER_ATAC_DATA_ROOT`.

Copy the mf file to the correct place. Stole it from post_install.
#    cp -av /sw/data/Chromium/cellranger-ATAC-data/mf/2.0.0 /sw/mf/common/data/cellranger-ATAC-data/2.0.0
#    all_mflink -f -d cellranger-ATAC-data 2.0.0

    TOOLDIR="/sw/data/Chromium/cellranger-ATAC-data"
    chgrp 'sw' ${TOOLDIR}  
############### 2775 = g+s,u+rwX,g+rwX,o+rX-w
    chmod 2775 ${TOOLDIR}
    find ${TOOLDIR} -maxdepth 1 -type f -exec chgrp "sw" {} \;
    fixup ${TOOLDIR}/mf
    fixup ${TOOLDIR}/2.0.0 
    cp -av ${TOOLDIR}/mf/2.0.0 /sw/mf/common/data/cellranger-ATAC-data/2.0.0
    all_mflink -f -i cellranger-ATAC-data 2.0.0 
    chgrp -h 'sw' ${TOOLDIR}


