python/3.5.0
============

Followed this, 

Not actually following this for 3.6.0.  Build problems on milou related to
ATLAS.  Built find on rackham.

Neither PYTHONHOME nor LD_LIBRARY_PATH should be set:

* If PYTHONHOME is set, this interferes when a user runs other Python
  interpreters. The correct PYTHONHOME is figured out by the interpreter
  anyway if the correct --prefix= parameter was given to the configure
  script.

* LD_LIBRARY_PATH also interferes with other Pythons. Especially when
  compiling extension modules, the wrong Python shared libraries may
  be picked up. Instead of LD_LIBRARY_PATH, embed the correct path to
  the shared library into the binary using the linker's -rpath option
  (see command below).

**For sqlite3**, rather than build it from scratch (which would be better) the
system sqlite3 is used when building sqlite extensions.  Unfortunately it is
expecting an sqlite3 newer than that on milou, so load an sqlite3 module and
set rpath accordingly.

LOG
---

    VERSION=3.5.0
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    TARGET=/sw/comp/python/${VERSION}_${CLUSTER}
    mkdir -p $TARGET/src
    #fixup -g $TARGET
    cd $TARGET/src
    [[ -f Python-${VERSION}.tgz ]] || wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz
    rm -rf Python-${VERSION}/
    tar xzf Python-${VERSION}.tgz 
    cd Python-${VERSION}/
    #module load sqlite/3.16.2
    #SQLITE_LIBDIR=$(pkg-config sqlite3 --variable=libdir)
    #./configure --prefix=$TARGET --enable-shared --enable-loadable-sqlite-extensions LDFLAGS="-Wl,-rpath=$TARGET/lib,-rpath=$SQLITE_LIBDIR,-rpath=/sw/libs/wxWidgets/lib"
    ./configure --prefix=$TARGET --enable-shared --enable-loadable-sqlite-extensions LDFLAGS="-Wl,-rpath=$TARGET/lib,-rpath=/sw/libs/wxWidgets/lib"
    make && make install


PREINSTALLED PACKAGES
---------------------

    module load python/$VERSION
    which python3
    which pip3

    pip3 install --upgrade pip
    pip3 install Cython
    pip3 install nose
    pip3 install mock
    pip3 install pytz
    pip3 install six
    pip3 install numpy 
    pip3 install scipy
    pip3 install matplotlib
    pip3 install jupyter_client
    pip3 install ipython
    pip3 install jupyter
    pip3 install singledispatch
    pip3 install pyparsing
    pip3 install virtualenv
    pip3 install gitpython
    pip3 install python-graph-dot
    pip3 install graphviz
