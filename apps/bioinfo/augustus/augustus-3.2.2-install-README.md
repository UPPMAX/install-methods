augustus 3.2.2
==============

Precompiled executables do not work.  See notes for 3.0.1.  This is based on
the notes for augustus/3.2.2, just generalised a bit along the lines of what is
becoming common practice for other modules.

This took quite a bit of tweaking, not for the main tool but for tools under
`auxprogs/`.  I modified the mf file for bamtools/2.3.0 to define CPATH,
BAMTOOLS and LD_RUN_PATH so it could be compiled against when the module is
loaded.  Then I editted the bamtools-referring Makefiles there, and also the
samtools references so they pointed to local copies (in `src_$CLUSTER`) of
samtools and htslib source tree.  The one for `checkTargetSortedness`
apparently wanted an older version of these (it could not deal with a missing
`bam_index_core` as is in samtools/1.2) so I pointed it to the source directory
for `samtools/0.1.19`.  Best to have loaded gcc, zlib, boost, etc. as below and
attempt to compile each to see what remains broken.

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=3.2.2
    cd /sw/apps/bioinfo/augustus
    mkdir -p ${VERSION}
    cd ${VERSION}
    mkdir $CLUSTER
    mkdir src_$CLUSTER
    cd src_$CLUSTER

Get the augustus bundle and unpack it.
 
    wget http://bioinf.uni-greifswald.de/augustus/binaries/augustus-${VERSION}.tar.gz
    tar xzf augustus-${VERSION}.tar.gz
    cd augustus-${VERSION}/

We will not build the comparative gene prediction (CGP) version.  We could, but
no one has asked for this yet.  Be careful not to define SQLITE nor MYSQL
support in common.mk, otherwise it will assume you want CGP.

Assuming you have made the appropriate Makefile edits in `auxprogs/` as
described above, build things:

    module load zlib gcc/4.9.2
    module load boost/1.59.0_gcc4.9.2
    module load bioinfo-tools bamtools/2.3.0
    make

Since 3.0.1 many of the auxprogs/ Makefiles copy to bin/, except for
checkTargetSortedness.

    cd auxprogs/checkTargetSortedness
    make
    cd ../..
    cp auxprogs/checkTargetSortedness/checkTargetSortedness bin/

Once everything is built, copy the whole tree over to the cluster directory.
We require the config/ directory contents, might as well copy everything.

    cp -av * ../../$CLUSTER/

And, tighten up permissions on config directory so `sw` group members don't
inadvertently write something there using BUSCO or some other tool.

    cd ../../../..
    fixup -g $VERSION
    cd $VERSION/$CLUSTER
    chmod -R -w config

We can use the mf file from augustus/3.2.1.  All we need to do is add
$modroot/bin to PATH and set AUGUSTUS_CONFIG_PATH to $modroot/config.

Set up mf links for milou and add tintin.


