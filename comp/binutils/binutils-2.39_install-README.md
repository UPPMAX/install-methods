binutils/2.39
=============

<https://www.gnu.org/software/binutils/>

Used under license:
GPL v3


Structure creating script (makeroom_binutils_2.39.sh) moved to /sw/comp/binutils/makeroom_2.39.sh



binutils/2.39, built with plugin support


LOG
---

    makeroom.sh -f -c comp -t binutils -v 2.39 -w "https://www.gnu.org/software/binutils/" -l "GPL v3" -d "a collection of binary tools, built with plugin support"
    ./makeroom_binutils_2.39.sh 
    source /sw/comp/binutils/SOURCEME_binutils_2.39
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

Build with `-i` (ignore errors) because a `makeinfo` step with gprof keeps
failing apparently with cross-referencing errors, see below. The `-i` needs to be added to
the check and install steps, too.

    if (makeinfo --split-size=5000000 --split-size=5000000 --version) >/dev/null 2>&1; then \
      for f in gprofng.info gprofng.info-[0-9] gprofng.info-[0-9][0-9] gprofng.i[0-9] gprofng.i[0-9][0-9]; do \
        if test -f $f; then mv $f $backupdir; restore=mv; else :; fi; \
      done; \
    else :; fi && \
    if makeinfo --split-size=5000000 --split-size=5000000   -I . \
     -o gprofng.info `test -f 'gprofng.texi' || echo './'`gprofng.texi; \
    then \
      rc=0; \
    else \
      rc=$?; \
      $restore $backupdir/* `echo "./gprofng.info" | sed 's|[^/]*$||'`; \
    fi; \
    rm -rf $backupdir; exit $rc
    gprofng.texi:1526: warning: unreferenced node `Creating a Multithreading Experiment'
    gprofng.texi:1526: warning: node `Commands Specific to Multithreading' is next for `Creating a Multithreading Experiment' in sectioning but not in menu
    gprofng.texi:1526: warning: node `Support for Multithreading' is up for `Creating a Multithreading Experiment' in sectioning but not in menu
    gprofng.texi:1513: node `Support for Multithreading' lacks menu item for `Creating a Multithreading Experiment' despite being its Up target
    gprofng.texi:1580: warning: unreferenced node `Commands Specific to Multithreading'
    gprofng.texi:1580: warning: node `Creating a Multithreading Experiment' is prev for `Commands Specific to Multithreading' in sectioning but not in menu
    gprofng.texi:1580: warning: node `Support for Multithreading' is up for `Commands Specific to Multithreading' in sectioning but not in menu
    gprofng.texi:1513: node `Support for Multithreading' lacks menu item for `Commands Specific to Multithreading' despite being its Up target
    gprofng.texi:1929: warning: unreferenced node `Aggregation of Experiments'
    gprofng.texi:1929: warning: node `Comparison of Experiments' is next for `Aggregation of Experiments' in sectioning but not in menu
    gprofng.texi:1929: warning: node `Viewing Multiple Experiments' is up for `Aggregation of Experiments' in sectioning but not in menu
    gprofng.texi:1917: node `Viewing Multiple Experiments' lacks menu item for `Aggregation of Experiments' despite being its Up target
    gprofng.texi:2008: warning: unreferenced node `Comparison of Experiments'
    gprofng.texi:2008: warning: node `Aggregation of Experiments' is prev for `Comparison of Experiments' in sectioning but not in menu
    gprofng.texi:2008: warning: node `Viewing Multiple Experiments' is up for `Comparison of Experiments' in sectioning but not in menu
    gprofng.texi:1917: node `Viewing Multiple Experiments' lacks menu item for `Comparison of Experiments' despite being its Up target
    gprofng.texi:2159: warning: unreferenced node `Getting Information on the Counters Supported'
    gprofng.texi:2159: warning: node `Examples Using Hardware Event Counters' is next for `Getting Information on the Counters Supported' in sectioning but not in menu
    gprofng.texi:2159: warning: node `Profile Hardware Event Counters' is up for `Getting Information on the Counters Supported' in sectioning but not in menu
    gprofng.texi:2145: node `Profile Hardware Event Counters' lacks menu item for `Getting Information on the Counters Supported' despite being its Up target
    gprofng.texi:2383: warning: unreferenced node `Examples Using Hardware Event Counters'
    gprofng.texi:2383: warning: node `Getting Information on the Counters Supported' is prev for `Examples Using Hardware Event Counters' in sectioning but not in menu
    gprofng.texi:2383: warning: node `Profile Hardware Event Counters' is up for `Examples Using Hardware Event Counters' in sectioning but not in menu
    gprofng.texi:2145: node `Profile Hardware Event Counters' lacks menu item for `Examples Using Hardware Event Counters' despite being its Up target
    make[5]: [gprofng.info] Error 1 (ignored)
     /usr/bin/mkdir -p '/sw/comp/binutils/2.39/rackham/share/info'
     /usr/bin/install -c -m 644 ./gprofng.info '/sw/comp/binutils/2.39/rackham/share/info'
     install-info --info-dir='/sw/comp/binutils/2.39/rackham/share/info' '/sw/comp/binutils/2.39/rackham/share/info/gprofng.info'
    make[5]: Leaving directory `/sw/comp/binutils/2.39/src/binutils-2.39/gprofng/doc'
    make[4]: Leaving directory `/sw/comp/binutils/2.39/src/binutils-2.39/gprofng/doc'
    make[3]: Leaving directory `/sw/comp/binutils/2.39/src/binutils-2.39/gprofng/doc'
    make[3]: Entering directory `/sw/comp/binutils/2.39/src/binutils-2.39/gprofng'
    make[4]: Entering directory `/sw/comp/binutils/2.39/src/binutils-2.39/gprofng'

Test and install.

    make -i check
    make -i install

Make sure RPATH is set.

    ml purge
    cd $PREFIX/bin
    ldd *

Wrap up.

    cd $TOOLDIR
    ./binutils-2.39_post-install.sh
