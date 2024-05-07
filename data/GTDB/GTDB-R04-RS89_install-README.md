GTDB/R04-RS89
========================

<https://gtdb.ecogenomic.org>

Used under unknown license.

These database versions, this is version 04, are also linked to a RefSeq release number, this is 89.

Structure creating script (makeroom_GTDB_R04-RS89.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/data/GTDB/makeroom_R04-RS89.sh

Each of 

LOG
---

    TOOL=GTDB
    GTDB_VERSION=04
    REFSEQ_RELEASE=89
    VERSION=R${GTDB_VERSION}-RS${REFSEQ_RELEASE}
    ./makeroom_GTDB_R04-RS89.sh
    cd /sw/data/$TOOL
    source SOURCEME_${TOOL}_${VERSION}  # this sets TOOLDIR, PREFIX, etc
    cd /sw/data/$TOOL/$VERSION/src
    echo "mget -c gtdbtk_r${REFSEQ_RELEASE}_data.tar.gz*" | lftp https://data.ace.uq.edu.au/public/gtdbtk/release_${REFSEQ_RELEASE}/${REFSEQ_RELEASE}.0
    md5sum -c gtdbtk_r${REFSEQ_RELEASE}_data.tar.gz.md5 && tar xzvf gtdbtk_r${REFSEQ_RELEASE}_data.tar.gz && mv release_${REFSEQ_RELEASE} $PREFIX/

