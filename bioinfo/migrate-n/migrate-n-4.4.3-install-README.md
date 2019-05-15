migrate-n/4.4.3
===============

This needs separate compilation on rackham and snowy/bianca/irma.  It uses
`-march=native` which pretty much guarantees non-compatibility between rackham
and snowy.

LOG
---

    TOOL=/sw/bioinfo/migrate-n
    VERSION=4.4.3
    mkdir -p $TOOL/$VERSION/src
    cd $TOOL/$VERSION
    if [[ $CLUSTER == rackham ]] ; then
        mkdir -p $CLUSTER/{bin,man/man1}
    elif [[ $CLUSTER == snowy ]] ; then
        mkdir -p $CLUSTER/{bin,man/man1}
        for c in irma bianca; do ln -fs $CLUSTER $c; done
    else
        echo "build only on rackham or snowy"
    fi
    PFX=$TOOL/$VERSION/$CLUSTER
    cd src
    [[ -f migrate-$VERSION.src.tar.gz ]] || wget https://peterbeerli.com/migrate-html5/download_version4/migrate-$VERSION.src.tar.gz
    # remove source directory
    [[ -d migrate-$VERSION ]] && rm -rf migrate-$VERSION
    tar xf migrate-$VERSION.src.tar.gz
    cd migrate-$VERSION/src
    module load gcc/7.4.0 openmpi/3.1.3
    ./configure --prefix=$PFX
    make thread
    cp -av migrate-n $PFX/bin/
    [[ -f $PFX/man/man1/migrate.1 ]] || cp -av migrate.1 $PFX/man/man1/
    make clean
    make mpis
    cp -av migrate-n-mpi $PFX/bin/
    make clean
    cd ../..
    [[ -d migrate-$VERSION ]] && rm -rf migrate-$VERSION

