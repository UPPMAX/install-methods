spaln/2.1.4
===========

I would like to be able to provide a link to a homepage, but it is gone.

This version is built with provision for libraries and header files.

LOG
---

Got the source tarball from a user, so drop it here in `src/`.  It is
older-style c++ and won't cleanly compile with gcc 6+, so I used `gcc/5.4.0`.
Also, its `./configure` expects `CC` to be the default name for c++.  Set that
on the command line and specify the multiple options for installation
locations.  Libraries, include files, man pages and docs will be installed
manually.


    TOOL=/sw/apps/bioinfo/spaln
    VERSION=2.1.4
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    mkdir -p include lib man/man1 doc
    cd ../src
    tar xzf spaln${VERSION}.tar.gz 
    cd spaln${VERSION}/
    cd src
    module load gcc/5.4.0
    make clearall
    CC=g++ ./configure --exec_prefix=$PFX/bin --table_dir=$PFX/table --alndbs_dir=$PFX/seqdb
    make
    make install
    cp -av *.h $PFX/include/
    cp -av *.a $PFX/lib/
    cd ../doc
    cp -av * $PFX/doc/
    cd ..
    cp -av *.1 $PFX/man/man1/
    cp -av perl $PFX/
    cd ..
    rm -rf spaln${VERSION}/


Use the mf from `spaln/2.3.1`, but add `LIBRARY_PATH`, for static libarries,
and `CPLUS_INCLUDE_PATH`, place the man pages in a different place, and set
`SPALN_ROOT` to `$modroot`.  Go back and change `2.3.1` to put its man pages
out of `doc/`.

