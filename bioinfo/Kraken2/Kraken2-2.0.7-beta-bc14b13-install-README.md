Kraken2/2.0.7-bc14b13
=====================

<http://ccb.jhu.edu/software/kraken/MANUAL.html>


There seem to be some useful commits that are not in 2.0.7-beta, so grab those
instead of downloading the release.  Requires the commit hash and `git reset --hard`.

The module also must load a Blast+ (I selected `blast/2.7.1+` for the
`dustmasker` and `segmasker` utilities.


LOG
---



    TOOL=Kraken2
    VERSION=2.0.7-bc14b13
    COMMIT_HASH=bc14b1318f44359d6aa0a0b6e014bbe91a3a8fcc
    cd /sw/apps/bioinfo
    mkdir $TOOL
    cd $TOOL
    mkdir $VERSION
    mkdir mf
    cd $VERSION
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    module load git/2.16.1
    git clone https://github.com/DerrickWood/kraken2.git
    cd kraken2/
    git reset --hard $COMMIT_HASH

Edit `install_kraken2.sh` to have internal `VERSION=2.0.7-beta-bc14b13`.

    vi install_kraken2.sh 

Continue with the rest of the installation.

    module load gcc/6.3.0
    ./install_kraken2.sh $PFX
    cd $PFX

Check that all the perl scripts have proper `#!` lines.  They do.  Also check
that all required modules are included in the system perl.  They are.  These
should perform fine whether system perl or a module perl is used.

    grep -h '^use ' *.pl kraken2* | sort -Vu
    head -n 1 *.sh *.pl kraken2* | grep perl

Check the executables, that RPATH is saved.

    module unload gcc
    file build_db 
    ldd build_db 

Now to build the database(s).

Additional environment variables to set.

* `KRAKEN2_DB_PATH`  - a PATH-like format of directories to search for `--db`-specified databases.
    Include the default Kraken2 database path.
* `KRAKEN2_DEFAULT_DB` - the database to use if no `--db` is specified
    Names the default Kraken2 database.
* `KRAKEN2_NUM_THREADS` - not set by the module

