cellranger-ATAC-data/1.2.0
==========================

A data module for Cell Ranger ATAC data version 1.2.0.

LOG
---

    cd /sw/data/Chromium
    mkdir cellranger-ATAC-data
    cd cellranger-ATAC-data
    mkdir mf
    mkdir 1.2.0
    cd 1.2.0/
    mkdir src
    mkdir $CLUSTER
    PREFIX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca milou ; do test -L $CL || ln -s rackham $CL; done
    cd src
    SRCDIR=$PWD
    wget http://cf.10xgenomics.com/supp/cell-atac/refdata-cellranger-atac-GRCh38-1.2.0.tar.gz
    wget http://cf.10xgenomics.com/supp/cell-atac/refdata-cellranger-atac-hg19-1.2.0.tar.gz
    wget http://cf.10xgenomics.com/supp/cell-atac/refdata-cellranger-atac-b37-1.2.0.tar.gz
    wget http://cf.10xgenomics.com/supp/cell-atac/refdata-cellranger-atac-mm10-1.2.0.tar.gz
    wget http://cf.10xgenomics.com/supp/cell-atac/refdata-cellranger-atac-GRCh38-and-mm10-1.2.0.tar.gz
    wget http://cf.10xgenomics.com/supp/cell-atac/refdata-cellranger-atac-hg19-and-mm10-1.2.0.tar.gz 
    wget http://cf.10xgenomics.com/supp/cell-atac/chromium-shared-sample-indexes-plate.csv
    wget http://cf.10xgenomics.com/supp/cell-atac/chromium-shared-sample-indexes-plate.json
    cp -av chromium-shared-sample-indexes-plate.* $PREFIX/
    cd $PREFIX
    for F in $SRCDIR/*.tar.gz ; do
        tar xzvf $F
    done

In the mf file, set `CELLRANGER_ATAC_DATA` and `CELLRANGER_ATAC_DATA_ROOT`.
