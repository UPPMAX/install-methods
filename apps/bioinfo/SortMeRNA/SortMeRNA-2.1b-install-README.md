SortMeRNA 2.1b
==============

Filtering, mapping and picking OTUs from NGS reads.  2.1b is the same as 2.1,
with an installation bug fixed.

<http://bioinfo.lifl.fr/RNA/sortmerna/>

<https://github.com/biocore/sortmerna>

LOG
---

    cd /sw/apps
    cd bioinfo/
    mkdir -p SortMeRNA
    cd SortMeRNA/
    VERSION=2.1b
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    P=$PWD
    cd ..
    mkdir src_$CLUSTER
    cd src_$CLUSTER
    wget https://github.com/biocore/sortmerna/archive/$VERSION.tar.gz
    module load gcc/5.4.0
    tar xzf $VERSION.tar.gz 
    cd sortmerna-$VERSION
    ./configure --prefix=$P
    make && make install

Add the man pages and PDF manual, which are not part of the `install` target.

    mkdir -p $P/share/man/man1
    cp -av sortmerna.1 indexdb_rna.1 $P/share/man/man1/
    cp SortMeRNA-User-Manual-${VERSION%b}.pdf $P

