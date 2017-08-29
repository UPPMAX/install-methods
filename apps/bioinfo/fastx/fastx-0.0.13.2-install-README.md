fastx/0.0.13.2
==============

LOG
---

### To install on kalkyl

Copy to the glob folder in home

    cd glob
    wget http://hannonlab.cshl.edu/fastx_toolkit/fastx_toolkit-0.0.13.2.tar.bz2

Unpack:

    bunzip2 fastx_toolkit-0.0.13.2.tar.bz2 
    tar xvf fastx_toolkit-0.0.13.2.tar 

Create directories:

    mkdir //////sw/apps/bioinfo/fastx/0.0.13.2
    mkdir //////sw/apps/bioinfo/fastx/0.0.13.2/kalkyl

Install:

    export PKG_CONFIG_PATH=//////sw/apps/bioinfo/fastx/gtextutils-0.6.1/lib/pkgconfig:$PKG_CONFIG_PATH
    module load gcc/4.6
    cd fastx_toolkit-0.0.13.2
    ./configure --prefix=//////sw/apps/bioinfo/fastx/0.0.13.2/kalkyl
    make
    make check
    make install
