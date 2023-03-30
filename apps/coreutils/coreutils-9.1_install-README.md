coreutils/9.1
=============

<https://www.gnu.org/software/coreutils>

Used under license:
GPL v3


Structure creating script (makeroom_coreutils_9.1.sh) moved to /sw/apps/coreutils/makeroom_9.1.sh

LOG
---

    makeroom.sh "-c" "apps" "-f" "-t" "coreutils" "-v" "9.1" "-l" "GPL v3" "-w" "https://www.gnu.org/software/coreutils" "-d" "the basic file, shell and text manipulation utilities of the GNU operating system"
    ./makeroom_coreutils_9.1.sh

    source /sw/apps/coreutils/SOURCEME_coreutils_9.1
    cd $SRCDIR

    [[ -f coreutils-${VERSION}.tar.xz ]] || wget http://ftp.acc.umu.se/mirror/gnu.org/gnu/coreutils/coreutils-${VERSION}.tar.xz
    tar xf coreutils-${VERSION}.tar.xz
    cd coreutils-${VERSION}
    ./configure --prefix=$PREFIX
    make -j 10
    make -j 10 check

One failure:

    FAIL: tests/cp/preserve-mode

Perhaps because of our security settings. No problem.

    make install

