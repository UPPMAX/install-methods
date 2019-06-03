Chromium longranger 2.1.0 data
==============================

Available at <https://support.10xgenomics.com/genome-exome/software/downloads/latest>
Explicit build instructions for each dataset are provided there as well.

These data include Sample Index Set Sequences provided by 10X.  We're providing
both the CSV and JSON versions of these.

LOG
---

    mkdir -p /sw/data/uppnex/Chromium/longranger
    VERSION=2.1.0
    mkdir -p $VERSION
    cd $VERSION

    wget --timestamping http://cf.10xgenomics.com/supp/genome/chromium-dna-sample-indexes-plate.csv
    wget --timestamping http://cf.10xgenomics.com/supp/genome/chromium-dna-sample-indexes-plate.json
    wget --timestamping http://cf.10xgenomics.com/supp/genome/lariat-degen-regions-1.2.0.bed

    mkdir src
    cd src

    for GENOME in hg19 b37 GRCh38
    do
        REMOTE_GENOME=refdata-${GENOME}-${VERSION}
        echo -c "Working on $GENOME, with remote name $REMOTE_GENOME ... "
        wget --timestamping http://cf.10xgenomics.com/supp/genome/$REMOTE_GENOME.tar.gz
        tar xzf $REMOTE_GENOME.tar.gz
        mv ${REMOTE_GENOME} ..
        ( cd .. ; ln -s $REMOTE_GENOME $GENOME )
        echo "done."
    done

