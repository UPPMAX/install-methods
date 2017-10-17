MetaBat/2.12.1
==============

<https://bitbucket.org/berkeleylab/metabat>

Fortunately, they provide precompiled statically linked linux 64-bit versions that seem to work just fine.

LOG
---

Do on milou, and simply move the unpacked directory to the prefix.

    VERSION=2.12.1
    TOOL=/sw/apps/bioinfo/MetaBat
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    PFX=$TOOL/$VERSION/$CLUSTER
    mkdir src
    cd src
    wget https://bitbucket.org/berkeleylab/metabat/downloads/metabat-static-binary-linux-x64_v${VERSION}.tar.gz
    tar xvzf metabat-static-binary-linux-x64_v${VERSION}.tar.gz 
    cd metabat

One perl script needs to use the env mechanism.

    head -1 *.pl

Neither perl script loads modules so it should not be a problem, but still
better to be safe.

    vi aggregateBinDepths.pl 

Now move over to prefix.

    cd ..
    mv metabat $PFX
    cd ..
    for C in rackham irma bianca ; do rm -f $C && ln -s $CLUSTER $C; done

Simply add the $PFX to the path.

