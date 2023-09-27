binutils/2.41
=============

<https://www.gnu.org/software/binutils/>

Used under license:
GPL v3


Structure creating script (makeroom_binutils_2.41.sh) moved to /sw/comp/binutils/makeroom_2.41.sh



binutils/2.41, built with plugin support


LOG
---

    makeroom.sh -f -c comp -t binutils -v 2.41 -w "https://www.gnu.org/software/binutils/" -l "GPL v3" -d "a collection of binary tools, built with plugin support"
    ./makeroom_binutils_2.41.sh 
    source /sw/comp/binutils/SOURCEME_binutils_2.41
    cd $SRCDIR
    [[ -f binutils-${VERSION}.tar.gz ]] || wget http://ftp.gnu.org/gnu/binutils/binutils-${VERSION}.tar.gz
    tar xf binutils-${VERSION}.tar.gz 
    cd binutils-${VERSION}

    ml GMP/6.2.1
    ml MPC/1.2.1
    ml MPFR/4.1.0
    ml gcc/10.3.0
    ./configure --enable-plugins --enable-gold --enable-ld --enable-gmp --enable-mpfr --enable-mpc --prefix=$PREFIX

    make -i -j10

No documentation build errors with makeinfo like with 2.39.  Test and install.

    make check
    make install

Make sure RPATH is set.

    ml purge
    cd $PREFIX/bin
    ldd *

Wrap up.

    cd $TOOLDIR
    ./binutils-2.41_post-install.sh
