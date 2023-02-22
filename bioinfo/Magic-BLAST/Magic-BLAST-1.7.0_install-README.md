Magic-BLAST/1.7.0
=================

<https://ncbi.github.io/magicblast/>

Used under license:
Public Domain
<https://www.ncbi.nlm.nih.gov/IEB/ToolBox/CPP_DOC/lxr/source/scripts/projects/magicblast/LICENSE>

Structure creating script (makeroom_Magic-BLAST_1.7.0.sh) moved to /sw/bioinfo/Magic-BLAST/makeroom_1.7.0.sh

LOG
---

    TOOL=Magic-BLAST
    VERSION=1.7.0
    makeroom.sh -f -t "$TOOL" -v "$VERSION" -s "alignment" -w "https://ncbi.github.io/magicblast/" -l "Public Domain" -L https://www.ncbi.nlm.nih.gov/IEB/ToolBox/CPP_DOC/lxr/source/scripts/projects/magicblast/LICENSE -d "tool for mapping large next-generation RNA or DNA sequencing runs against a whole genome or transcriptome"
    ./makeroom_${TOOL}_${VERSION}.sh 

    source /sw/bioinfo/${TOOL}/SOURCEME_${TOOL}_${VERSION} && cd $SRCDIR

    wget https://ftp.ncbi.nlm.nih.gov/blast/executables/magicblast/LATEST/ncbi-magicblast-${VERSION}-x64-linux.tar.gz
    wget https://ftp.ncbi.nlm.nih.gov/blast/executables/magicblast/LATEST/ncbi-magicblast-${VERSION}-x64-linux.tar.gz.md5
    md5sum -c ncbi-magicblast-${VERSION}-x64-linux.tar.gz.md5 || { echo "md5sum failed"; return; }

    tar xf ncbi-magicblast-${VERSION}-x64-linux.tar.gz 
    rmdir $PREFIX
    mv ncbi-magicblast-${VERSION} $PREFIX


