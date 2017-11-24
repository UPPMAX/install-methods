python module installs
======================

Neither `PYTHONHOME` nor `LD_LIBRARY_PATH` should be set by the module for
Python-specific reasons.

* If PYTHONHOME is set, this interferes when a user runs other Python
  interpreters. The correct PYTHONHOME is figured out by the interpreter
  anyway if the correct --prefix= parameter was given to the configure
  script.

* LD_LIBRARY_PATH also interferes with other Pythons. Especially when
  compiling extension modules, the wrong Python shared libraries may
  be picked up. Instead of LD_LIBRARY_PATH, embed the correct path to
  the shared library into the binary using the linker's -rpath option
  (see command below).

Command line
------------

    cd /sw/comp/python
    VERSION=2.7.11
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    TARGET=/sw/comp/python/${VERSION}_$CLUSTER
    mkdir -p $TARGET
    cd $TARGET
    [[ -f Python-$VERSION.tgz ]] || wget https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz
    tar xzf Python-$VERSION.tgz
    cd Python-$VERSION/

    ./configure --prefix=$TARGET --enable-shared LDFLAGS="-Wl,-rpath=$TARGET/lib"
    make && make install
    cd ..

Fix the module system WITHOUT having `LD_LIBRARY_PATH` contain the path to libpython2.7.so and without `PYTHONHOME` set.

    module load python/$VERSION
    [[ ! "$PYTHONHOME" ]] || echo "*** PYTHONHOME is set and shouldn't be"

    # for 2.7.*; not 3.*
    wget http://pypi.python.org/packages/source/d/distribute/distribute-0.6.49.tar.gz
    tar xf distribute-0.6.49.tar.gz 
    cd distribute-0.6.49/
    python setup.py install

    easy_install pip

    # for everyone (easy_install-3.4 for version 3.*)
    easy_install Cython
    easy_install nose
    easy_install mock
    easy_install pytz
    easy_install stix
    easy_install numpy 
    easy_install scipy
    easy_install matplotlib
    easy_install tornado
    easy_install jupyter_client
    easy_install jupyter
    easy_install ipython
    easy_install singledispatch
    easy_install pyparsing
    easy_install virtualenv
    easy_install gitpython
    easy_install python-graph-dot
    easy_install graphviz

Close things up.

    fixup -g $TARGET
    chmod -R -w $TARGET

