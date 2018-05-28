KAT/2.4.2
=========

K-mer Analysis Toolkit

<https://github.com/TGAC/KAT>

LOG
---

Continue.

    VERSION=2.4.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo
    mkdir -p KAT
    cd KAT
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    PFX=$PWD/$CLUSTER
    cd src
    [[ -f kat-${VERSION}.tar.gz ]] || wget https://github.com/TGAC/KAT/archive/Release-${VERSION}.tar.gz
    tar xzf Release-${VERSION}.tar.gz 
    cd KAT-Release-${VERSION}
    module load gcc/6.3.0
    module load python/3.5.0
    ./build_boost.sh
    ./autogen.sh
    PYTHONUSERBASE=$PFX pip install --user tabulate
    PYTHONUSERBASE=$PFX pip install --user sphinx==1.3
    PATH=$PFX/bin:$PATH
    ./configure --prefix=$PFX
    make

There is an error in the install script for the `scripts` directory.

    cd scripts
    vi Makefile

Find the `setup.py install` line, and remove the option `--root=$(DESTDIR)`
since we don't set destdir.  Then do the installation.

    make install

Now copy the locally-built boost libraries to `$PFX/lib`.

    cd deps/boost/build/lib
    cp -av * $PFX/lib

Remove sphinx scripts, not needed for KAT.

    cd $PFX/bin
    rm -rf chardetect pybabel pygmentize rst* sphinx-* __pycache__

Now make sure the executables can find their libraries.  After installation,
the executables could not find two shared objects; the .so for python, and the
C++ libraries for kat_jellyfish.  Add directories for both to `LD_LIBRARY_PATH`
at the end of the module file. Use `$gccversion` and `$pythonversion`
variables for consistency.

The locally-built boost libraries cannot be found without this:

    prepend-path    LD_LIBRARY_PATH   $modroot/lib

Pick up the python .so, it is linked into the kat executable.  This is not included
in the python module load.

    prepend-path    LD_LIBRARY_PATH   /sw/comp/python/${pythonversion}_${Cluster}/lib

`kat_jellyfish` doesn't have RPATH properly set, so show it the C++ libraries.

    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/${gccversion}_${Cluster}/lib64
    prepend-path    LD_LIBRARY_PATH   /sw/comp/gcc/${gccversion}_${Cluster}/lib

Other paths to set, to run and also to build against.

    prepend-path    PATH                 $modroot/bin
    prepend-path    MANPATH              $modroot/share/man
    prepend-path    PKG_CONFIG_PATH      $modroot/lib/pkgconfig
    prepend-path    LD_RUN_PATH          $modroot/lib
    prepend-path    LIBRARY_PATH         $modroot/lib
    prepend-path    CPLUS_INCLUDE_PATH   $modroot/lib/kat-${version}
    prepend-path    CPLUS_INCLUDE_PATH   $modroot/lib/kat_jellyfish-${version}

Load the module and make sure it works.

    module unload gcc python
    module load bioinfo-tools KAT/$VERSION
    ldd $(which kat) $(which kat_jellyfish)
    kat
    kat_jellyfish

