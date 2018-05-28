canu/1.7-86da76b
========

Fork of Celera Assembler specialised for long noisy reads.

<http://canu.readthedocs.org/en/latest/>

Log
---

    TOOL=canu
    TOOLVERSION=1.7
    COMMIT_HASH=86da76bbcc8a87dfc6f17cf6cc566788a22958d9
    VERSION=${TOOLVERSION}-${COMMIT_HASH:0:7}
    echo "VERSION being used is '$VERSION'"
    CLUSTER=${CLUSTER:?CLUSTER must bs set}
    cd /sw/apps/bioinfo/canu
    mkdir -p ${VERSION}
    cd ${VERSION}
    mkdir $CLUSTER src
    [[ $CLUSTER == rackham ]] && for C in bianca irma ; do ln -s $CLUSTER $C; done
    PFX=$PWD/$CLUSTER
    mkdir -p src
    cd src/

    git clone https://github.com/marbl/canu.git
    cd canu
    git reset --hard $COMMIT_HASH

    cd canu/src
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

