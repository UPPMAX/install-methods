Notes
-----
According to the documentation for pysam 0.7.7 (latest release):

   Pysam has been compiled on various linux systems and works
   with python 2.6 and python 2.5.
   Python 2.7 and Python 3 have not been tested.

Simple method:

    pip install --install-option="--prefix=$PYSAM_VERSION/milou" pysam

Failed.



Separation
----------
Python 3.3 was requested but also made for Python 2 for other users.
Decided to make separate folders for versions since pysam uses a single
bin folder.


INSTALLATION
============


Python 2
--------

    module load python/2.7.6
    mkdir -p export /sw/apps/bioinfo/pysam/0.7.7/milou/lib/python2.7/site-packages
    export PYTHONPATH=/sw/apps/bioinfo/pysam/0.7.7/milou/lib/python2.7/site-packages/

    python setup.py build
    python setup.py install --prefix=/sw/apps/bioinfo/pysam/0.7.7/milou


Python 3
--------

    module load python/3.3.1
    mkdir -p /sw/apps/bioinfo/pysam/0.7.7-py3/milou/lib/python3.3/site-packages
    export PYTHONPATH=/sw/apps/bioinfo/pysam/0.7.7-py3/milou/lib/python3.3/site-packages/

    export LDFLAGS="-L/sw/comp/python/3.3/lib"
    python3 setup.py build
    python3 setup.py install --prefix=/sw/apps/bioinfo/pysam/0.7.7-py3/milou
