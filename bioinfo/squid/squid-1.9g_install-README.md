squid/1.9g
==========

<http://eddylab.org/software/squid/>

<http://eddylab.org/software.html>

Used under license:



Structure creating script (makeroom_squid_1.9g.sh) moved to /sw/bioinfo/squid/makeroom_1.9g.sh

LOG
---

    makeroom.sh -s misc -t squid -v 1.9g -w http://eddylab.org/software/squid/ -d "C library that is bundled with much of the above software. C function library for sequence analysis. SQUID is my own personal library of C functions and utility programs for sequence analysis. I don't really suggest that you use it in your programs, as I change it at will. However, it does contains some small utility programs that some people have found useful in scripts that drive large HMMER tasks. Author: Sean Eddy"
    ./makeroom_squid_1.9g.sh 

    source /sw/bioinfo/squid/SOURCEME_squid_1.9g
    cd $SRCDIR

    wget http://eddylab.org/software/squid/squid-1.9g.tar.gz
    tar xf squid-1.9g.tar.gz 
    ml gcc/6.3.0
    cd squid-1.9g/
    ./configure --prefix=$PREFIX
    make
    make check
    make install

Only a statically compiled library is provided, so set only `LIBRARY_PATH`.

    cd $TOOLDIR
    vi mf/$VERSION

Wrap up.

    ./squid-1.9g_post-install.sh
