blast/2.9.0+
============

LOG
---

We move the unpacked directory to be `$PREFIX`.

    VERSION=2.9.0+
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/bioinfo
    mkdir blast
    cd blast
    mkdir $VERSION
    cd $VERSION
    mkdir src
    for CL in irma bianca snowy ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    PREFIX=$PWD/$CLUSTER
    cd src
    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/${VERSION%+}/ncbi-blast-${VERSION}-x64-linux.tar.gz
    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/${VERSION%+}/ncbi-blast-${VERSION}-x64-linux.tar.gz.md5
    md5sum -c ncbi-blast-${VERSION}-x64-linux.tar.gz.md5 || { echo "MD5SUM failed"; return; }
    ncbi-blast-${VERSION}-x64-linux.tar.gz.md5
    tar xzf ncbi-blast-${VERSION}-x64-linux.tar.gz
    mv ncbi-blast-${VERSION} $PREFIX

