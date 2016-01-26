texinfo 6.0
===========

<https://www.gnu.org/software/texinfo/>

The HTML and info versions of R package documentation cannot be built without
texinfo.

Log
---

    cd /sw/apps/
    mkdir -p texinfo/6.0
    cd texinfo
    mkdir 6.0
    mkdir mf
    cd 6.0/
    mkdir milou src

Link all systems to the milou build.

    ln -s ./milou tintin
    ln -s ./milou halvan
    ln -s ./milou nestor
    cd src
    wget http://ftp.gnu.org/gnu/texinfo/texinfo-6.0.tar.gz
    tar xzf texinfo-6.0.tar.gz 
    module load gcc/4.9.2
    cd texinfo-6.0/
    ./configure --prefix=/sw/apps/texinfo/6.0/milou
    make
    make install

Start with simple mf file.

    cd /sw/apps/texinfo/mf
    cp /sw/mf/common/applications/texlive/2015 6.0
    vi 6.0 

Now set up these variables:

    prepend-path    PATH       $modroot/bin
    prepend-path    MANPATH    $modroot/share/man
    prepend-path    INFOPATH   $modroot/share/info

