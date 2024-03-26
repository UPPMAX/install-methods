git/2.44.0
==========

<https://git-scm.com/>

Used under license:
LGPL 2.1


Structure creating script (makeroom_git_2.44.0.sh) moved to /sw/comp/git/makeroom_2.44.0.sh

LOG
---

    makeroom.sh -t git -v 2.44.0 -w https://git-scm.com/ -c comp -l "LGPL 2.1" -d "Source control management" -f
    ./makeroom_git_2.44.0.sh 
    source /sw/comp/git/SOURCEME_git_2.44.0 && cd $SRCDIR
    [[ -d git-${VERSION} ]] && rm -rf git-${VERSION}
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/git/git/archive/v${VERSION}.tar.gz
    tar xf v${VERSION}.tar.gz
    cd git-${VERSION}/

    ml libcurl/8.4.0
    ml zlib/1.3
    ml gcc/12.3.0
    ml Tcl-Tk/8.6.11
    ml pcre2/10.42
    ml binutils/2.41
    make configure
    ./configure --prefix=$PREFIX --with-curl --with-zlib=$ZLIB_ROOT --with-tcltk=$(which tclsh8.6) --with-libpcre2=$PCRE2_ROOT
    make -j20 all
    make install
    cd ..
    rm -rf git-${VERSION}

    cd $PREFIX/bin
    ml purge
    ldd *

Wrap up.

    cd $TOOLDIR

    ./git-${VERSION}_post-install.sh 
