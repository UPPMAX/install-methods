automake/1.16.1
===============

Compile with system compiler.

LOG
---

    VERSION=1.16.1
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/comp/automake
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    cd src
    [[ -f automake-${VERSION}.tar.gz ]] || wget https://ftp.gnu.org/gnu/automake/automake-${VERSION}.tar.gz
    rm -rf automake-${VERSION}
    tar xzf automake-${VERSION}.tar.gz 
    cd automake-${VERSION}
    ./configure --prefix=$PFX
    make && make check && make install

There was one test that failed

    ============================================================================
    Testsuite summary for GNU Automake 1.16.1
    ============================================================================
    # TOTAL: 2904
    # PASS:  2786
    # SKIP:  77
    # XFAIL: 40
    # FAIL:  0
    # XPASS: 0
    # ERROR: 1
    ============================================================================
    See ./test-suite.log

Let's look more closely at this failure.  In `./test-suite.log` we find

    ERROR: t/tests-environment-fd-redirect
    ======================================

    cannot remove directory for t/tests-environment-fd-redirect.dir: Directory not empty at /sw/comp/automake/1.16.1/src/automake-1.16.1/t/ax/deltree.pl line 29.
    ERROR t/tests-environment-fd-redirect.sh (exit status: 99)

and when we look more closely at this directory, we see

    rackham5: /sw/comp/automake/1.16.1/src/automake-1.16.1 $ ll -a t/tests-environment-fd-redirect.dir
    total 428
    drwxrwsr-x  2 douglas sw   4096 Mar 14 17:30 .
    drwxr-sr-x 51 douglas sw 311296 Mar 14 17:47 ..
    -rwxrwxr-x  1 douglas sw 104352 Mar 14 14:33 .nfs8052559603dab31f000000ba
    -rw-rw-r--  1 douglas sw   4444 Mar 14 15:46 .nfs8052559603dab323000000bb

So there was some file system hiccup that neft some `.nfs*` files around.  This
is an acceptable failure.  I attempted to remove this directory manually but am
getting `Device or resource busy` errors, so I'll leave them in place.

Continuing with the installation.

