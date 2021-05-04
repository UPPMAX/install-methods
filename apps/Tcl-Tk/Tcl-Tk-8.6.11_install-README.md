Tcl-Tk/8.6.11
=============

<https://www.tcl.tk/>

Used under license:
BSD-like
<https://www.tcl-lang.org/software/tcltk/license.html>

Structure creating script (makeroom_Tcl-Tk_8.6.11.sh) moved to /sw/apps/Tcl-Tk/makeroom_8.6.11.sh

LOG
---

    cd /sw/apps
    TOOL=Tcl-Tk
    VERSION=8.6.11
    makeroom.sh -f -c apps -t $TOOL -v $VERSION -w https://www.tcl.tk/ -d "" -l "BSD-like" -L https://www.tcl-lang.org/software/tcltk/license.html
    ./makeroom_Tcl-Tk_8.6.11.sh 
    cd Tcl-Tk
    source SOURCEME_Tcl-Tk_8.6.11 
    cd $SRCDIR
    wget https://prdownloads.sourceforge.net/tcl/tcl8.6.11-src.tar.gz
    tar xf tcl8.6.11-src.tar.gz 
    cd tcl8.6.11/
    cd unix
    ./configure --enable-64bit --enable-threads --enable-shared --enable-symbols --prefix=$PREFIX
    make -j10
    make test
    make install

Need to symlink tclsh.

    cd $PREFIX/bin
    ln -s tclsh8.6 tclsh


Now Tk.

    cd $SRCDIR
    wget https://prdownloads.sourceforge.net/tcl/tk8.6.11.1-src.tar.gz
    tar xf tk8.6.11.1-src.tar.gz
    cd tk8.6.11
    cd unix
    ./configure --with-tcl=$SRCDIR/tcl8.6.11/unix --enable-64bit --enable-threads --enable-shared --enable-symbols --prefix=$PREFIX
    make -j10
    make install

Need to symlink wish.

    cd $PREFIX/bin
    ln -s wish8.6 wish


Edit the mf file to show this provides include files and libraries and man pages.


