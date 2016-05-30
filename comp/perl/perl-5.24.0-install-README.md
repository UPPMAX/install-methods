# perl-5.24.0-install-README.md

perl/5.24.0
===========

<http://www.cpan.org/src/>

LOG
---

Following 5.22.2 instructions, but for 5.24.0 we configure 64 bit ints and 64
bit pointers.

    VERSION=5.24.0
    CLUSTER=milou
    cd /sw/comp/perl
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir -p $CLUSTER
    mkdir -p src
    cd src
    wget http://www.cpan.org/src/5.0/perl-${VERSION}.tar.gz
    tar xzf perl-${VERSION}.tar.gz 
    mv perl-${VERSION} perl-${VERSION}-${CLUSTER}
    cd perl-${VERSION}-${CLUSTER}
    ./Configure -des -Dusethreads -Duse64bitall -Dprefix=/sw/comp/perl/${VERSION}/${CLUSTER}
    make
    make test
    make install

Fix.

    cd ../..
    fixup -g 5.24.0

Do tintin.
