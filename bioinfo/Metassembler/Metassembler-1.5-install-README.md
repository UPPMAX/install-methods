Metassembler 1.5
================

Not exactly what was used to install 1.5, but I want to install for tintin several
months after the fact and this should work.

    VERSION=1.5
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/apps/bioinfo/Metassembler
    cd /sw/apps/bioinfo/Metassembler
    mkdir -p mf $VERSION
    cd $VERSION
    mkdir -p $CLUSTER
    P=$PWD/$CLUSTER
    mkdir -p src_$CLUSTER
    cd src_$CLUSTER
    wget http://downloads.sourceforge.net/project/metassembler/v${VERSION}/Metassembler.${VERSION}.tar.gz
    tar xzf Metassembler.${VERSION}.tar.gz
    cd Metassembler
    module load bioinfo-tools
    module load MUMmer/3.23
    module load python/2.7.6
    module load bowtie2/2.2.3
    module load samtools/0.1.19
    make && make install

Copy by hand.

    cp -av * $P/

Made changes to `bin/` perl scripts and `Scripts/*.pl` to use `#!/usr/bin/env perl` and to the scripts in the Sample/meta1/ directory to find the Metassembler executables in the path rather than via relative paths.

    cd $P
    cd bin
    vi $(file * | grep perl | cut -f1 -d':')
    cd ../Scripts
    vi *.pl
    cd ../Sample/meta1/

See the `Sample/meta1/` changes.

Be good `sw` member.

    fixup -g /sw/apps/bioinfo/Metassembler

And set up mf file to load the above packages.
