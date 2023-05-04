ruby/3.2.2
========================

<https://www.ruby-lang.org/en>

Used under license:
2-clause BSDL or Ruby license
<https://www.ruby-lang.org/en/about/license.txt>

Structure creating script (makeroom_ruby_3.2.2.sh) moved to /sw/comp/ruby/makeroom_3.2.2.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-c" "comp" "-t" "ruby" "-v" "3.2.2" "-w" "https://www.ruby-lang.org/en" "-d" "A dynamic, open source programming language with a focus on simplicity and productivity" "-l" "2-clause BSDL or Ruby license" "-L" "https://www.ruby-lang.org/en/about/license.txt"
    ./makeroom_ruby_3.2.2.sh
ruby/2.5.0
==========

Compile with system compiler.

<https://www.ruby-lang.org/en>

LOG
---

    VERSION=2.5.0
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
    module load gcc/6.3.0
    ./configure --enable-load-relative --enable-shared --enable-install-static-library --prefix=$PFX
    make -j 8
    make test
    make install
    cd ..
    rm -rf ruby-${VERSION}

Ruby can be built against, so add its `pkgconfig/` directory to
`PKG_CONFIG_PATH` in the mf file.

The mf file also needs to load include files from 2.5.0, though this matches
this version it would still be 2.5.0 if this version was 2.5.1.  So, add some
tcl to derive this from the version string.

