OptiType/1.3.5
========================

<https://github.com/FRED-2/OptiType>

Used under license:
BSD 3-clause
<https://raw.githubusercontent.com/FRED-2/OptiType/master/LICENSE>

Structure creating script (makeroom_OptiType_1.3.5.sh) moved to /sw/bioinfo/OptiType/makeroom_1.3.5.sh

LOG
---

    makeroom.sh -f -t OptiType -v 1.3.5 -w https://github.com/FRED-2/OptiType -l "BSD 3-clause" -L https://raw.githubusercontent.com/FRED-2/OptiType/master/LICENSE -d "Precision HLA typing from next-generation sequencing data"
    ./makeroom_OptiType_1.3.5.sh 
    source /sw/bioinfo/OptiType/SOURCEME_OptiType_1.3.5
    cd $SRCDIR
    wget https://github.com/FRED-2/OptiType/archive/refs/tags/v1.3.5.tar.gz
    cp -av OptiType-1.3.5 $PREFIX/
    wget http://packages.seqan.de/razers3/razers3-3.5.8-Linux-x86_64.tar.xz
    tar xf razers3-3.5.8-Linux-x86_64.tar.xz 
    cp -av razers3-3.5.8-Linux-x86_64/bin $PREFIX/
    cd $PREFIX
    bin/razers3 --version

    cd $PREFIX

    ml python/2.7.15
    ml hdf5/1.8.18
    ml glpk/5.0
    ml bioinfo-tools
    ml samtools/1.4
    virtualenv venv

Installing the python packages requires some additional work. The numexpr
version needs to be foollowed, otherwise tables can't install.

    $PREFIX/venv/bin/pip install numpy==1.9.3
    $PREFIX/venv/bin/pip install pyutilib==5.4
    $PREFIX/venv/bin/pip install pyomo==4.3.11388
    $PREFIX/venv/bin/pip install numexpr==2.5.2
    $PREFIX/venv/bin/pip install tables==3.2.3.1
    $PREFIX/venv/bin/pip install pandas==0.18.1
    $PREFIX/venv/bin/pip install pysam
    $PREFIX/venv/bin/pip install matplotlib
    $PREFIX/venv/bin/pip install future

The pyutilib that was installed is missing enum, which is needed. The quickest way to deal is simply to replace the tree with that from 1.3.1.

    cd $PREFIX/venv/lib/python2.7/site-packages
    rm -rf pyutilib
    cp -av $TOOLDIR/1.3.1/rackham/python_libs/lib/python2.7/site-packages/pyutilib .

Now replace the #! line in OptiTypePipeline.py with the python2 from the venv.

    ll $PWD/venv/bin/python2
    cd OptiType-1.3.5/
    vi OptiTypePipeline.py 

In the mf file, load

    ml python/2.7.15
    ml hdf5/1.8.18
    ml glpk/5.0
    ml samtools/1.4

and add to PATH:

    $modroot/OptiType-1.3.5 
    $modroot/bin

It works as is, but config.ini changes are necessary.

Add path to razers3, make threads=20, and add message about the file to mf file.

