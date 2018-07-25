perl/5.26.2
===========

<http://www.cpan.org/src/>

LOG
---

Following Perl's own instructions.  We build all 5.24+ perl modules with 64-bit
ints and pointers.

    VERSION=5.26.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/comp/perl
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir -p $CLUSTER
    mkdir -p src
    cd src
    [[ -f perl-${VERSION}.tar.gz ]] || wget http://www.cpan.org/src/5.0/perl-${VERSION}.tar.gz
    tar xzf perl-${VERSION}.tar.gz 
    mv perl-${VERSION} perl-${VERSION}-${CLUSTER}
    cd perl-${VERSION}-${CLUSTER}
    ./Configure -des -Dusethreads -Duse64bitall -Dprefix=/sw/comp/perl/${VERSION}/${CLUSTER}
    make -j8
    make test && make install

