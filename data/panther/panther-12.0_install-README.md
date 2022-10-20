panther/12.0
============

Panther 12.0 is used by the InterProScan/5.30-69.0 module, the configuration of
which points to this location, and is available here for any other use as well.

<https://www.ebi.ac.uk/interpro/search/sequence-search>

LOG
---

    PANTHERVERSION=12.0
    PANTHERROOT=/sw/data/panther
    mkdir -p $PANTHERROOT
    PANTHERSRC=$PANTHERROOT/src
    mkdir -p $PANTHERSRC
    PANTHERDIR=$PANTHERROOT/$PANTHERVERSION

    cd $PANTHERSRC
    wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-${PANTHERVERSION}.tar.gz
    wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-${PANTHERVERSION}.tar.gz.md5
    md5sum -c panther-data-${PANTHERVERSION}.tar.gz.md5 || echo "*** MD5 check failed"
    tar xzf panther-data-${PANTHERVERSION}.tar.gz
    cd panther
    mv $PANTHERVERSION ../..
    cd ..
    rmdir panther

