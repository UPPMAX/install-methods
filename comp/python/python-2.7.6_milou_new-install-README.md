# python-2.7.6_milou_new-install-README.md

New installation of python/2.7.6
================================

Perform a new install of the `python/2.7.6` module, as the current one might be
corrupted.  Currently this generates an error that it can't find `_sqlite3`:

    python
    >>> import sqlite3

Log
---

    CLUSTER=milou
    cd /sw/comp/python
    mkdir 2.7.6_${CLUSTER}_new
    cd 2.7.6_${CLUSTER}_new/
    mkdir src
    cd src

Get python 2.7.6 from <https://www.python.org/download/releases/2.7.6/> and
build with system gcc.

    wget https://www.python.org/ftp/python/2.7.6/Python-2.7.6.tgz
    tar xzf Python-2.7.6.tgz 
    cd Python-2.7.6/
    ./configure --prefix=/sw/comp/python/2.7.6_${CLUSTER}_new
    make && make install

Set up variables. Make sure no other python loaded.

    cd ../../bin
    export PATH=$PWD:$PATH
    cd ../lib/python2.7
    export PYTHONPATH=$PWD

Make sure `python` is the newly-built python.

    which python

Get pip from <https://pip.pypa.io/en/stable/installing/>

    cd ../../bin
    wget https://bootstrap.pypa.io/get-pip.py
    python get-pip.py

Now install basic packages, as determined from looking at
`lib/python2.7/site-packages` for the existing python/2.7.6 module.

    ls -l ../lib/python2.7/site-packages/
    pip install numpy scipy ipython Cython matplotlib mock nose pytz six singledispatch rpy2 pyparsing pysqlite

