augustus/20200915-ed0cb90
========================

<https://github.com/Gaius-Augustus/Augustus>

<http://bioinf.uni-greifswald.de/augustus>

Used under license:
Artistic

Structure creating script (makeroom_augustus_20200703-dd2dd8f.sh) moved to /sw/bioinfo/augustus/makeroom_20200703-dd2dd8f.sh

LOG
---

    TOOL=augustus
    COMMIT=ed0cb90
    VERSION=20200915-${COMMIT}
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -s annotation -w http://bioinf.uni-greifswald.de/augustus -l Artistic -d "find genes and their structures in one or more genomes"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}
    cd $VERSION
    cd src

    module load gcc/8.3.0
    module load boost/1.66.0-gcc8.3.0
    module load zlib/1.2.11
    module load bioinfo-tools bamtools/2.5.1
    module load git/2.21.0

    git clone https://github.com/Gaius-Augustus/Augustus
    cd Augustus
    git reset --hard $COMMIT
    cd ..

Define this for some makefiles.

    export TOOLVERSION=$VERSION

Copy over the source trees for samtools, htslib, samtools and build them in
place using 4 threads.  These are needed for `bam2wig`.

    THISLIBVERSION=1.9
    for THISLIB in samtools htslib bcftools ; do
        cp -av /sw/bioinfo/$THISLIB/${THISLIBVERSION}/src/$THISLIB-${THISLIBVERSION}.tar.bz2 .
        tar xjf $THISLIB-${THISLIBVERSION}.tar.bz2
        ln -s $THISLIB-$THISLIBVERSION $THISLIB
        ( cd $THISLIB && make -j10 )
    done
    export TOOLDIR=$PWD

Now to begin building augustus.

    cd Augustus

    mkdir bin



## Modify augustus makefiles

Make sure this line in `common.mk` is uncommented so that we can handle gzipped input files:

    ZIPINPUT = true

Define Augustus version to match the module version:

    AUGVERSION = 20200915-ed0cb90

Do not build the comparative gene prediction (CGP) version.

    COMPGENEPRED = false

We could, but no one has asked for this yet.  Be careful not to define SQLITE
nor MYSQL support in common.mk, otherwise it will assume you want CGP.

Modify the augustus makefile to handle boost correctly.

    cd src
    vi Makefile
    cd ..

For the above, while the file is open, within the `ZIPINPUT`-dependent section,
modify `CPPFLAGS` and `LIBS`.  At the `CPPFLAGS` line, add
`-I${BOOST_ROOT}/include`.  At the `LIBS` line, add `-L${BOOST_ROOT}/lib`
*prior to* `-lboost_iostreams`.  `BOOST_ROOT` is defined by the boost module loaded
above.  The lines should look like:

    ifeq (,$(findstring $(ZIPINPUT),0 false False FALSE))  # if ZIPINPUT is not defined or is something else than 0, false, False or FALSE
        CPPFLAGS += -DZIPINPUT -I${BOOST_ROOT}/include
        LIBS    = -L${BOOST_ROOT}/lib -lboost_iostreams
    endif


## Modify auxprogs/ makefiles

Now make changes to `auxprogs/` makefiles as follows.

    cd auxprogs

### checkTergetSortedness

Change `checkTargetSortedness/Makefile` lines to use `samtools/0.1.19` API.

    cd checkTargetSortedness
    module load samtools/0.1.19
    vi Makefile

The Makefile lines should read

    #SAMTOOLS = /usr/include/samtools
    SAMTOOLS = ${SAMTOOLS_ROOT}/../src
    #INCLUDES = -I$(SAMTOOLS) -I.
    INCLUDES = -I$(SAMTOOLS) -I.
    # replace -lbam with the following in case you have your own samtools library: $(SAMTOOLS)/libbam.a
    #LIBS=-lbam -lcurses -lm -lz -lpthread
    LIBS=$(SAMTOOLS)/libbam.a -lcurses -lm -lz -lpthread

Then

    make clean
    make
    cp -av checkTargetSortedness ../../bin/
    module unload samtools/0.1.19
    cd ..

### filterBam

    cd filterBam
    make clean
    make BAMTOOLS=$BAMTOOLS_ROOT
    cd ..

### utrrnaseq

This is built successfully, it just needs to be lifted out.

    cd utrrnaseq
    cp -av Debug/utrrnaseq ../../bin/
    cd ..

Done with `auxprogs/`.

    cd ..


## auxiliary scripts


Make scripts find perl using the path, change `#!/usr/bin/perl` to `#!/usr/bin/env perl`.
Most scripts use `env` but a few do not.

    cd scripts
    for F in $(file * | grep 'Perl script' | cut -f1 -d:) ; do
        sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' "$F"
    done
    cd ..


## Copy the whole directory over to $PREFIX


We require the config/ directory contents, might as well copy everything.

    cp -av * $PREFIX/
    cd $PREFIX

### man pages

Man pages are in `mansrc/` but these may be out of date.  Still, provide them.

    mkdir -p man/man1
    cp -av mansrc/*.1 man/man1/


## Create user-modifiable config


Set up the config copy script so users can set up their own augustus config
directory since this one isn't writable by general users or (after the
following step) by `sw` members.

    sed -e "s/^TOOLVERSION=3\.3\.3$/TOOLVERSION=$TOOLVERSION/" < ../../3.3.3/$CLUSTER/augustus_config_copy > augustus_config_copy


## Final setup


Make sure shared libraries can be found.

    ( module purge && cd bin && ldd * )

Tighten up permissions on config directory so `sw` group members don't
inadvertently write something there using BUSCO or some other tool.

    ( cd $TOOLDIR && fixup -g $VERSION )
    cd $PREFIX
    chmod -R -w config


## mf file

We can use the mf file from augustus/3.3.3.  All we need to do is add
`$modroot/{bin,scripts}` to `PATH`, `$modroot/man` to `MANPATH` and set
`AUGUSTUS_CONFIG_PATH` to `$modroot/config`.  And use `perl/5.26.2` and
`perl_modules/5.26.2`.


