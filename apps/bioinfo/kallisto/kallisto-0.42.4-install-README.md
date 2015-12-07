kallisto
========

Quantifying abundances of transcripts from RNA-Seq data.

<http://pachterlab.github.io/kallisto/>

Install on milou.

    TOOLDIR=/sw/apps/bioinfo/kallisto
    VERSION=0.42.4
    CLUSTER=milou
    CLUSTERDIR=$TOOLDIR/$VERSION/$CLUSTER

    mkdir -p $TOOLDIR
    cd $TOOLDIR
    mkdir -p $VERSION mf
    cd $VERSION
    mkdir -p $CLUSTER src
    cd src
    wget https://github.com/pachterlab/kallisto/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    cd kallisto-${VERSION}/

It requires HDF5 and ZLIB and cmake >= 2.8.12, all standard in SL 6.7.

    module load gcc/4.9.2
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH=$CLUSTERDIR ..
    make
    make install

Start with a simple mf from another Pachter group tool.  If installing a new
version, it is probably sufficient to simply link to the next oldest kallisto
mf.

    cd $TOOLDIR/mf
    cp ../../eXpress/mf/1.5.1 $VERSION
    vi $VERSION

Now simply add $modroot/bin to PATH.

Repeat for tintin.

