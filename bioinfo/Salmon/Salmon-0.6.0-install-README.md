Salmon
======

Quantifying abundances of transcripts from RNA-Seq data.

<http://salmon.readthedocs.org/en/latest/>

Install the "Debian Squeeze" binary version on milou.  It includes its own
libraries, which is good because I tried to build 0.5.1 from source and it was
simply too much trouble, especially the interface with the Threaded Building
Blocks library.  Ask me for my Evernote notes if you want to know more.

    TOOLDIR=/sw/apps/bioinfo/Salmon
    VERSION=0.6.0
    CLUSTER=milou
    CLUSTERDIR=$TOOLDIR/$VERSION/$CLUSTER

    mkdir -p $TOOLDIR
    cd $TOOLDIR
    mkdir -p $VERSION mf
    cd $VERSION
    mkdir -p $CLUSTER src
    cd src
    wget https://github.com/COMBINE-lab/salmon/releases/download/v0.6.0/SalmonBeta-0.6.0_DebianSqueeze.tar.gz
    tar xzf SalmonBeta-0.6.0_DebianSqueeze.tar.gz 
    cd SalmonBeta-0.6.0_DebianSqueeze/
    mv * ../../milou/

The RPATH encoded looks at relative path `../lib/` for the libraries, so these must be in place next to the `bin/` directory.

Create symbolic links for tintin and halvan.

Use a simple mf file from any other tool and add `$modpath/bin` to `PATH`.  No need to modify `LD_LIBRARY_PATH`.

