samtools 1.3
============

    VERSION=1.3
    cd /sw/apps/bioinfo/samtools/
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir src tintin milou
    ln -s ./milou halvan
    ln -s ./milou nestor
    cd src
    wget http://downloads.sourceforge.net/project/samtools/samtools/${VERSION}/samtools-${VERSION}.tar.bz2

Do the build for milou.

    CLUSTER=milou
    tar xjf samtools-${VERSION}.tar.bz2 
    mv samtools-${VERSION} samtools-${VERSION}-${CLUSTER}
    cd samtools-${VERSION}-${CLUSTER}/

The release notes say libcurl is used to get https files, but I see no evidence
that it is checked for by configure.

    module load libcurl
    module load gcc/4.9.2

I also tried to load the zlib/1.2.8 module, but got errors with missing
gzopen64().  I think this is because the zlib/1.2.8 module was not compiled
with large-file-as-default support, or maybe it was... anyway I have requested
a chown of the module tree so I can address whatever issues it has.  The system
zlib has no such issue.

    ./configure --prefix=/sw/apps/bioinfo/samtools/${VERSION}/${CLUSTER}
    make
    make install

Now do the same for CLUSTER=tintin.

Use the previous mf file for 1.2.  Note that samtools helpfully provides man
pages, and this directory changed between 1.1 and 1.2.

