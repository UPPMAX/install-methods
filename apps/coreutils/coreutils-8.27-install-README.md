coreutils/8.27
==============

GNU coreutils

LOG
---

    VERSION=8.27
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps
    mkdir -p coreutils
    cd coreutils
    mkdir $VERSION
    mkdir -p mf
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    [[ -f coreutils-${VERSION}.tar.xz ]] || wget http://ftp.acc.umu.se/mirror/gnu.org/gnu/coreutils/coreutils-${VERSION}.tar.xz
    tar xJfv coreutils-${VERSION}.tar.xz
    cd coreutils-${VERSION}
    module load gcc/6.3.0
    ./configure --prefix=$PFX
    make -j 8
    make install

If you want to test, run

    make -j 8 check

I got a single unexpected FAIL for `tests/misc/date-debug`, due to an expected
program not built.  Don't know what that's about, everything is built and `make
coreutils` builds nothing further.  On rackham, there are two unexpected
failures: the above, and a second for `tests/du/threshold.sh` because the
`pyinotify` package is not available to `/usr/bin/python`.  These do not
prevent installation as a module.

Use mf from 8.25 on milou.

Build for rackham.  On rackham5, copy the tool tree from pica, first via a dry run:

    cd /sw/apps
    rsync --dry-run --del -Pa /mnt/sw/apps/coreutils .

If all looks good, sync for real.

    rsync --del -Pa /mnt/sw/apps/coreutils .

Then build on rackham5, following the above, from `VERSION=` through `make
install`.

If all goes well with the build, then create the symlinks for bianca and irma
while still on rackham5.

    cd /sw/apps/coreutils/$VERSION
    ln -s rackham bianca
    ln -s rackham irma

Then copy the whole tree back over to pica. 

    cd /sw/apps
    rsync --dry-run --del -Pa coreutils /mnt/sw/apps/

If all looks good, sync for real.

    rsync --del -Pa coreutils /mnt/sw/apps/

No need to create another mf file, but do make sure once the tree is copied
back over to pica/milou that links for mf files for all systems are under
`/sw/mf/...` on pica/milou.  If using the bash functions from
`uppmax_functions.sh` at <https://github.com/UPPMAX/install-methods>, it would
be

    all_mflink --apps -f coreutils $VERSION

And then, when these are created, on rackham5 sync over the mf files to
rackham:

    rackham_mfupdate --apps -f coreutils

The links for bianca and irma, created via `ln -s` and `all_mflink` above, are
swept up in the scheduled rsyncs to those systems.

