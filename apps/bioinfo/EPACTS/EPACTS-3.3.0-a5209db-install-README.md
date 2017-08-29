EPACTS/3.3.0-a5209db
====================

<http://genome.sph.umich.edu/wiki/EPACTS>

Build from source in the github tree (**not** the 3.3.0 release), which includes a
few fixes (latest commit 22 Feb 2017, hash a5209db1b3929c4dd2f15f27ea085edf3a634ee7).

<https://github.com/statgen/EPACTS>

LOG
---

`COMMIT_HASH` holds the full hash for the commit we want.  For versioning, we want the first 7 characters.

    COMMIT_HASH=a5209db1b3929c4dd2f15f27ea085edf3a634ee7
    VERSION=3.3.0-${COMMIT_HASH:0:7}
    echo "VERSION being used is '$VERSION'"
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir /sw/apps/bioinfo/EPACTS/$VERSION
    cd /sw/apps/bioinfo/EPACTS/$VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    SRCDIR=$PWD
    module load git/2.10.2
    module load autoconf/2.69
    module load automake/1.14.1
    module load m4/1.4.17

Clone the repository and make sure the head is reset to our chosen commit.

    git clone https://github.com/statgen/EPACTS.git
    cd EPACTS
    git reset --hard $COMMIT_HASH

It installs some R libraries during `make install` so load `R/3.4.0`.  During
`make`, compile with `gcc/5.4.0` (instead of `gcc/6.3.0` loaded with `R/3.4.0`)
since gcc6 enforces a const-expression constraint for non-integral types that
is annoying.  Also, the build environment is missing `./compile` after
configuration, so use `automake` to fix it.

    module load R/3.4.0
    module load gcc/5.4.0

On rackham, load the utility module `groff/1.22.3`, which contains `pfbtops`
required to get through configure.  This is available on milou.

    ./configure --prefix=$PFX
    automake --add-missing

    make
    make install

Let's hope we needn't prepend to `R_LIBS_SITE` in the mf to find these R libraries.
