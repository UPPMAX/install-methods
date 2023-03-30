tmux/3.3a
=========

<https://github.com/tmux/tmux/wiki>

Used under license:
Custom open-source AS IS
<https://raw.githubusercontent.com/tmux/tmux/master/COPYING>

Structure creating script (makeroom_tmux_3.3a.sh) moved to /sw/apps/tmux/makeroom_3.3a.sh


LOG
---

    TOOL=tmux
    VERSION=3.3a
    cd /sw/apps
    makeroom.sh -f -t $TOOL -v $VERSION -c apps -w https://github.com/tmux/tmux/wiki -l "Custom open-source AS IS" -L https://raw.githubusercontent.com/tmux/tmux/master/COPYING -d "terminal multiplexer" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    source /sw/apps/tmux/SOURCEME_${TOOL}_${VERSION}
    cd ${SRCDIR}

We need to install libevent first, and set up PKG_CONFIG_PATH to find it.  We
install it in this tree. We don't use the same version for 3.1b because we want
this tree independent from that.

    wget https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz
    tar xf libevent-2.1.12-stable.tar.gz 
    cd libevent-2.1.12-stable/
    ./configure --prefix=$PREFIX
    make && make install
    export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH
    cd ..

Now install tmux.

    wget https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz
    tar xzf tmux-${VERSION}.tar.gz 
    cd tmux-${VERSION}/
    ./configure --prefix=$PREFIX
    make
    make install

And set its RPATH to find libevent.

    cd $PREFIX/bin
    module load patchelf/0.10
    patchelf --set-rpath $PREFIX/lib tmux
    patchelf --print-rpath tmux

The answer should be `/sw/apps/tmux/3.3a/rackham/lib`.  And

    ldd tmux

should find all libraries.

