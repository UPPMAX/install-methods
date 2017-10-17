python/3.6.0
============

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

LOG
---

    VERSION=3.6.0
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    TARGET=/sw/comp/python/${VERSION}_${CLUSTER}_new
    mkdir -p $TARGET/src
    fixup -g $TARGET
    cd $TARGET/src
    [[ -f Python-${VERSION}.tgz ]] || wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz
    rm -rf Python-${VERSION}/
    tar xzf Python-${VERSION}.tgz 
    cd Python-${VERSION}/
    ./configure --prefix=$TARGET --enable-shared LDFLAGS="-Wl,-rpath=$TARGET/lib,-rpath=/sw/libs/wxWidgets/lib"
    make && make install

Set up variables. Make sure no other python loaded.

    cd ../../bin
    export PATH=$PWD:$PATH
    cd ../lib/python${VERSION%.?}
    export PYTHONPATH=$PWD

Make sure `python3` is the newly-built python.

    which python3
    which easy_install-3.6

Add to the the local packages.

On milou, this wants ATLAS libraries.  These are installed on rackham, but not
milou.

    easy_install-3.6 Cython
    easy_install-3.6 nose
    easy_install-3.6 mock
    easy_install-3.6 pytz
    easy_install-3.6 six
    easy_install-3.6 numpy 
    easy_install-3.6 scipy
    easy_install-3.6 matplotlib
    easy_install-3.6 ipython
    easy_install-3.6 singledispatch
    easy_install-3.6 pyparsing
    easy_install-3.6 virtualenv

