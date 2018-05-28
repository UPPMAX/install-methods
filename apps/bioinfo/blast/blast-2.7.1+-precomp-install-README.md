blast/2.7.1+
============

LOG
---

    VERSION=2.7.1+
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir blast
    cd blast
    mkdir $VERSION
    cd $VERSION
    mkdir src
    PFX=$PWD/$CLUSTER
    cd src
    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-${VERSION}-x64-linux.tar.gz
    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-${VERSION}-x64-linux.tar.gz.md5
    md5sum -c ncbi-blast-${VERSION}-x64-linux.tar.gz.md5 || { echo "MD5SUM failed"; return; }
    ncbi-blast-${VERSION}-x64-linux.tar.gz.md5
    tar xzf ncbi-blast-${VERSION}-x64-linux.tar.gz
    mv ncbi-blast-${VERSION} $PFX

