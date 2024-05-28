seqmonk-1.37.1-install-README.md
================================

<http://www.bioinformatics.babraham.ac.uk/projects/seqmonk/>

LOG
---

We install using `CLUSTER=milou` since it doesn't matter, it's java.  We also download the compiled version and move the unzip directory to `CLUSTER`.

    cd /sw/apps/bioinfo/seqmonk
    VERSION=1.37.1
    CLUSTER=milou
    mkdir $VERSION
    cd src
    wget http://www.bioinformatics.babraham.ac.uk/projects/seqmonk/seqmonk_v${VERSION}.zip
    unzip seqmonk_v1.37.1.zip 
    mv SeqMonk ../$VERSION/$CLUSTER
    cd ../$VERSION/$CLUSTER
    chmod +x seqmonk seqmonk_import
    cd ..
    ln -s ./milou bianca
    ln -s ./milou irma
    ln -s ./milou rackham
