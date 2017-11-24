Python 3.4.3
============

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
    TARGET=/sw/comp/python/${VERSION}_$CLUSTER
    mkdir -p $TARGET/src
    fixup -g $TARGET
    cd $TARGET/src
    [[ -f Python-3.4.3.tgz ]] || wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz
    tar xzf Python-3.4.3.tgz 
    cd Python-3.4.3/
    ./configure --prefix=$TARGET --enable-shared LDFLAGS="-Wl,-rpath=$TARGET/lib,-rpath=/sw/libs/wxWidgets/lib"
    make && make install

Make sure `python3` is the newly-built python.  Add to the the local packages.

    module load python/$VERSION
    which python3
    which pip3

    pip3 install Cython
    pip3 install nose
    pip3 install mock
    pip3 install pytz
    pip3 install six
    pip3 install numpy 
    pip3 install scipy
    pip3 install matplotlib
    pip3 install ipython
    pip3 install jupyter
    pip3 install singledispatch
    pip3 install pyparsing
    pip3 install virtualenv
    pip3 install gitpython
    pip3 install python-graph-dot
    pip3 install graphviz

