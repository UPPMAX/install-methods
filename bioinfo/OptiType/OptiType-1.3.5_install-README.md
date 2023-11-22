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

The glpk and COIN-OR-OptimizationSuite modules must be laoded when the pyomo
package is installed below, so it can see them and configure itself
accordingly.

    ml python/2.7.15
    ml glpk/5.0
    ml COIN-OR-OptimizationSuite/1.8.0
    ml bioinfo-tools
    ml samtools/1.4
    virtualenv venv
    ml -python

Installing the python packages requires some additional work. The numexpr
version needs to be foollowed, otherwise tables can't install.

    source venv/bin/activate
    pip install -I pyomo
    ###  pip install PyUtilib==5.3.5  # this should be installed by pyomo
    pip install numpy==1.14.5 numexpr==2.5.2 table==0.0.4 tables==3.4.3 pandas==0.18.1 pysam==0.14.1 matplotlib==2.2.5
    pip install future

Now replace the #! line in OptiTypePipeline.py with the python2 from the venv.

    ll $PWD/venv/bin/python2
    cd OptiType-1.3.5/
    vi OptiTypePipeline.py 

In the mf file, load

    ml glpk/5.0
    ml COIN-OR-OptimizationSuite/1.8.0
    ml samtools/1.4

and add to PATH:

    $modroot/OptiType-1.3.5 
    $modroot/bin

It works as is, but config.ini changes are necessary.

Add path to razers3, make threads=20, and add message about the file to mf file.

