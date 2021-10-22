# SCons-2.5.0-install-README.md

SCons
=======

A software construction tool (like "make")  
<http://scons.org>

Installation
------------

Downloaded source tarball from <http://scons.org/pages/download.html>.
Installed in /sw/apps/build through package's _setup.py_ script.

    VERS=2.5.0
    INST=/sw/apps/build/SCons/$VERS/$CLUSTER
    module load python/2.7.6
    mkdir $INST
    export PYTHONPATH=$INST/lib/python2.7/site-packages
    python setup.py install --prefix=$INST

---
wesleys  
2016-06-29
