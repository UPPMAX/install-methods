augustus/3.3.1
==============

<http://bioinf.uni-greifswald.de/augustus/>

Precompiled executables do not work.  See notes for 3.0.1.  Compiling on
rackham and working out various version issues has expanded this quite a bit
beyond the notes for augustus/3.2.2.

This took quite a bit of tweaking, not for the main tool but for tools under
`auxprogs/`.  I modified the mf file for bamtools/2.3.0 to define CPATH,
CPLUS_INCLUDE_PATH, BAMTOOLS and LD_RUN_PATH so it could be compiled against
when the module is loaded.  Then I editted the bamtools-referring Makefiles in
`auxprogs/`: `bam2hints` and `bam2wig`, and also the samtools references so
they pointed to local copies (in `src_$CLUSTER`) of samtools and htslib source
tree.  The one for `checkTargetSortedness` apparently wanted an older version
of these (it could not deal with a missing `bam_index_core` as is in
samtools/1.2) so I pointed it to the source directory for `samtools/0.1.19`,
and modified the `LIBS` variable to pick up the static library as indicated in
the Makefile.  For `filterBam`, it is enough to specify the updated BAMTOOLS on
the command line, see below.  Best to have loaded gcc, zlib, boost, etc. as
below and attempt to compile each to see what remains broken.

Note that `TOOLVERSION` must be exported since it will be used within some Makefiles.

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    export TOOLVERSION=3.3.1
    cd /sw/apps/bioinfo/augustus
    mkdir -p ${TOOLVERSION}
    cd ${TOOLVERSION}
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src

    module load gcc/6.3.0
    module load boost/1.63.0_gcc6.3.0
    module load bioinfo-tools bamtools/2.5.1

    wget http://bioinf.uni-greifswald.de/augustus/binaries/augustus-${TOOLVERSION}.tar.gz
    wget http://bioinf.uni-greifswald.de/augustus/binaries/README.TXT
    tar xzf augustus-${TOOLVERSION}.tar.gz

Copy over the source trees for samtools, htslib, samtools and build them in place

    THISLIBVERSION=1.8
    for THISLIB in samtools htslib bcftools ; do
        cp -av /sw/apps/bioinfo/$THISLIB/${THISLIBVERSION}/src/$THISLIB-${THISLIBVERSION}.tar.bz2 .
        tar xjf $THISLIB-${THISLIBVERSION}.tar.bz2
        ln -s $THISLIB-$THISLIBVERSION $THISLIB
        ( cd $THISLIB && make )
    done
    export TOOLDIR=$PWD

TOOLDIR is used in some submakefiles.

Now to begin buildling augustus.

    cd augustus-${TOOLVERSION}/

Uncomment this line in `common.mk` so that we can handle gzipped input files:

    ZIPINPUT = true

We will not build the comparative gene prediction (CGP) version.  We could, but
no one has asked for this yet.  Be careful not to define SQLITE nor MYSQL
support in common.mk, otherwise it will assume you want CGP.

Assuming you have made the appropriate Makefile edits in `auxprogs/` as
described above, build things:

    make

Since 3.0.1 many of the auxprogs/ Makefiles copy to bin/, except for aln2wig,
bam2wig, checkTargetSortedness and compileSplideCands.  Also, filterBam should
have its BAMTOOLS value set directly.  It will work because of environment
variables set by the module load, but it is better to make this explicit as
here.

    for T in aln2wig bam2wig checkTargetSortedness compileSpliceCands ; do
        ( cd auxprogs/$T && make clean && make && cp $T ../../bin )
    done
    for T in filterBam ; do
        ( cd auxprogs/$T && make clean && make BAMTOOLS=$BAMTOOLS )
    done

Make scripts find perl using the path, change `#!/usr/bin/perl` to `#!/usr/bin/env perl`.

    cd scripts
    vi $(file * | grep -i perl | cut -f1 -d:)
    cd ..

2018-04-06: We'll have two versions: one that loads perl/5.18.4 etc and one
that loads perl/5.24.1.

Copy the whole tree over to the cluster directory.
We require the config/ directory contents, might as well copy everything.

    cp -av * ../../$CLUSTER/

Set up the config copy script so users can set up their own augustus config
directory since this one isn't writable by general users or (after the
following step) by `sw` members.  The sed uses the milou copy since a rackham
3.2.2 doesn't exist.

    cd ../../$CLUSTER/
    sed -e "s/^TOOLVERSION=3\.2\.2$/TOOLVERSION=$TOOLVERSION/" < ../../3.2.2/milou/augustus_config_copy > augustus_config_copy

Remove the prebuilt executables we don't build, which are built for CGP.

    ( cd bin && rm -f getSeq load2sqlitedb )

Make sure shared libraries can be found.

    ( module purge && cd bin && ldd * )

Tighten up permissions on config directory so `sw` group members don't
inadvertently write something there using BUSCO or some other tool.

    cd ../..
    fixup -g $TOOLVERSION
    cd $TOOLVERSION/$CLUSTER
    chmod -R -w config

We can use the mf file from augustus/3.2.2.  All we need to do is add
$modroot/bin to PATH and set AUGUSTUS_CONFIG_PATH to $modroot/config.

Set up mf links for milou and add rackham, and links for bianca and irma.

