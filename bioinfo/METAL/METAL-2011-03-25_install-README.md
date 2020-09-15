METAL/2011-03-25
================

<http://csg.sph.umich.edu/abecasis/Metal/>

Used under license:
open source

Structure creating script (makeroom_METAL_2011-03-25.sh) moved to /sw/bioinfo/METAL/makeroom_2011-03-25.sh

In `generic-metal/Makefile`, the `CFLAGS=` setting includes `-static`, and there is no system `libz.a`.  Simply remove it.
We should also set `-D__USE_LONG_INT` to enable large numbers of markers.  The final `CFLAGS=` line in the Makefile is

    CFLAGS=-O2 -I./libsrc -I./pdf  -D_FILE_OFFSET_BITS=64 -D__USE_LONG_INT


LOG
---

    TOOL=METAL
    VERSION=2011-03-25
    cd /sw/bioinfo
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w http://csg.sph.umich.edu/abecasis/Metal/ -l "open source" -d "facilitate meta-analysis of large datasets, such as several whole genome scans" 
    ./makeroom_METAL_2011-03-25.sh 
    cd METAL/
    source SOURCEME_METAL_2011-03-25 
    cd 2011-03-25/
    cd src/
    wget http://csg.sph.umich.edu/abecasis/Metal/download/generic-metal-2011-03-25.tar.gz
    tar xzf generic-metal-2011-03-25.tar.gz 
    cd generic-metal/

Edit `Makefile` as above.

    vi Makefile

Then build and install.

    module purge
    module load uppmax
    module load gcc/9.3.0
    echo $PREFIX
    make all && make INSTALLDIR=$PREFIX install

Double-check that the executable can find its shared libraries.

    module unload gcc
    cd $PREFIX
    ldd metal

