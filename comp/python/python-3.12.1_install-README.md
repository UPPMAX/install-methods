python/3.12.1
========================

<https://python.org/>

Used under license:
PSF License Agreement
<https://docs.python.org/3/license.html>

Structure creating script (makeroom_python_3.12.1.sh) moved to /sw/comp/python/makeroom_3.12.1.sh

Starting with this version 3.9.5, abandon the ${VERSION}_${CLUSTER} prefix structure for
the usual $VERSION/$CLUSTER.

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

* For `python` >= 3.10, OpenSSL 1.1 must be used during compilation.
  You can pass our EB installation to `--with-openssl` (se below).

Also NOTE: There are some customisations below following the makeroom process
that matches what we have done for the python module.  This is simply legacy
stuff, that this python module is structured this way.


LOG
---

    makeroom.sh "-f" "-t" "python" "-v" "3.12.1" "-c" "comp" "-w" "https://python.org/" "-l" "PSF License Agreement" "-L" "https://docs.python.org/3/license.html" "-d" "Python programming language plus a handful of widely used packages"
    ./makeroom_python_3.12.1.sh

    source /sw/comp/python/SOURCEME_python_3.12.1
    cd $SRCDIR

    [[ -f Python-${VERSION}.tgz ]] || wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz
    rm -rf Python-${VERSION}/
    tar xzf Python-${VERSION}.tgz 
    cd Python-${VERSION}/
    module load sqlite/3.34.0
    module load gcc/12.3.0
    module load Tcl-Tk/8.6.11
    SQLITE_LIBDIR=$(pkg-config sqlite3 --variable=libdir)
    TCL_TK_LIBDIR=$TCL_TK_ROOT/lib
    ./configure --prefix=$PREFIX --enable-shared --enable-loadable-sqlite-extensions --enable-optimizations LDFLAGS="-Wl,-rpath=$PREFIX/lib,-rpath=$SQLITE_LIBDIR,-rpath=$TCL_TK_LIBDIR,-rpath=/sw/libs/wxWidgets/lib"
    ./configure -C \
    --prefix=$PREFIX \
    --enable-shared \
    --enable-loadable-sqlite-extensions \
    --enable-optimizations LDFLAGS="-Wl,-rpath=$PREFIX/lib,-rpath=$SQLITE_LIBDIR,-rpath=$TCL_TK_LIBDIR,-rpath=/sw/libs/wxWidgets/lib" \
    --with-openssl=/sw/EasyBuild/rackham/software/OpenSSL/1.1 \
    --with-openssl-rpath=auto

    make && make install


PREINSTALLED PACKAGES
---------------------

The load of ATLAS is required for numpy.  The install of `gitpython`,
`python-graph-dot` and `graphviz` is for
[EasyBuild](https://easybuild.readthedocs.io/en/latest/Installation.html#optional-python-packages),
which seems to build with python2.


    VERSION=3.12.1

    module load ATLAS/3.10.3
    echo ${ATLAS:?ATLAS environment variable must be set}

    module load python/$VERSION
    which python3
    which pip3

    pip3 install --upgrade pip
    pip3 install --upgrade setuptools
    pip3 install --upgrade wheel
    # Do not install wxpython, cannot be installed, requires removal of --enable-mediactrl option in ./configure
    # pip3 install wxpython
    pip3 install virtualenv
    pip3 install Cython
    pip3 install anndata
    pip3 install black
    pip3 install flake8
    pip3 install mypy
    pip3 install cget
    pip3 install dask
    pip3 install fastparquet
    pip3 install flake8
    pip3 install flask
    pip3 install gitpython
    pip3 install graphviz
    pip3 install h5py
    pip3 install ipython
    pip3 install jupyter
    pip3 install jupyterlab
    pip3 install lmfit
    pip3 install matplotlib
    pip3 install mkdocs
    pip3 install mock
    pip3 install mypy
    pip3 install natsort
    pip3 install networkx
    pip3 install nose
    pip3 install numpy
    pip3 install openpyxl
    pip3 install pandas
    pip3 install poetry
    pip3 install pyarrow
    pip3 install pyparsing
    pip3 install pyqt5
    pip3 install pysqlite3
    pip3 install pytest
    pip3 install python-graph-dot
    pip3 install pytz
    pip3 install pyyaml
    pip3 install qtgui
    pip3 install python_qt_binding
    pip3 install renderer
    pip3 install reportlab
    pip3 install ruamel.yaml
    pip3 install scipy
    pip3 install singledispatch
    pip3 install six
    pip3 install sympy
    pip3 install spython
    pip3 install twisted
    pip3 install requests
    pip3 install pillow
    pip3 install pygments
    pip3 install nltk
    pip3 install "pybind11[global]"


Add a complete list of installed packages to the module help in the file for
this version.  This list is produced with the script `piplist` located under
`$TOOLDIR/mf`. 

    cd $TOOLDIR/mf
    ./piplist $VERSION

Incorporate this list into the mf file for `$VERSION`.  Copy to the /sw/mf/common tree.

Next, lock it down.

    chmod -R -w $PREFIX

or better

    fixup -P 555 $PREFIX


Non-3-suffixed names
--------------------

For any of the python/3.* packages, we need to provide `python` and other names
that point correctly to the python/3.* python.  Do *not* do this for the
python3/3.* packages, which are meant to be loadable next to a python/2.*
packages.
``` bash
    cd $PREFIX/bin
    chmod u+w . && for B in python idle pydoc pip ; do ( test -f ${B}3 && ln -sf ${B}3 ${B} ) ; test -f python3-config && ln -sf python3-config python-config; done ; chmod u-w .
```

