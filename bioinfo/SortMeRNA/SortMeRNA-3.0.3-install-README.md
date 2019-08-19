SortMeRNA/3.0.3
===============

Filtering, mapping and picking OTUs from NGS reads.  We do not build the
executables because we don't want to install the RocksDB requirement; RapidJSON
seems to be installed.  We instead use the statically-linked CentOS 6.6
versions.  We *do* build the documentation, include the additional scripts, and
build the rRNA databases.

<https://github.com/biocore/sortmerna>

And an outdated website at <http://bioinfo.lifl.fr/RNA/sortmerna/>


LOG
---

    cd /sw/bioinfo/
    mkdir -p SortMeRNA
    cd SortMeRNA/
    VERSION=3.0.3
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in bianca irma snowy ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src
    #  Get the static executables
    wget https://github.com/biocore/sortmerna/releases/download/v${VERSION}/sortmerna-${VERSION}-Linux_C6_static.zip
    unzip sortmerna-${VERSION}-Linux_C6_static.zip
    #  Get the source tree, unpacks to same dir as the executables
    wget https://github.com/biocore/sortmerna/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz
    cd sortmerna-$VERSION

Install `bin/` (the prebuilt static binaries), `scripts/`, `include/` (since it
was installed by the previous install procedure) and `rRNA_databases/`.

    cp -av bin scripts include rRNA_databases $PFX/

Add the PDF manual.  Note that the PDF manual is produced (following the build
documentation) as a PDF print of the web page.  Tried to build with pandoc/2.2.3.2
but got the error `khtmltopdf not found. Please select a different --pdf-engine or install wkhtmltopdf`.
Maybe in the next pandoc version installed I'll include that.

    cd docs/web
    firefox index.html
    # Print ... > Print to file
    # exit firefox
    mv mozilla.pdf SortMeRNA-User-Manual-${VERSION}.pdf
    mv SortMeRNA-User-Manual-${VERSION}.pdf $PFX/

Index the provided databases.  SortMeRNA doesn't do that
for you during installation and ticket #148389 was inquiring, so why not
provide them.  Also add a note to the mf and set SORTMERNA_FASTA and
SORTMERNA_INDEX to the installed locations.

    cd $PFX
    mkdir sortmerna
    mv rRNA_databases sortmerna/
    cd sortmerna
    mkdir -p index
    for F in rRNA_databases/*.fasta ; do
        I=${F#rRNA_databases/}; I=index/${I%.fasta}
        $PFX/bin/indexdb --ref $F,$I -v 2>&1 | tee $I.indexlog
    done

