ProtExcluder/1.1
================



LOG
---

By requesting `esl-sfetch`, this revealed that we never included the `easel/`
subdirectory of hmmer3, so I rebuilt `hmmer/3.1b2` with `gcc/5.4.0` and
included `cd easel; make install` as well.

    VERSION=1.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir ProtExcluder
    cd ProtExcluder
    mkdir $VERSION
    cd $VERSION
    mkdir src_$CLUSTER
    mkdir $CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    wget http://weatherby.genetics.utah.edu/MAKER/data/ProtExcluder${VERSION}.tar.gz
    tar xvzf ProtExcluder${VERSION}.tar.gz

Now to get the proper HMMER directory, HMMER_HOME is set, but this method
ensures the build includes `esl-sfetch`.

    module load bioinfo-tools hmmer/3.1b2
    which esl-sfetch || { echo "**** esl-sfetch not found, the HMMER build doesn't include the easel subdirectory, sleeping for 60s so you can stop"; sleep 60; }
    H=$(which esl-sfetch)
    H=${H%/*}

    cd ProtExcluder${VERSION}

Edit `Installer.pl` to change the replace of `_hmmer_` to `_hmmer_binaries`,
and make sure the trailing slash is on the install prefix given as script
option `-p`.

    ./Installer.pl -m $H -p $PFX/

Check.

    grep $CLUSTER *.pl

