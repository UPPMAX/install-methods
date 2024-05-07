capnproto/1.0.2
===============

<https://capnproto.org/>

<https://github.com/capnproto/capnproto>

Used under license:
MIT
<https://raw.githubusercontent.com/capnproto/capnproto/v2/LICENSE>

Structure creating script (makeroom_capnproto_1.0.2.sh) moved to /sw/libs/capnproto/makeroom_1.0.2.sh

LOG
---

    makeroom.sh -t capnproto -v 1.0.2 -c libs -d "Cap'n Proto is an insanely fast data interchange format and capability-based RPC system. Think JSON, except binary. Or think Protocol Buffers, except faster." -w https://capnproto.org/ -l MIT -L https://raw.githubusercontent.com/capnproto/capnproto/v2/LICENSE
    ./makeroom_capnproto_1.0.2.sh 
    source /sw/libs/capnproto/SOURCEME_capnproto_1.0.2
    cd $SRCDIR
    wget https://capnproto.org/capnproto-c++-1.0.2.tar.gz
    tar xf capnproto-c++-1.0.2.tar.gz 
    cd capnproto-c++-1.0.2/
    ml gcc/12.3.0
    ml binutils/2.41
    ml zlib/1.3
    ./configure --prefix=$PREFIX --with-gnu-ld --with-zlib
    make -j 10 check

One test fails. It's in the async area. :364 reported failed at
<https://github.com/capnproto/capnproto/issues/1398> related to kernel
version, ours is quite a bit older than the one with that test
(3.10.0-1160.114.2.el7.x86_64) so I'm going to assume it's an old kernel
issue.

    [ TEST ] kj/async-io-test.c++:309: legacy test: AsyncIo/AncillaryMessageHandler
    kj/async-io-test.c++:366: failed: expected serverHandlerCalled
    stack: 722ec7 2ab5039b4626 2ab5039b4d62 2ab5039b557c 2ab503a21056 2ab503a21e9d 2ab5039b34db 2ab5045e3554 4eb253
    [ FAIL ] kj/async-io-test.c++:309: legacy test: AsyncIo/AncillaryMessageHandler (308 ¿s)

Install despite the failing test.

    make
    make install

Adjust the RPATH for the libraries and executables. They are not complete.
Unload binutils since that adds a path that is unneeded here. Not all
libraries/executables need everything we're including here, but it's fine for
it to be overspecified.

    ml patchelf/0.10
    cd $PREFIX/lib
    patchelf --set-rpath "$PREFIX/lib:$LD_LIBRARY_PATH" *1.0.2.so
    cd $PREFIX/bin
    patchelf --set-rpath "$PREFIX/lib:$LD_LIBRARY_PATH" capnp capnpc-c++ capnpc-capnp

    ml purge
    ldd capnp capnpc-c++ capnpc-capnp
    cd $PREFIX/lib
    ldd *1.0.2.so

Add all relefant directories to the mf. Note there are pkgconfig and cmake
directories.

    find $PREFIX -type d

    vi $TOOLDIR/mf/1.0.2 

Wrap up.

    cd $TOOLDIR
    ./capnproto-1.0.2_post-install.sh 
