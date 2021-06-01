SortMeRNA/4.3.3
========================

<https://github.com/biocore/sortmerna>

Used under license:

<>

Structure creating script (makeroom_SortMeRNA_4.3.3.sh) moved to /sw/bioinfo/SortMeRNA/makeroom_4.3.3.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "SortMeRNA" -v "4.3.3" -w "https://github.com/biocore/sortmerna" -f
    ./makeroom_SortMeRNA_4.3.3.sh
    TOOL=SortMeRNA
    version=4.3.3
    source /sw/bioinfo/${TOOL}/SOURCEME_${TOOL}_${version}

    cd $PREFIX
    mkdir sortmerna
    wget https://github.com/biocore/sortmerna/releases/download/v4.3.3/sortmerna-4.3.3-Linux.tar.gz
    tar xfvz sortmerna-4.3.3-Linux.tar.gz --strip=1 && rm sortmerna-4.3.3-Linux.tar.gz

    cd $SRCDIR
    wget https://github.com/biocore/sortmerna/archive/refs/tags/v4.3.3.tar.gz
    tar xfvz v4.3.3.tar.gz --strip=1 && rm v4.3.3.tar.gz
    mkdir rRNA_databases
    cp -r data/rRNA_databases/ ${PREFIX}/sortmerna/rRNA_databases
    cp -r include $PREFIX


Indexing will occur on the fly in 4.3.3. Just in case I will do the indexing. The index files got their names changed and I changed them back by hand. Since the manual is not available I do not know if this is needed any more.
    PATH=${PREFIX}/bin:${PATH}
    cd ${PREFIX}/sortmerna/rRNA_databases
    for F in *.fasta ; do
        sortmerna --index 1 --workdir run --ref $F 2>&1 | tee $F.indexlog &
    done
    cd run/idx/
    rename -v 2169995244134016533 rfam-5.8s-database-id98 * 
    rename -v 13019673092862722585 rfam-5s-database-id98
    rename -v 13019673092862722585 rfam-5s-database-id98 *
    rename -v 3436099190853847617 silva-arc-16s-id95 *
    rename -v 3400685301612210653 silva-arc-23s-id98 *
    rename -v 17299952793705614139 silva-bac-23s-id98 *
    rename -v 2700646386527218729 silva-euk-18s-id95 *
    rename -v 1845323523482939374 silva-euk-28s-id98 *
    rename -v 15734375058464002811 silva-bac-16s-id90 *
    mkdir /sw/bioinfo/SortMeRNA/4.3.3/rackham/sortmerna/index
    cp * /sw/bioinfo/SortMeRNA/4.3.3/rackham/sortmerna/index


The reference data is in the source. But now there is now a tar file with more data. Since there is no manual I will just add them to the rRna_database
    cd ${PREFIX}/sortmerna/rRNA_databases
    wget https://github.com/biocore/sortmerna/releases/download/v4.3.3/database.tar.gz
    tar xfvz database.tar.gz  && rm database.tar.gz








SortMeRNA/4.2.0
========================

<https://github.com/biocore/sortmerna>

Used under license:
GPLv3
<https://github.com/biocore/sortmerna/blob/master/LICENSE.txt>

Structure creating script (makeroom_SortMeRNA_4.2.0.sh) moved to /sw/bioinfo/SortMeRNA/makeroom_4.2.0.sh

LOG
---

    /home/jonass/uppmax/install-methods/makeroom.sh -t "SortMeRNA" -w "https://github.com/biocore/sortmerna" -v "4.2.0" -l "GPLv3" -L "https://github.com/biocore/sortmerna/blob/master/LICENSE.txt" -d "SortMeRNA is a local sequence alignment tool for filtering\, mapping and clustering." -f"
    ./makeroom_SortMeRNA_4.2.0.sh
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

