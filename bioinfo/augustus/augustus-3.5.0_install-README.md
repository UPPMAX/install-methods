augustus/3.5.0
==============

<http://bioinf.uni-greifswald.de/webaugustus/>

Used under license:
Artistic License 1.0
<https://raw.githubusercontent.com/Gaius-Augustus/Augustus/master/src/LICENSE.TXT>

Structure creating script (makeroom_augustus_3.5.0.sh) moved to /sw/bioinfo/augustus/makeroom_3.5.0.sh

LOG
---

    makeroom.sh "-f" "-t" "augustus" "-v" "3.5.0" "-l" "Artistic License 1.0" "-L" "https://raw.githubusercontent.com/Gaius-Augustus/Augustus/master/src/LICENSE.TXT" "-w" "http://bioinf.uni-greifswald.de/webaugustus/" "-d" "find genes and their structures in one or more genomes"
    ./makeroom_augustus_3.5.0.sh
    source /sw/bioinfo/augustus/SOURCEME_augustus_3.5.0
    cd $SRCDIR


    module load gcc/10.3.0
    module load boost/1.81.0-gcc10.3.0
    module load python/3.9.5
    module load zlib/1.2.12
    module load bzip2/1.0.8
    module load xz/5.2.6
    module load sqlite/3.34.0
    module load lpsolve/5.5.2.9
    module load gsl/2.7
    module load SuiteSparse/5.8.1
    module load doxygen/1.9.6
    module load bioinfo-tools
    module load bamtools/2.5.2
    module load htslib/1.17
    module load biopython/1.80-py3.9.5

Note that some python scripts require numpy and pandas. These are already available in the python/3.9.5 module.

For comparative gene prediction, enabled by default and we accept this, we require
lpsolve 5.5.2.9, gsl/2.7, SuiteSparse/5.8.1.

    wget https://github.com/Gaius-Augustus/Augustus/archive/refs/tags/v${VERSION}.tar.gz
    tar xf v${VERSION}.tar.gz

Define this for some makefiles.

    export TOOLVERSION=$VERSION


Now to begin building augustus.

    cd Augustus-${TOOLVERSION}/


## Modify augustus makefiles

Multiple changes to `common.mk`. `diff -y` output of original and modified.

    cd $SRCDIR
    tar -C orig -xf v3.5.0.tar.gz
    diff -W $COLUMNS -y orig/Augustus-3.5.0/common.mk Augustus-3.5.0/common.mk

