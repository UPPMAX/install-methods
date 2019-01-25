Mothur 1.40.5
=============

<http://www.mothur.org/>

I based this heavily on the instructions for 1.36.1. Things seems simpler now than they were. 

    cd /sw/apps/Mothur/1.40.5
    mkdir src rackham
    ln -s ./rackham bianca
    ln -s ./rackham irma
    cd src/
    wget https://github.com/mothur/mothur/archive/v1.40.5.tar.gz
    tar xzf v1.40.5.tar.gz 
    cd mothur-1.40.5/
    module load gcc/6.3.0
    module load boost/1.63.0_gcc6.3.0
    module load zlib

Now edit the `makefile` as follows.
Set the Boost library and include directories from $BOOST_ROOT 
BOOST_LIBRARY_DIR=${BOOST_ROOT}/lib
BOOST_INCLUDE_DIR=${BOOST_ROOT}/inc


Now make and copy executables over.

    make
    cd ../../
    cd rackham/
    cp ../../src/mothur-1.40.5/{mothur,uchime} .

Copy over the `blast/2.2.25` executables from 1.33.3.

    cp -av ../../../1.33.3/milou/bin/blast .


