# python-3.6.0_CLUSTER-install-README.md

Installation of python/3.6.0
----------------------------

Similar to installation of "new 2.7.6" but skips pysqlite and rpy2.
Note also that pip3 gets installed automatically.

    VERS=3.6.0
    INST=/sw/comp/python/${VERS}_${CLUSTER}
    mkdir -p $INST/src
    cd $INST/src
    chgrp -R sw $INST

Get latest release from <https://www.python.org/downloads/source/> and
build with system gcc.

    wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz
    md5sum Python-3.6.0.tgz
    tar xzf Python-3.6.0.tgz
    cd Python-3.6.0/
    ./configure --enable-shared --prefix=$INST
    make && make install

Set up variables. Make sure no other python loaded.

    cd ../../bin
    export PATH=$PWD:$PATH
    cd ../lib
    export LD_LIBRARY_PATH=$PWD:$LD_LIBRARY_PATH
    cd python3.6
    export PYTHONPATH=$PWD

Make sure `python3` is the newly-built python.

    which python3

Now install basic packages, for historical reasons. Note the use of 'pip3'.
Skip pysqlite since Python 3 has a good version internally.

    pip3 install numpy scipy ipython Cython matplotlib mock nose pytz six singledispatch pyparsing
    easy_install-3.6 virtualenv

Reduce access so admins don't overwrite installation when adding new packages.

    chmod -R -w $INST

Have not done the "rpath stuff" since that method seems to interfere with the way _I_
install python-dependent modules (e.g., MultiQC).
 

If built away from the dominant storage cluster (currently: Pica), rename before copying
to avoid the potential race condition where the synchronization overwrites partially copied
files. For example, on Rackham, where Pica is mounted on '/mnt':

    cd /sw/comp/python
    mv ${VERS}_${CLUSTER} ${VERS}_${CLUSTER}_tmp
    cp -rp ${VERS}_${CLUSTER}_tmp /mnt$(pwd)/${VERS}_${CLUSTER}
    rm -rf ${VERS}_${CLUSTER}_tmp

