selscan/2.0.0
=============

<https://github.com/szpiech/selscan>

Used under license:
GPL v3


Structure creating script (makeroom_selscan_2.0.0.sh) moved to /sw/bioinfo/selscan/makeroom_2.0.0.sh

LOG
---


    makeroom.sh -t "selscan" -v "2.0.0" -w "https://github.com/szpiech/selscan" -c "bioinfo" -l "GPL v3" -d "a program to calculate EHH-based scans for positive selection in genomes" -x "INSTALL" -f
    ./makeroom_selscan_2.0.0.sh 
    source /sw/bioinfo/selscan/SOURCEME_selscan_2.0.0
    cd $SRCDIR
    wget https://github.com/szpiech/selscan/archive/refs/tags/v2.0.0.tar.gz
    tar xf v2.0.0.tar.gz 
    cd selscan-2.0.0/
    cat INSTALL 

It needs gsl (for its `norm` executable) and zlib, can use system and its own
static gsl libraries, but use our modules instead. Must check to see if RPATH
is set correctly.

    ml gcc/10.3.0
    ml gsl/2.7
    ml zlib/1.2.12

    tar xf v2.0.0.tar.gz 
    cd selscan-2.0.0/src/
    cp Makefile.lin Makefile.lin.bak
    vi Makefile.lin

Modify `Makefile.lin`, replacing its `LINK_OPTS` with one that references the
shared gsl/2.7 module libraries.  Results of `diff Makefile.lin.bak
Makefile.lin` after the change show

    < LINK_OPTS = $(L_PATH)/libgsl.a $(L_PATH)/libgslcblas.a
    ---
    > #####LINK_OPTS = $(L_PATH)/libgsl.a $(L_PATH)/libgslcblas.a
    > LINK_OPTS=-lgsl -lgslcblas


Build, move the executables to `$PREFIX`, and check RPATH.

    make -f Makefile.lin
    cp -av norm selscan $PREFIX/
    cd $PREFIX
    module purge
    ldd selscan norm

This should show that each executable is pulling libz, libgcc_s, libstdc++, libgsl and libgslcblas from the modules.

    selscan:
        linux-vdso.so.1 =>  (0x00007fff844bc000)
        libz.so.1 => /sw/libs/zlib/1.2.12/rackham/lib/libz.so.1 (0x00002ab67ba82000)
        libstdc++.so.6 => /sw/comp/gcc/10.3.0_rackham/lib64/libstdc++.so.6 (0x00002ab67bc9e000)
        libm.so.6 => /lib64/libm.so.6 (0x00002ab67c06c000)
        libgcc_s.so.1 => /sw/comp/gcc/10.3.0_rackham/lib64/libgcc_s.so.1 (0x00002ab67c36e000)
        libpthread.so.0 => /lib64/libpthread.so.0 (0x00002ab67c586000)
        libc.so.6 => /lib64/libc.so.6 (0x00002ab67c7a2000)
        /lib64/ld-linux-x86-64.so.2 (0x00002ab67b85e000)
    norm:
        linux-vdso.so.1 =>  (0x00007ffca9f5f000)
        libgsl.so.25 => /sw/libs/gsl/2.7/rackham/lib/libgsl.so.25 (0x00002b5fd5966000)
        libgslcblas.so.0 => /sw/libs/gsl/2.7/rackham/lib/libgslcblas.so.0 (0x00002b5fd5e43000)
        libstdc++.so.6 => /sw/comp/gcc/10.3.0_rackham/lib64/libstdc++.so.6 (0x00002b5fd6083000)
        libm.so.6 => /lib64/libm.so.6 (0x00002b5fd6451000)
        libgcc_s.so.1 => /sw/comp/gcc/10.3.0_rackham/lib64/libgcc_s.so.1 (0x00002b5fd6753000)
        libc.so.6 => /lib64/libc.so.6 (0x00002b5fd696b000)
        /lib64/ld-linux-x86-64.so.2 (0x00002b5fd5742000)
