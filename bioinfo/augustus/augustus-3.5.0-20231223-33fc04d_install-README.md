augustus/3.5.0-20231223-33fc04d
========================

<http://bioinf.uni-greifswald.de/webaugustus/>

Used under license:
Artistic License 1.0
<https://raw.githubusercontent.com/Gaius-Augustus/Augustus/master/src/LICENSE.TXT>

Structure creating script (makeroom_augustus_3.5.0-20231223-33fc04d.sh) moved to /sw/bioinfo/augustus/makeroom_3.5.0-20231223-33fc04d.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "augustus" "-v" "3.5.0-20231223-33fc04d" "-l" "Artistic License 1.0" "-L" "https://raw.githubusercontent.com/Gaius-Augustus/Augustus/master/src/LICENSE.TXT" "-w" "http://bioinf.uni-greifswald.de/webaugustus/" "-d" "find genes and their structures in one or more genomes"
    ./makeroom_augustus_3.5.0-20231223-33fc04d.sh
    source /sw/bioinfo/augustus/SOURCEME_augustus_3.5.0-20231223-33fc04d
    cd $SRCDIR


    module load gcc/12.3.0
    module load boost/1.83.0-gcc12.3.0
    module load python/3.11.4
    module load zlib/1.3
    module load bzip2/1.0.8
    module load xz/5.4.5
    module load sqlite/3.34.0
    module load lpsolve/5.5.2.9
    module load gsl/2.7
    module load SuiteSparse/5.8.1
    module load doxygen/1.9.6
    module load bioinfo-tools
    module load bamtools/2.5.2
    module load htslib/1.19
    module load perl_modules/5.32.1

Note that some python scripts require numpy and pandas. We install these into a
virtualenv that we activate and then unload the python module.

For comparative gene prediction, enabled by default and we accept this, we
require lpsolve/5.5.2.9, gsl/2.7, SuiteSparse/5.8.1.

Set up virtualenv.

    cd $PREFIX
    virtualenv venv
    source venv/bin/activate
    module unload python
    which python
    which pip
    pip install biopython pandas


Start with the build.

    cd $SRCDIR
    ml git/2.34.1
    git clone --recursive https://github.com/Gaius-Augustus/Augustus.git
    Augustus/
    git reset --hard 33fc04d
    module unload git

Define this for some makefiles.

    export TOOLVERSION=$VERSION


Now to begin building augustus.

    cd $SRCDIR
    cd Augustus/


## Modify augustus makefiles

Multiple changes to `common.mk`. Everything else (except the Darwin section) should be commented out.

    AUGVERSION = 3.5.0-20231223-33fc04d

    ZIPINPUT = true

    COMPGENEPRED = true
    SQLITE = true
    MYSQL = false


    INCLUDE_PATH_ZLIB        := -I${ZLIB_ROOT}/include
    LIBRARY_PATH_ZLIB        := -L${ZLIB_ROOT}/lib -Wl,-rpath,${ZLIB_ROOT}/lib
    INCLUDE_PATH_BOOST       := -I${BOOST_ROOT}/include
    LIBRARY_PATH_BOOST       := -L${BOOST_ROOT}/lib -Wl,-rpath,${BOOST_ROOT}/lib
    INCLUDE_PATH_LPSOLVE     := -I${LPSOLVE_ROOT}/include/lpsolve
    LIBRARY_PATH_LPSOLVE     := -L${LPSOLVE_ROOT}/lib -Wl,-rpath,${LPSOLVE_ROOT}/lib
    INCLUDE_PATH_SUITESPARSE := -I${SUITESPARSE_ROOT}/include
    LIBRARY_PATH_SUITESPARSE := -L${SUITESPARSE_ROOT}/lib -L${SUITESPARSE_ROOT}/lib64 -Wl,-rpath,${SUITESPARSE_ROOT}/lib -Wl,-rpath,${SUITESPARSE_ROOT}/lib64
    INCLUDE_PATH_GSL         := -I${GSL_ROOT}/include
    LIBRARY_PATH_GSL         := -L${GSL_ROOT}/lib -Wl,-rpath,${GSL_ROOT}/lib
    INCLUDE_PATH_SQLITE      := -I${SQLITE_ROOT}/include
    LIBRARY_PATH_SQLITE      := -L${SQLITE_ROOT}/lib -Wl,-rpath,${SQLITE_ROOT}/lib
    INCLUDE_PATH_BAMTOOLS    := -I${BAMTOOLS_ROOT}/include/bamtools
    LIBRARY_PATH_BAMTOOLS    := -L${BAMTOOLS_ROOT}/lib64 -Wl,-rpath,${BAMTOOLS_ROOT}/lib64
    INCLUDE_PATH_HTSLIB      := -I${HTSLIB_ROOT}/include/htslib
    LIBRARY_PATH_HTSLIB      := -L${HTSLIB_ROOT}/lib -Wl,-rpath,${HTSLIB_ROOT}/lib
    USE_SEQLIB = false


## Build augustus.

    make -j10


## Lift out utrrnaseq from auxprogs/

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

    cd $SRCDIR/Augustus
    cp -av * $PREFIX/
    cd $PREFIX


## Double-check modules/packages required by scripts

    cd $PREFIX/scripts
    grep import *.py | cut -f2- -d: | sed -e 's/^\s\+//' | sort -u
    grep '^\s*\<use\>' *.pl | cut -f2- -d: | sed -e 's/^\s\+//' | sort -u

The python packages are provided in the python/3.9.5 module, and in the biopython/1.80-py3.9.5 module. The perl modules are provided in perl_modules/5.2.6 or are local modules `SplicedAlignment.pm` and `helpMod.pm`.


## Change #! line for python scripts to the virtualenv python3

    cd $PREFIX/scripts
    sed -i '1i#!'"$(which python3)" *.py


## man pages

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

Unload everything except gcc/12.3.0, then just update the RPATH from LD_RUN_PATH, only for those that need it as shown by ldd output above.

    module purge
    module load gcc/12.3.0
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


## mf file

Simplify from previous versions in that we only need to load perl and
perl_modules, not python.


## Make config directories read-only

After running the post-install script, do

    cd /sw/bioinfo/augustus
    chmod -R -w */rackham/config

