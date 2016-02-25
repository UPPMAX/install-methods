# SGA-0.10.14-install-README.md

SGA
===

String Graph Assembler

<https://github.com/jts/sga>

Log
---

Several prereqs, see the website and the log below.  For python wrapper scripts
it mentions a dependence on ruffus, which requires sqlite3.  The Uppmax
installation of python/2.7.6 is broken with respect to sqlite3, so users using
these should load python/2.7.9, which is not available currently on tintin.
Instead of loading it, I just print a message.

    cd /sw/apps/bioinfo/
    mkdir SGA
    cd SGA
    mkdir mf 0.10.14
    cd 0.10.14/
    mkdir milou src
    cd src/
    wget https://github.com/jts/sga/archive/v0.10.14.tar.gz
    tar xzf v0.10.14.tar.gz 
    mkdir prereqs
    cd prereqs/
    wget https://github.com/sparsehash/sparsehash/archive/sparsehash-2.0.3.tar.gz
    tar xzf sparsehash-2.0.3.tar.gz 
    cd sparsehash-sparsehash-2.0.3/

Installation prefix.

    P=/sw/apps/bioinfo/SGA/0.10.14/milou
    module load gcc/4.9.2
    ./configure  --prefix=$P
    make && make install
    cd ..

Python prereqs. PYTHONPATH must contain
/sw/apps/bioinfo/SGA/0.10.14/milou/lib/python2.7/site-packages.

    cd ../sga-0.10.14/
    module load python/2.7.9
    PYTHONUSERBASE=$P pip install --user pysam
    PYTHONUSERBASE=$P pip install --user ruffus

Now build the executable.

    cd src/
    module load zlib/1.2.8 jemalloc/3.6.0 bioinfo-tools bamtools/2.3.0
    ./autogen.sh 
    ./configure --prefix=$P --with-sparsehash=$P --with-jemalloc=$JEMALLOC_LIBRARY --with-bamtools=$BAMTOOLS

    make
    make install


The mf file must allow finding libz and the gcc libraries.  See its contents
for more.

