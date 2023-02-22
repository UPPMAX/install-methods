python3/3.10.8
========================

<https://python.org/>

Used under license:
PSF License Agreement
<https://docs.python.org/3/license.html>



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
  You can pass our EB installation to `--with-openssl`` (se below).

Also NOTE: There are some customisations below following the makeroom process
that matches what we have done for the python module.  This is simply legacy
stuff, that this python module is structured this way.


LOG
---

    makeroom.sh -f -t python3 -v 3.10.8 -c comp -w https://python.org/ -l "PSF License Agreement"  -L https://docs.python.org/3/license.html -d "Python programming language plus a handful of widely used packages ; this module does not conflict with python/x.y.z modules"
    ./makeroom_python3_3.10.8.sh 
    source /sw/comp/python/SOURCEME_python3_3.10.8 && cd $TOOLDIR
    cd $SRCDIR

    [[ -f Python-${VERSION}.tgz ]] || wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz
    rm -rf Python-${VERSION}/
    tar xzf Python-${VERSION}.tgz 
    cd Python-${VERSION}/
    module load sqlite/3.34.0
    module load gcc/12.2.0   
    SQLITE_LIBDIR=$(pkg-config sqlite3 --variable=libdir)
    ./configure --prefix=$PREFIX --enable-shared --enable-loadable-sqlite-extensions --enable-optimizations LDFLAGS="-Wl,-rpath=$PREFIX/lib,-rpath=$SQLITE_LIBDIR,-rpath=/sw/libs/wxWidgets/lib"
    ./configure -C \
    --prefix=$PREFIX \
    --enable-shared \
    --enable-loadable-sqlite-extensions \
    --enable-optimizations LDFLAGS="-Wl,-rpath=$PREFIX/lib,-rpath=$SQLITE_LIBDIR,-rpath=/sw/libs/wxWidgets/lib" \
    --with-openssl=/sw/EasyBuild/rackham/software/OpenSSL/1.1 \
    --with-openssl-rpath=auto

    make && make install


PREINSTALLED PACKAGES
---------------------

The load of ATLAS is required for numpy.  The install of `gitpython`,
`python-graph-dot` and `graphviz` is for
[EasyBuild](https://easybuild.readthedocs.io/en/latest/Installation.html#optional-python-packages),
which seems to build with python2.

    VERSION=3.10.8

    module load ATLAS/3.10.3
    echo ${ATLAS:?ATLAS environment variable must be set}

    module load python3/$VERSION
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
    pip3 install networkx
    pip3 install pyyaml
    pip3 install pandas
    pip3 install openpyxl
    pip3 install reportlab
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
    pip3 install pyqt5
    pip3 install pytest
    pip3 install lmfit
    pip3 install natsort
    pip3 install jupyterlab
    pip3 install sympy
    pip3 install poetry
    pip3 install black
    pip3 install flake8
    pip3 install mypy
    pip3 install pyarrow
    pip3 install fastparquet
    pip3 install anndata


The `pip` must be removed from from `$PREFIX/bin/` or it will override `pip`
for the `python/x.y.z` module.

``` bash
 rm $PREFIX/bin/pip
```

Add a complete list of installed packages to the module help in the file for
this version.  This list is produced with the script `piplist` located under
`$TOOLDIR/mf`. Next, lock it down.

    chmod -R -w $PREFIX
