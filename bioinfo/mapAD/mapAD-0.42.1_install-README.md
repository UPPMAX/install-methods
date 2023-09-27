mapAD/0.42.1
============

<https://github.com/mpieva/mapAD>

Used under license:
MIT


Structure creating script (makeroom_mapAD_0.42.1.sh) moved to /sw/bioinfo/mapAD/makeroom_0.42.1.sh

LOG
---

    makeroom.sh -t mapAD -v 0.42.1 -l MIT -w https://github.com/mpieva/mapAD -d "An aDNA aware short-read mapper" -s alignment
    ./makeroom_mapAD_0.42.1.sh 
    source /sw/bioinfo/mapAD/SOURCEME_mapAD_0.42.1 && cd $SRCDIR
    wget https://github.com/mpieva/mapAD/releases/download/v0.42.1/mapAD-v0.42.1-linux-64-bit.zip
    unzip mapAD-v0.42.1-linux-64-bit.zip 

Check the executable.

    cd mapAD-v0.42.1-linux-64-bit/
    file mapad
    ldd mapad
    ./mapad
    mapad: /lib64/libm.so.6: version `GLIBC_2.27' not found (required by mapad)
    mapad: /lib64/libc.so.6: version `GLIBC_2.25' not found (required by mapad)
    mapad: /lib64/libc.so.6: version `GLIBC_2.28' not found (required by mapad)
    mapad: /lib64/libc.so.6: version `GLIBC_2.18' not found (required by mapad)
    $ ml gcc/12.3.0
    $ ./mapad
    mapad: /lib64/libm.so.6: version `GLIBC_2.27' not found (required by mapad)
    mapad: /lib64/libc.so.6: version `GLIBC_2.25' not found (required by mapad)
    mapad: /lib64/libc.so.6: version `GLIBC_2.28' not found (required by mapad)
    mapad: /lib64/libc.so.6: version `GLIBC_2.18' not found (required by mapad)

Looks like we have to build from scratch.

    cd $SRCDIR

    wget https://github.com/mpieva/mapAD/archive/refs/tags/v0.42.1.tar.gz

Use rust and a newer gcc and liblzma.

    ml rust/1.67.0
    ml gcc/12.3.0
    ml xz/5.2.6
    tar xf v0.42.1.tar.gz 
    cd mapAD-0.42.1/
    cargo build --release

Check that it can find its libraries.

ml purge
ldd target/release/mapad

Yep. Install.

    cp -av target/release/mapad $PREFIX/

Add $modroot to PATH.

    cd $TOOLDIR/mf
    vi 0.42.1

Wrap things up.

    cd $TOOLDIR
    ./mapAD-0.42.1_post-install.sh
