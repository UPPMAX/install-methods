Python 3.4.3 for tintin
=======================

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

    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=3.4.3
    TARGET=/sw/comp/python/${VERSION}_tintin
    mkdir -p $TARGET/src
    fixup -g $TARGET
    cd $TARGET/src
    [[ -f Python-3.4.3.tgz ]] || wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz
    tar xzf Python-3.4.3.tgz 
    cd Python-3.4.3/
    ./configure --prefix=$TARGET --enable-shared LDFLAGS="-Wl,-rpath=$TARGET/lib"
    make && make install

Set up variables. Make sure no other python loaded.

    cd ../../bin
    export PATH=$PWD:$PATH
    cd ../lib
    export LD_LIBRARY_PATH=$PWD:$LD_LIBRARY_PATH
    cd python3.4
    export PYTHONPATH=$PWD

Make sure `python3` is the newly-built python.

    which python3
    which easy_install-3.4

Add to the the local packages.

    easy_install-3.4 Cython
    easy_install-3.4 nose
    easy_install-3.4 mock
    easy_install-3.4 pytz
    easy_install-3.4 six
    easy_install-3.4 numpy 
    easy_install-3.4 scipy
    easy_install-3.4 matplotlib
    easy_install-3.4 ipython

