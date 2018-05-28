ruby/2.5.0
==========

Compile with system compiler.

<https://www.ruby-lang.org/en>

LOG
---

    VERSION=2.5.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/comp/ruby
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    [[ -f ruby-${VERSION}.tar.gz ]] || wget https://cache.ruby-lang.org/pub/ruby/${VERSION%.*}/ruby-${VERSION}.tar.gz
    tar xzf ruby-${VERSION}.tar.gz
    cd ruby-${VERSION}
    module load gcc/6.3.0
    ./configure --enable-load-relative --prefix=$PFX
    make -j 8
    make test
    make install

Ruby can be built against, so add its `pkgconfig/` directory to
`PKG_CONFIG_PATH` in the mf file.
