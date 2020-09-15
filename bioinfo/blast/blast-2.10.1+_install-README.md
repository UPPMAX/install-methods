blast/2.9.0+
============

LOG
---

We move the unpacked directory to be `$PREFIX`.

    VERSION=2.10.1+
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
    cd ../mf
    cp 2.9.0+ 2.10.1+
    cp 2.10.1 /sw/mf/common
    all_mflink -f -i blast 2.10.1+
    fixup /sw/bioinfo/blast/2.10.1+

    echo "News:"
    echo "[bio] blast/2.10.1+ installed on all systems" 1>&2
    echo "BLAST finds regions of similarity between biological sequences. The program compares nucleotide or protein sequences to sequence databases and calculates the statistical significance. this is the 2.10.1+ update of the local BlastDB tool " 1>&2
    echo "https://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download" 1>&2
    echo "rackham, irma, bianca, snowy" 1>&2
    echo "2.10.1+" 1>&2

