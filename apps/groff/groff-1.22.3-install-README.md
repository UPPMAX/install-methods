groff/1.22.3
============

Surprised to need it, but `pbftops` is not available on rackham, irma or bianca
and is required for compiling the newer EPACTS.

LOG
---

    cd /sw/apps/
    mkdir groff
    cd groff
    VERSION=1.22.3
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    wget https://ftp.gnu.org/gnu/groff/groff-${VERSION}.tar.gz
    tar xzf groff-${VERSION}.tar.gz 
    cd groff-${VERSION}

Build with system gcc, and do not load newer automake, etc.  **Do not do parallel
build**, this breaks the groff build setup.

    ./configure --prefix=$PFX
    make
    make install

Add man pages, executables and info pages to mf file.

On rackham, the configuration got the following message:

    checking for pnmcut... missing
    checking for pnmcrop... missing
    checking for pnmtopng... missing
    checking for psselect... missing
    checking for pnmtops... missing
    configure: WARNING: missing programs:

      The programs
         `pnmcut', `pnmcrop', `pnmtopng', `psselect' and `pnmtops'
      cannot be found in the PATH.
      Consequently, groff's HTML backend (grohtml) will not work properly;
      therefore, it will neither be possible to prepare, nor to install,
      documentation in HTML format.

I don't really care about that for this utility module, but might it indicate
netpbm or something is not installed?
