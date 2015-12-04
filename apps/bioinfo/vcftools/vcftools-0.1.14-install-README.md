    TOOL=/sw/apps/bioinfo/vcftools
    VERSION=0.1.14
    CLUSTER=milou
    cd $TOOL
    VERSIONDIR=$TOOL/$VERSION
    mkdir -p $VERSIONDIR
    cd $VERSIONDIR
    mkdir $CLUSTER src
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    cd src
    wget https://github.com/vcftools/vcftools/releases/download/v${VERSION}tools-${VERSION}.tar.gz
    tar xzf vcftools-${VERSION}.tar.gz 
    cd vcftools-${VERSION}/

I first modified zlib to prepend LD_RUN_PATH with $modroot/lib and
PKG_CONFIG_PATH with $modroot/lib/pkgconfig to find the one for the zlib/1.2.8
module.

    module load zlib
    module load gcc/4.9.2
    ./configure --prefix=$CLUSTERDIR
    make
    make install

I also modified the mf file to remove the separate PATH for perl, to update the MANPATH to share/man, and to update the PERL5LIB to share/perl5

Make sure this are correct.


Repeated for tintin.
