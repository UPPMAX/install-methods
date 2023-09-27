binutils/2.38
=============

<https://www.gnu.org/software/binutils/>

Used under license:
GPL v3


Structure creating script (makeroom_binutils_2.38.sh) moved to /sw/comp/binutils/makeroom_2.38.sh



binutils/2.38, built with plugin support


LOG
---

    makeroom.sh -f -c comp -t binutils -v 2.38 -w "https://www.gnu.org/software/binutils/" -l "GPL v3" -d "a collection of binary tools, built with plugin support"
    ./makeroom_binutils_2.38.sh 
    source /sw/comp/binutils/SOURCEME_binutils_2.38 && cd $SRCDIR
    [[ -f binutils-${VERSION}.tar.gz ]] || wget http://ftp.gnu.org/gnu/binutils/binutils-${VERSION}.tar.gz
    tar xf binutils-2.38.tar.gz 
    cd binutils-${VERSION}

    ml GMP/6.2.1
    ml MPC/1.2.1
    ml MPFR/4.1.0
    ml gcc/10.3.0
    ./configure --enable-plugins --enable-gold --enable-ld --enable-gmp --enable-mpfr --enable-mpc --prefix=$PREFIX

    make -i -j10
    make -i check
    make -i install


    ml purge
    cd $PREFIX/bin
    ldd *
