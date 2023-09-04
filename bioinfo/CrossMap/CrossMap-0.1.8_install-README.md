CrossMap/0.1.8
==============

We have the source bundle, but this was never installed?  Or was 0.1.8 labeled as 0.1.2?  I think the latter, so I will correct.

Old installation, only on milou/halvan/nestor. Not going to make this available on the newer clusters.


LOG
---


### Download


    wget http://downloads.sourceforge.net/project/crossmap/CrossMap-0.1.8.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fcrossmap%2Ffiles%2F
    mv CrossMap-0.1.8.tar.gz\?r\=http\:%2F%2Fsourceforge.net%2Fprojects%2Fcrossmap%2Ffiles%2F CrossMap-0.1.8.tar.gz


### Use python/2.7.4

    module load python/2.7.4



### Installation

    wget http://downloads.sourceforge.net/project/crossmap/CrossMap-0.1.8.tar.gz
    tar xzf CrossMap-0.1.8.tar.gz
    python setup.py install --root=/sw/apps/bioinfo/CrossMap/0.1.8/milou
 


# need this for running:

    export PYTHONPATH=/sw/apps/bioinfo/CrossMap/0.1.8/milou/sw/comp/python/2.7.4/lib/python2.7/site-packages:$PYTHONPATH
    export PATH=/sw/apps/bioinfo/CrossMap/0.1.8/milou/sw/comp/python/2.7.4/bin:$PATH