And the differences side-by-side:

    # Definitions common to all Makefiles                                                                                                      # Definitions common to all Makefiles
    # This file is included from other Makefiles in the augustus project.                                                                      # This file is included from other Makefiles in the augustus project.
    AUGVERSION = 3.4.0                                                                                                                    |    AUGVERSION = 3.5.0

    # set ZIPINPUT to false if you do not require input gzipped input genome files,                                                            # set ZIPINPUT to false if you do not require input gzipped input genome files,
    # get compilation errors about the boost iostreams library or                                                                              # get compilation errors about the boost iostreams library or
    # the required libraries libboost-iostreams-dev and lib1g-dev are not available                                                            # the required libraries libboost-iostreams-dev and lib1g-dev are not available
    ZIPINPUT = true                                                                                                                            ZIPINPUT = true

    # set COMPGENEPRED to false if you do not require the comparative gene prediction mode (CGP) or                                            # set COMPGENEPRED to false if you do not require the comparative gene prediction mode (CGP) or
    # the required libraries                                                                                                                   # the required libraries
    # libgsl-dev, libboost-all-dev, libsuitesparse-dev, liblpsolve55-dev, libmysql++-dev and libsqlite3-dev                                    # libgsl-dev, libboost-all-dev, libsuitesparse-dev, liblpsolve55-dev, libmysql++-dev and libsqlite3-dev
    # are not available                                                                                                                        # are not available
    COMPGENEPRED = true                                                                                                                        COMPGENEPRED = true
                                                                                                                                          >    SQLITE = true
                                                                                                                                          >    MYSQL = false

    # set these paths to the correct locations if you have installed the corresponding packages in non-default locations:                      # set these paths to the correct locations if you have installed the corresponding packages in non-default locations:
    #INCLUDE_PATH_ZLIB        := -I/usr/include                                                                                           |    INCLUDE_PATH_ZLIB        := -I${ZLIB_ROOT}/include
    #LIBRARY_PATH_ZLIB        := -L/usr/lib/x86_64-linux-gnu -Wl,-rpath,/usr/lib/x86_64-linux-gnu                                         |    LIBRARY_PATH_ZLIB        := -L${ZLIB_ROOT}/lib -Wl,-rpath,${ZLIB_ROOT}/lib
    #INCLUDE_PATH_BOOST       := -I/usr/include                                                                                           |    INCLUDE_PATH_BOOST       := -I${BOOST_ROOT}/include
    #LIBRARY_PATH_BOOST       := -L/usr/lib/x86_64-linux-gnu -Wl,-rpath,/usr/lib/x86_64-linux-gnu                                         |    LIBRARY_PATH_BOOST       := -L${BOOST_ROOT}/lib -Wl,-rpath,${BOOST_ROOT}/lib
    #INCLUDE_PATH_LPSOLVE     := -I/usr/include/lpsolve                                                                                   |    INCLUDE_PATH_LPSOLVE     := -I${LPSOLVE_ROOT}/include/lpsolve
    #LIBRARY_PATH_LPSOLVE     := -L/usr/lib/lp_solve/ -Wl,-rpath,/usr/l ib/lp_solve/                                                      |    LIBRARY_PATH_LPSOLVE     := -L${LPSOLVE_ROOT}/lib -Wl,-rpath,${LPSOLVE_ROOT}/lib
    #INCLUDE_PATH_SUITESPARSE := -I/usr/include/suitesparse/                                                                              |    INCLUDE_PATH_SUITESPARSE := -I${SUITESPARSE_ROOT}/include
    #LIBRARY_PATH_SUITESPARSE := -L/usr/lib/x86_64-linux-gnu -Wl,-rpath,/usr/lib/x86_64-linux-gnu                                         |    LIBRARY_PATH_SUITESPARSE := -L${SUITESPARSE_ROOT}/lib -L${SUITESPARSE_ROOT}/lib64 -Wl,-rpath,${SUITESPARSE_ROOT}/lib -Wl,-rpath,${SUITESPARSE_ROOT}/lib64
    #INCLUDE_PATH_GSL         := -I/usr/include                                                                                           |    INCLUDE_PATH_GSL         := -I${GSL_ROOT}/include
    #LIBRARY_PATH_GSL         := -L/usr/lib/x86_64-linux-gnu -Wl,-rpath,/usr/lib/x86_64-linux-gnu                                         |    LIBRARY_PATH_GSL         := -L${GSL_ROOT}/lib -Wl,-rpath,${GSL_ROOT}/lib
    #INCLUDE_PATH_MYSQL       := -I/usr/include -I/usr/include/mysql      # the path to mysql++ may have to be adjusted                        #INCLUDE_PATH_MYSQL       := -I/usr/include -I/usr/include/mysql      # the path to mysql++ may have to be adjusted
    #LIBRARY_PATH_MYSQL       := -L/usr/lib -L/usr/lib/x86_64-linux-gnu -Wl,-rpath,/usr/lib -Wl,-rpath,/usr/lib/x86_64-linux-gnu               #LIBRARY_PATH_MYSQL       := -L/usr/lib -L/usr/lib/x86_64-linux-gnu -Wl,-rpath,/usr/lib -Wl,-rpath,/usr/lib/x86_64-linux-gnu
    #INCLUDE_PATH_SQLITE      := -I/usr/include                                                                                           |    INCLUDE_PATH_SQLITE      := -I${SQLITE_ROOT}/include
    #LIBRARY_PATH_SQLITE      := -L/usr/lib/x86_64-linux-gnu -Wl,-rpath,/usr/lib/x86_64-linux-gnu                                         |    LIBRARY_PATH_SQLITE      := -L${SQLITE_ROOT}/lib -Wl,-rpath,${SQLITE_ROOT}/lib
    #INCLUDE_PATH_BAMTOOLS    := -I/usr/include/bamtools                                                                                  |    INCLUDE_PATH_BAMTOOLS    := -I${BAMTOOLS_ROOT}/include/bamtools
    #LIBRARY_PATH_BAMTOOLS    := -L/usr/lib/x86_64-linux-gnu -Wl,-rpath,/usr/lib/x86_64-linux-gnu                                         |    LIBRARY_PATH_BAMTOOLS    := -L${BAMTOOLS_ROOT}/lib64 -Wl,-rpath,${BAMTOOLS_ROOT}/lib64
    #INCLUDE_PATH_HTSLIB      := -I/usr/include/htslib                                                                                    |    INCLUDE_PATH_HTSLIB      := -I$HTSLIB_ROOT/include/htslib
    #LIBRARY_PATH_HTSLIB      := -L/usr/lib/x86_64-linux-gnu -Wl,-rpath,/usr/lib/x86_64-linux-gnu                                         |    LIBRARY_PATH_HTSLIB      := -L$HTSLIB_ROOT/lib -Wl,-rpath,$HTSLIB_ROOT/lib
    #INCLUDE_PATH_SEQLIB      := -I /usr/include/SeqLib -I/usr/include/htslib -I/usr/include/jsoncpp                                           #INCLUDE_PATH_SEQLIB      := -I /usr/include/SeqLib -I/usr/include/htslib -I/usr/include/jsoncpp
    #LIBRARY_PATH_SEQLIB      := -L/usr/lib/x86_64-linux-gnu -Wl,-rpath,/usr/lib/x86_64-linux-gnu                                              #LIBRARY_PATH_SEQLIB      := -L/usr/lib/x86_64-linux-gnu -Wl,-rpath,/usr/lib/x86_64-linux-gnu
                                                                                                                                          >    USE_SEQLIB = false

    # alternatively add paths with header files to INCLS and paths with library files to LDFLAGS                                               # alternatively add paths with header files to INCLS and paths with library files to LDFLAGS

    ifeq ($(shell uname -s), Darwin)                                                                                                           ifeq ($(shell uname -s), Darwin)
            # path for default homebrew installation of lp_solve                                                                                       # path for default homebrew installation of lp_solve
            INCLUDE_PATH_LPSOLVE = -I/usr/local/opt/lp_solve/include                                                                                   INCLUDE_PATH_LPSOLVE = -I/usr/local/opt/lp_solve/include
            # path for default homebrew installation of mysql and mysql++                                                                              # path for default homebrew installation of mysql and mysql++
            INCLUDE_PATH_MYSQL = -I/usr/local/opt/mysql/include/mysql -I/usr/local/opt/mysql++/include/mysql                                           INCLUDE_PATH_MYSQL = -I/usr/local/opt/mysql/include/mysql -I/usr/local/opt/mysql++/include/mysql
            # path for default homebrew installation of bamtools                                                                                       # path for default homebrew installation of bamtools
            INCLUDE_PATH_BAMTOOLS = -I/usr/local/opt/bamtools/include/bamtools                                                                         INCLUDE_PATH_BAMTOOLS = -I/usr/local/opt/bamtools/include/bamtools
            # path for default homebrew installation of htslib                                                                                         # path for default homebrew installation of htslib
            INCLUDE_PATH_HTSLIB = -I/usr/local/opt/htslib/include/htslib                                                                               INCLUDE_PATH_HTSLIB = -I/usr/local/opt/htslib/include/htslib
    endif                                                                                                                                      endif


