fpc/3.0.4
========================

<https://www.freepascal.org/>

Used under license:
GPL and LGPL

Structure creating script (makeroom_fpc_3.0.4.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/comp/fpc/makeroom_3.0.4.sh

LOG
---

    TOOL=fpc
    VERSION=3.0.4
    makeroom.sh -c "comp" -t "fpc" -v "3.0.4" -w "https://www.freepascal.org/" -d "Free Pascal Compiler" -l "GPL and LGPL" -f
    ./makeroom_fpc_3.0.4.sh
    cd /sw/comp/$TOOL

    echo $PREFIX

Now download the precompiled tarball and install, using the abouve `$PREFIX` as the destination directory.

    wget ftp://ftp.hu.freepascal.org/pub/fpc/dist/3.0.4/i386-linux/fpc-3.0.4.i386-linux.tar
    cd fpc-3.0.4.i386-linux/
    ./install.sh 

In the mf file, add `$modroot/bin` to `PATH` and `$modroot/man` to `MANPATH`.

