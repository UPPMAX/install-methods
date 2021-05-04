Tcl/8.6.11
========================

<https://www.tcl.tk/>

Used under license:
MIT

Structure creating script (makeroom_Tcl_8.6.11.sh) moved to /sw/apps/Tcl/makeroom_8.6.11.sh

LOG
---

    cd /sw/apps
    TOOL=Tcl
    VERSION=8.6.11
    makeroom.sh -f -c apps -t $TOOL -v $VERSION -w https://www.tcl.tk/ -d "Tcl (Tool Command Language) is a very powerful but easy to learn dynamic programming language, suitable for a very wide range of uses, including web and desktop applications, networking, administration, testing and many more" -l "MIT"
    ./makeroom_Tcl_8.6.11.sh 
    cd Tcl/
    source SOURCEME_Tcl_8.6.11 
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

Edit the mf file to show this provides include files and libraries and man pages.
