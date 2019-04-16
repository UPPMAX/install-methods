ruby/2.6.2
==========

Compile with system compiler.

<https://www.ruby-lang.org/en>

LOG
---

    VERSION=2.6.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/comp/ruby
    cd /sw/comp/ruby
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    PFX=$PWD/$CLUSTER
    cd src
    [[ -f ruby-${VERSION}.tar.gz ]] || wget https://cache.ruby-lang.org/pub/ruby/${VERSION%.*}/ruby-${VERSION}.tar.gz
    [[ -d ruby-${VERSION} ]] && rm -rf ruby-${VERSION}
    tar xzf ruby-${VERSION}.tar.gz
    cd ruby-${VERSION}
    module load gcc/7.4.0
    ./configure --enable-load-relative --enable-shared --enable-install-static-library --prefix=$PFX
    make -j 8
    make test
    make install
    cd ..
    rm -rf ruby-${VERSION}

Ruby can be built against, so add its `pkgconfig/` directory to
`PKG_CONFIG_PATH` in the mf file.

The mf file also needs to load include files from 2.6.0, not 2.6.2, so add some
tcl to derive this from the version string.

