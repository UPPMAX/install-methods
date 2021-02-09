augustus/3.4.0
========================

<http://bioinf.uni-greifswald.de/augustus>

Used under license:
Artistic

Structure creating script (makeroom_augustus_3.4.0.sh) moved to /sw/bioinfo/augustus/makeroom_3.4.0.sh

LOG
---

    TOOL=augustus
    VERSION=3.4.0
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t "augustus" -v "3.4.0" -w "http://bioinf.uni-greifswald.de/augustus" -l "Artistic" -d "find genes and their structures in one or more genomes"
    ./makeroom_augustus_3.4.0.sh
    source SOURCEME_augustus_${VERSION}
    cd $VERSION
    cd src


Used under license:
Artistic

Structure creating script (makeroom_augustus_3.3.3.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/augustus/makeroom_3.3.3.sh


    module load gcc/9.3.0
    module load openmpi/3.1.5
    module load boost/1.70.0_gcc9.3.0_mpi3.1.5
    module load zlib/1.2.11
    module load sqlite/3.34.0
    module load lpsolve/5.5.2.9
    module load gsl/2.6
    module load SuiteSparse/5.8.1
    module load bioinfo-tools
    module load bamtools/2.5.1

For comparative gene prediction, we also require
LPSolve 5.5.x.y, gsl/2.6, suitesparse.

    wget https://github.com/Gaius-Augustus/Augustus/releases/download/v${VERSION}/augustus-${VERSION}.tar.gz
    tar xzf augustus-${VERSION}.tar.gz

Define this for some makefiles.

    export TOOLVERSION=$VERSION

Copy over the source trees for samtools, htslib, samtools and build them in
place using 4 threads.  These are needed for `bam2wig`.

    THISLIBVERSION=1.10
    for THISLIB in samtools htslib bcftools ; do
        cp -av /sw/bioinfo/$THISLIB/${THISLIBVERSION}/src/$THISLIB-${THISLIBVERSION}.tar.bz2 .
        tar xjf $THISLIB-${THISLIBVERSION}.tar.bz2
        ln -s $THISLIB-$THISLIBVERSION $THISLIB
        ( cd $THISLIB && make -j10 )
    done
    export TOOLDIR=$PWD

Now to begin building augustus.

    cd augustus-${TOOLVERSION}/


## Modify augustus makefiles

Uncomment this line in `common.mk` so that we can handle gzipped input files:

    ZIPINPUT = true

We also keep the building of comparative gene prediction (CGP), which is newly default in 3.4.0.
Add a definition of `SQLITE = true` and a definition of `MYSQL = false` in common.mk.

Modify the augustus makefile to handle boost correctly.

    cd src
    vi Makefile
    cd ..

For the above, while the file is open, within the `ZIPINPUT`-dependent section,
modify `CPPFLAGS` and `LIBS`.  At the `CPPFLAGS` line, add
`-I${BOOST_ROOT}/include`.  At the `LIBS` line, add `-L${BOOST_ROOT}/lib`
*prior to* `-lboost_iostreams`.  `BOOST_ROOT` is defined by the boost module loaded
above.  The lines should look like:

    ifdef ZIPINPUT
        CPPFLAGS += -DZIPINPUT -I${BOOST_ROOT}/include
        LIBS    = -L${BOOST_ROOT}/lib -lboost_iostreams
    endif


Build augustus.

    make


## Modify auxprogs/ makefiles

Now handle some issues in `auxprogs/` as follows.

    cd auxprogs

### utrrnaseq

This is built successfully, it just needs to be lifted out.

    cd utrrnaseq
    cp -av Debug/utrrnaseq ../../bin/
    cd ..

Done with `auxprogs/`.

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

    sed -e "s/^TOOLVERSION=3\.2\.3$/TOOLVERSION=$TOOLVERSION/" < ../../3.2.3/$CLUSTER/augustus_config_copy > augustus_config_copy


## Final setup


Make sure shared libraries can be found.

    ( module purge && cd bin && ldd * )

Tighten up permissions on config directory so `sw` group members don't
inadvertently write something there using BUSCO or some other tool.

    ( cd $PREFIX && fixup . )
    chmod -R -w config


## mf file

We can use the mf file from augustus/3.2.3.  All we need to do is add
`$modroot/{bin,scripts}` to `PATH`, `$modroot/man` to `MANPATH` and set
`AUGUSTUS_CONFIG_PATH` to `$modroot/config`.  And use `perl/5.26.2` and
`perl_modules/5.26.2`.


After running the post-install script, do

    cd /sw/bioinfo/augustus
    chmod -R -w */rackham/config
