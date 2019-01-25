canu/1.6
========

Fork of Celera Assembler specialised for long noisy reads.

<http://canu.readthedocs.org/en/latest/>

Log
---

    VERSION=1.6
    CLUSTER=${CLUSTER:?CLUSTER must bs set}
    cd /sw/apps/bioinfo/canu
    mkdir -p ${VERSION}
    cd ${VERSION}
    mkdir $CLUSTER src
    [[ $CLUSTER == rackham ]] && for C in bianca irma ; do ln -s $CLUSTER $C; done
    PFX=$PWD/$CLUSTER
    mkdir -p src
    cd src/
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/marbl/canu/archive/v${VERSION}.tar.gz
    [[ -d canu-${VERSION} ]] && rm -rf canu-${VERSION}
    [[ -d canu-${VERSION}-${CLUSTER} ]] && rm -rf canu-${VERSION}-${CLUSTER}
    tar xzf v${VERSION}.tar.gz 
    mv canu-${VERSION} canu-${VERSION}-$CLUSTER
    cd canu-${VERSION}-$CLUSTER
    cd src/
    module load gcc/6.3.0
    module load zlib/1.2.11
    make -j 8
    cd ..
    mv Linux-amd64 $PFX/

Now, add a line to `canu.defaults` so that a grid engine won't be used by default.

    vi $PFX/Linux-amd64/bin/canu.defaults

Add the line

    useGrid=false


Use a new mf with a message about this default and a newer java, and edit the 1.{1,3,5} mfs to include a message about this default too.

