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
    VERSION=2.7.15
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    TARGET=/sw/comp/python/${VERSION}_$CLUSTER
    mkdir -p $TARGET
    if [[ $CLUSTER == rackham ]] ; then
        for CL in bianca irma ; do
            ln -s ${TARGET##*/} ${VERSION}_$CL
        done
    fi
    cd $TARGET
    mkdir src
    cd src
    [[ -f Python-$VERSION.tgz ]] || wget https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz
    tar xzf Python-$VERSION.tgz
    cd Python-$VERSION/

    ./configure --prefix=$TARGET --enable-optimizations --enable-shared LDFLAGS="-Wl,-rpath=$TARGET/lib"
    make && make install
    cd ..

Fix the module system WITHOUT having `LD_LIBRARY_PATH` contain the path to libpython2.7.so and without `PYTHONHOME` set.

    module load python/$VERSION
    [[ ! "$PYTHONHOME" ]] || echo "*** PYTHONHOME is set and shouldn't be"

Now setuptools and pip must be installed from tarballs.

    # for 2.7.*; not 3.*
    wget https://files.pythonhosted.org/packages/1a/04/d6f1159feaccdfc508517dba1929eb93a2854de729fa68da9d5c6b48fa00/setuptools-39.2.0.zip#sha256=f7cddbb5f5c640311eb00eab6e849f7701fa70bf6a183fc8a2c33dd1d1672fb2
    unzip setuptools-39.2.0.zip
    cd setuptools-39.2.0
    python setup.py install
    cd ..
    wget https://files.pythonhosted.org/packages/ae/e8/2340d46ecadb1692a1e455f13f75e596d4eab3d11a57446f08259dee8f02/pip-10.0.1.tar.gz#sha256=f2bd08e0cd1b06e10218feaf6fef299f473ba706582eb3bd9d52203fdbd7ee68
    tar xzf pip-10.0.1.tar.gz
    cd pip-10.0.1
    python setup.py install
    cd ..

    # for everyone (easy_install-3.4 for version 3.*)
    pip install --verbose Cython
    pip install --verbose nose
    pip install --verbose mock
    pip install --verbose pytz
    pip install --verbose pytest-runner  # for whatever reason, the install of ordered-set requested by stix failed because this wasn't installed
    pip install --verbose ordered-set
    pip install --verbose stix
    pip install --verbose numpy 
    pip install --verbose scipy
    pip install --verbose matplotlib
    pip install --verbose tornado
    pip install --verbose jupyter_client
    pip install --verbose jupyter
    pip install --verbose ipython
    pip install --verbose singledispatch
    pip install --verbose pyparsing
    pip install --verbose virtualenv
    pip install --verbose gitpython
    pip install --verbose python-graph-dot
    pip install --verbose graphviz
    pip install --verbose pandas

Close things up.

    fixup -g $TARGET
    chmod -R -w $TARGET

