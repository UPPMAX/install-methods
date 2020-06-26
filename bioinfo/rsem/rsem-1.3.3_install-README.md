rsem/1.3.3
==========

<https://github.com/deweylab/RSEM>

Used under license:
GPL v3

Structure creating script (makeroom_rsem_1.3.3.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/rsem/makeroom_1.3.3.sh

LOG
---

    TOOL=rsem
    VERSION=1.3.3
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f" -t $TOOL -v $VERSION -w "https://github.com/deweylab/RSEM" -s "misc" -l "GPL v3" -d "accurate quantification of gene and isoform expression from RNA-Seq data"
    ./makeroom_rsem_1.3.3.sh
    source SOURCEME_${TOOL}_${VERSION}

    cd $VERSION
    cd src
    wget https://github.com/deweylab/RSEM/archive/v$VERSION.tar.gz
    tar xf v$VERSION.tar.gz
    cd RSEM-$VERSION
    module load gcc/6.4.0
    make
    make install prefix=$PREFIX


Add `$modroot/bin` added to `PATH`.
