swig/4.1.1
==========

<https://www.swig.org/index.html>

Used under license:
GPL with other advice
<https://www.swig.org/legal.html>

Structure creating script (makeroom_swig_4.1.1.sh) moved to /sw/apps/swig/makeroom_4.1.1.sh

LOG
---

    makeroom.sh -f -c apps -t swig -v 4.1.1 -w https://www.swig.org/index.html -l "GPL with other advice" -L https://www.swig.org/legal.html -d "SWIG is a software development tool that connects programs written in C and C++ with a variety of high-level programming languages. SWIG is used with different types of target languages including common scripting languages such as Javascript, Perl, PHP, Python, Tcl and Ruby." 
    ./makeroom_swig_4.1.1.sh 
    source /sw/apps/swig/SOURCEME_swig_4.1.1

    cd $SRCDIR

    wget https://downloads.sourceforge.net/project/swig/swig/swig-4.1.1/swig-4.1.1.tar.gz

    tar xf swig-4.1.1.tar.gz 

    cd swig-4.1.1

    module load perl/5.26.2
    module load bison/3.7.6
    module load flex/2.6.4
    module load java/OpenJDK_17+35
    module load pcre2/10.42
    module load boost/1.83.0-gcc12.3.0
    module load python/3.10.8
    module load Tcl-Tk/8.6.11
    module load ruby/3.2.2
    module load R/4.3.1

    ./configure --prefix=$PREFIX

    make -j10

It has some misconfigured tests, so ignore errors during `make check`.

    make -j4 -i check

Install, and add the `preinst-swig` executable, which is missing from the installation step.

    make install

    cp -av preinst-swig $PREFIX/bin/

