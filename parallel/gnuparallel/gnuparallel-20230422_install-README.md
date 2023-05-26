gnuparallel/20230422
====================

<https://savannah.gnu.org/projects/parallel>

Used under license:
GPL v3+


Structure creating script (makeroom_gnuparallel_20230422.sh) moved to /sw/parallel/gnuparallel/makeroom_20230422.sh

LOG
---

    makeroom.sh "-f" "-c" "parallel" "-t" "gnuparallel" "-v" "20230422" "-w" "https://savannah.gnu.org/projects/parallel" "-d" "build and execute shell command lines from standard input in parallel" "-l" "GPL v3+" "-k" "parallel xargs concurrent"
    ./makeroom_gnuparallel_20230422.sh

    source /sw/parallel/gnuparallel/SOURCEME_gnuparallel_20230422
    
    cd $SRCDIR

    wget https://ftp.acc.umu.se/mirror/gnu.org/gnu/parallel/parallel-${VERSION}.tar.bz2
    wget https://ftp.acc.umu.se/mirror/gnu.org/gnu/parallel/parallel-${VERSION}.tar.bz2.sig
    tar xf parallel-${VERSION}.tar.bz2
    cd parallel-${VERSION}
    ./configure --prefix $PREFIX
    make
    make install

Add note to mf file about local copies of documentation in $GNUPARALLEL_ROOT/share/doc/parallel/