## Build augustus.

    make -j10


## Build auxprogs/

Many, but not all, are already built and in `bin/`

Now handle some issues in `auxprogs/` as follows.

    cd auxprogs

### utrrnaseq

This is built successfully, it just needs to be lifted out.

    cd utrrnaseq
    cp -av utrrnaseq ../../bin/
    cd ..

Done with `auxprogs/`.

    cd ..


## Installation

It has an install make target, but it is imperfect. Better to copy the whole directory over to $PREFIX.


We require the config/ directory contents, might as well copy everything.

    cp -av * $PREFIX/
    cd $PREFIX


## Double-check modules/packages required by scripts

    cd scripts
    grep import *.py | cut -f2- -d: | sed -e 's/^\s\+//' | sort -u
    grep '^\s*\<use\>' *.pl | cut -f2- -d: | sed -e 's/^\s\+//' | sort -u

The python packages are provided in the python/3.9.5 module, and in the biopython/1.80-py3.9.5 module. The perl modules are provided in perl_modules/5.2.6 or are local modules `SplicedAlignment.pm` and `helpMod.pm`.


### man pages

Man pages are in `mansrc/` but these may be out of date.  Still, provide them.

    mkdir -p man/man1
    cp -av mansrc/*.1 man/man1/


## Create user-modifiable config


Set up the config copy script so users can set up their own augustus config
directory since this one isn't writable by general users or (after the
following step) by `sw` members.

    sed -e "s/^TOOLVERSION=3\.4\.0$/TOOLVERSION=$TOOLVERSION/" < ../../3.4.0/$CLUSTER/augustus_config_copy > augustus_config_copy


## RPATH

Now check RPATHS. When I ran this, everything has its RPATH except for GCC.

    cd $PREFIX/bin
    for F in * ; do ( module purge; echo;echo;echo $F;echo;ldd $F ); done

Unload everything except gcc/10.3.0, then just update the RPATH from LD_RUN_PATH, only for those that need it as shown by ldd output above.

    module purge
    module load gcc/10.3.0
    module load patchelf/0.10
    for F in augustus bam2hints etraining fastBlockSearch filterBam getSeq homGeneMapping load2sqlitedb pp_simScore prepareAlign utrrnaseq ; do
        CURRENT_RPATH="$(patchelf --print-rpath $F)"
        patchelf --set-rpath "$CURRENT_RPATH:$LD_RUN_PATH" $F
    done
    module purge
    for F in * ; do echo;echo;echo $F;echo;ldd $F; done
    cd $PREFIX

Make sure shared libraries can be found.

    ( module purge && cd bin && ldd * )

Tighten up permissions on config directory so `sw` group members don't
inadvertently write something there using BUSCO or some other tool.

    cd $PREFIX
    fixup .
    chmod -R -w config


## mf file

We can use the mf file from augustus/3.2.3.  All we need to do is add
`$modroot/{bin,scripts}` to `PATH`, `$modroot/man` to `MANPATH` and set
`AUGUSTUS_CONFIG_PATH` to `$modroot/config`.  And use `perl/5.26.2` and
`perl_modules/5.26.2` and `python/3.9.5` and `biopython/1.80-py3.9.5`.

Note also that because there are older modules with names that might sort differently, we need to modify /sw/mf/common/bioinfo-tools/annotation/augustus/.version so that it contains 3.5.0 as the default module.


## Make config directories read-only

After running the post-install script, do

    cd /sw/bioinfo/augustus
    chmod -R -w */rackham/config

