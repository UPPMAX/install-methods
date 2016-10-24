Vmatch 2.2.5
============

<http://www.vmatch.de/>

Vmatch, a versatile software tool for efficiently solving large scale sequence
matching tasks


LOG
---

    VERSION=2.2.5
    cd /sw/apps/bioinfo
    mkdir Vmatch
    cd Vmatch/
    mkdir 2.2.5
    cd 2.2.5/
    mkdir src/
    cd src/
    wget ftp://lscsa.de/pub/lscsa/vmatch-${VERSION}-Linux_x86_64-64bit.tar.gz
    tar xzf vmatch-2.2.5-Linux_x86_64-64bit.tar.gz 
    mv vmatch-2.2.5-Linux_x86_64-64bit ../milou
    cd ..
    ln -s ./milou tintin

Copy over licence file issued for Uppmax to both `src/` and cluster directory.

    cp -a vmatch.lic ../milou/

Does it work?

    cd ../milou
    ./vmatch -help

Use simple mf from SNPTEST.

    cd ../../
    mkdir mf
    cd mf
    cp ../../SNPTEST/mf/2.5.2 $VERSION
    vi $VERSION 

