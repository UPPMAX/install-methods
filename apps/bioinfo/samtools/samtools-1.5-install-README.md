samtools 1.5
============

    VERSION=1.5
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/samtools/
    mkdir $VERSION
    cd $VERSION
    mkdir src $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src
    [[ -f samtools-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/samtools/releases/download/${VERSION}/samtools-${VERSION}.tar.bz2

Do the build for this cluster.

    tar xjf samtools-${VERSION}.tar.bz2 
    mv samtools-${VERSION} samtools-${VERSION}-${CLUSTER}
    cd samtools-${VERSION}-${CLUSTER}/

The release notes say libcurl is used to get https files, there is no evidence
that it is checked for by configure.  The .so is loaded in the final linked
object file though.

Needed on milou but not rackham.

    module load libcurl/7.45.0

Compile with system gcc, and beginning with samtools/1.5 run `make test`.

    module load zlib/1.2.11

    ./configure --prefix=$PFX
    make
    make test
    make install

Use the previous mf file for 1.2.  Note that samtools helpfully provides man
pages, and this directory changed between 1.1 and 1.2.

