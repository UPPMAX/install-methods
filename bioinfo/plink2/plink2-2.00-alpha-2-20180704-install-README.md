plink2/2.00-c1defe4
========================

<https://www.cog-genomics.org/plink/2.0/>

LOG
---

I did..

    TOOL=plink2
    VERSION=2.00-c1defe4
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    /home/jonass/uppmax/bin/makeroom.sh

NOTE: I use my own script which is located at /sw/apps/bioinfo/plink2/makeroom_2.00-c1defe4.sh

    ./makeroom_plink2_2.00-c1defe4.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    INSTALLPATH=/sw/bioinfo/plink2/2.00-c1defe4/rackham/
    git clone https://github.com/chrchang/plink-ng.git
    cd plink-ng/2.0/
    ml bioinfo-tools gcc/6.3.0 zlib/1.2.11 ATLAS/3.10.3
    
Here I altered the Makefile to link directly at zlib statically. It was what the file did anyway, but now it uses our zlib.

    vim Makefile
    make PREFIX=$INSTALLPATH
    cp -av bin ../../../rackham/
