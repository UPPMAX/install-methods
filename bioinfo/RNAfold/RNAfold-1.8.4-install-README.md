# RNAfold-1.8.4-install-README.md

RNAfold/1.8.4

LOG
---

Add `#include <stdio.h>` to top of `RNAforester/src/rnafuncs.cpp`.

    ./configure --prefix=/sw/apps/bioinfo/RNAfold/1.8.4/milou --datadir=/sw/apps/bioinfo/RNAfold --with-cluster
    make && make install

