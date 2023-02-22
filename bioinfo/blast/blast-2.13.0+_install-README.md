blast/2.13.0+
=============

<https://blast.ncbi.nlm.nih.gov/Blast.cgi>

Used under license:
Public Domain
<https://www.ncbi.nlm.nih.gov/IEB/ToolBox/CPP_DOC/lxr/source/scripts/projects/blast/LICENSE>

Structure creating script (makeroom_blast_2.13.0+.sh) moved to /sw/bioinfo/blast/makeroom_2.13.0+.sh

LOG
---

We move the unpacked directory to be `$PREFIX`.

    TOOL=blast
    VERSION=2.13.0+
    makeroom.sh -f -t "$TOOL" -v "$VERSION" -w "https://blast.ncbi.nlm.nih.gov/Blast.cgi" -l "Public Domain" -L "https://www.ncbi.nlm.nih.gov/IEB/ToolBox/CPP_DOC/lxr/source/scripts/projects/blast/LICENSE"
    makeroom_${TOOL}_${VERSION}.sh
    cd /sw/bioinfo/${TOOL}
    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR
    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/${VERSION%+}/ncbi-blast-${VERSION}-x64-linux.tar.gz
    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/${VERSION%+}/ncbi-blast-${VERSION}-x64-linux.tar.gz.md5
    md5sum -c ncbi-blast-${VERSION}-x64-linux.tar.gz.md5 || { echo "md5sum failed"; return; }

    tar xf ncbi-blast-${VERSION}-x64-linux.tar.gz
    rmdir $PREFIX
    mv ncbi-blast-${VERSION} $PREFIX


