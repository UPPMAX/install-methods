# python-2.7.13_CLUSTER-install-README.md

Installation of python/2.7.13
----------------------------

Similar to installation of "new 2.7.6" but skips rpy2.

    VERS=2.7.13
    INST=/sw/comp/python/${VERS}_${CLUSTER}
    mkdir -p $INST/src
    cd $INST/src
    chgrp -R sw $INST

Get latest release from <https://www.python.org/downloads/source/> and
build with system gcc.

    wget https://www.python.org/ftp/python/$VERS/Python-$VERS.tgz
    tar xzf Python-$VERS.tgz
    cd Python-$VERS
    ./configure --enable-shared --prefix=$INST
    make && make install

Set up variables. Make sure no other python loaded.

    cd ../../bin
    export PATH=$PWD:$PATH
    cd ../lib
    export LD_LIBRARY_PATH=$PWD:$LD_LIBRARY_PATH
    cd python2.7
    export PYTHONPATH=$PWD

Make sure `python` is the newly-built python.

    which python

Now install basic packages, for historical reasons.
Skip rpy2 to avoid R version complexities.

    pip install numpy scipy ipython Cython matplotlib mock nose pytz six singledispatch pyparsing pysqlite
    easy_install virtualenv


Need to reduce access so admins don't overwrite installation when adding new packages,
but, when installing away from the dominant storage cluster, the folder needs to be moved first
since `scp` doesn't preserve group ownership (at, not for me with "-p"). This is less of an issue
when the dominant cluster is mounted. The tmp name is to avoid the potential race condition where
the synchronization overwrites partially copied files. 

    DOMINANT=milou
    cd /sw/comp/python
    mv ${VERS}\_${CLUSTER} ${VERS}\_${CLUSTER}_tmp
    scp -rp ${VERS}\_${CLUSTER}_tmp ${USER}@${DOMINANT}.uppmax.uu.se:/sw/comp/python/${VERS}\_${CLUSTER}

After the remote copy is checked

    rm -rf ${VERS}_${CLUSTER}_tmp

On the dominant cluster (whether installed there or copied)

    cd /sw/comp/python
    INST=${VERS}\_${CLUSTER}
    chgrp -R sw $INST
    chmod -R -w $INST

