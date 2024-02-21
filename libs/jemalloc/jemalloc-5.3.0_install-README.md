jemalloc/5.3.0
==============

<http://jemalloc.net/>

Used under license:
Custom open-source
<https://raw.githubusercontent.com/jemalloc/jemalloc/dev/COPYING>

Structure creating script (makeroom_jemalloc_5.3.0.sh) moved to /sw/libs/jemalloc/makeroom_5.3.0.sh

LOG
---

    makeroom.sh -f -c libs -t jemalloc -v 5.3.0 -w http://jemalloc.net/ -d "jemalloc is a general purpose malloc(3) implementation that emphasizes fragmentation avoidance and scalable concurrency support" -l "Custom open-source" -L https://raw.githubusercontent.com/jemalloc/jemalloc/dev/COPYING
    ./makeroom_jemalloc_5.3.0.sh 
    source /sw/libs/jemalloc/SOURCEME_jemalloc_5.3.0
    cd $SRCDIR
    wget https://github.com/jemalloc/jemalloc/releases/download/5.3.0/jemalloc-5.3.0.tar.bz2
    tar xf jemalloc-5.3.0.tar.bz2 
    cd jemalloc-5.3.0/
    ml gcc/12.3.0
    echo $PREFIX
    ./configure --prefix=$PREFIX
    make -j10
    make check
    make install
