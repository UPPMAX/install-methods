beagle/1.0.0
============

LOG
---

    svn checkout http://beagle-lib.googlecode.com/svn/trunk/ src
    cd beagle-lib
    ./autogen.sh
    ./configure --prefix=//////sw/apps/bioinfo/beagle/1.0.0/kalkyl
    make install

    ########################################
    Libraries have been installed in:
       //////sw/apps/bioinfo/beagle/kalkyl/lib

    If you ever happen to want to link against installed libraries
    in a given directory, LIBDIR, you must either use libtool, and
    specify the full pathname of the library, or use the `-LLIBDIR'
    flag during linking and do at least one of the following:
       - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
         during execution
       - add LIBDIR to the `LD_RUN_PATH' environment variable
         during linking
       - use the `-Wl,-rpath -Wl,LIBDIR' linker flag
       - have your system administrator add LIBDIR to `/etc/ld.so.conf'

    See any operating system documentation about shared libraries for
    more information, such as the ld(1) and ld.so(8) manual pages.
    #########################################

    export LD_LIBRARY_PATH=$FOO/lib:$LD_LIBRARY_PATH
    export PKG_CONFIG_PATH=$FOO/lib/pkgconfig:$PKG_CONFIG_PATH
