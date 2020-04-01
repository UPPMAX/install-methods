python/3.7.2
============

Followed this, 

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

    VERSION=3.7.2
    cd /sw/comp/python
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSIONDIR=${VERSION}_${CLUSTER}
    mkdir -p $VERSIONDIR
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $VERSIONDIR ${VERSION}_${CL} ; done
    PREFIX=$PWD/$VERSIONDIR
    chmod g+s $PREFIX
    cd $PREFIX
    mkdir src
    cd src
    [[ -f Python-${VERSION}.tgz ]] || wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz
    rm -rf Python-${VERSION}/
    tar xzf Python-${VERSION}.tgz 
    cd Python-${VERSION}/
    module load sqlite/3.24.0
    SQLITE_LIBDIR=$(pkg-config sqlite3 --variable=libdir)
    ./configure --prefix=$PREFIX --enable-shared --enable-loadable-sqlite-extensions --enable-optimizations LDFLAGS="-Wl,-rpath=$PREFIX/lib,-rpath=$SQLITE_LIBDIR,-rpath=/sw/libs/wxWidgets/lib"
    make && make install


PREINSTALLED PACKAGES
---------------------

The load of ATLAS is required for numpy.  The install of `gitpython`,
`python-graph-dot` and `graphviz` is for
[EasyBuild](https://easybuild.readthedocs.io/en/latest/Installation.html#optional-python-packages),
which seems to build with python2.

    VERSION=3.7.2

    module load ATLAS/3.10.3
    echo ${ATLAS:?ATLAS environment variable must be set}

    module load python/$VERSION
    which python3
    which pip3

    pip3 install --upgrade pip
    pip3 install --upgrade setuptools
    pip3 install --upgrade wheel
    pip3 install Cython
    pip3 install nose
    pip3 install mock
    pip3 install pytz
    pip3 install six
    pip3 install numpy 
    pip3 install scipy
    pip3 install matplotlib
    pip3 install pyyaml
    pip3 install pandas
    pip3 install h5py
    pip3 install pysqlite3
    pip3 install twisted requests pillow pygments nltk
    # Do not install wxpython, cannot be installed, requires removal of --enable-mediactrl option in ./configure
    # pip3 install wxpython 
    pip3 install qtgui python_qt_binding
    pip3 install ipython
    pip3 install jupyter
    pip3 install singledispatch
    pip3 install pyparsing
    pip3 install virtualenv
    pip3 install gitpython
    pip3 install python-graph-dot
    pip3 install graphviz
    pip3 install cget


Now lock it down.

    chmod -R -w /sw/comp/python/${VERSION}_${CLUSTER}


## non-3-suffixed names

For any of the python/3.* packages, we need to provide `python` and other names
that point correctly to the python/3.* python.  Do *not* do this for the
python3/3.* packages, which are meant to be loadable next to a python/2.*
packages.

    cd $PREFIX/bin
    chmod u+w . && for B in python idle pydoc ; do ( test -f ${B}3 && ln -sf ${B}3 ${B} ) ; test -f python3-config && ln -sf python3-config python-config; done ; chmod u-w .
