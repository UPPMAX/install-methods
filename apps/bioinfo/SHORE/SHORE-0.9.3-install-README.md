# SHORE-0.9.3-install-README.md

<http://shore.sourceforge.net/wiki>

Log
---

    mkdir /sw/apps/bioinfo/SHORE
    cd /sw/apps/bioinfo/SHORE
    mkdir milou src
    cd src
    wget http://downloads.sourceforge.net/project/shore/Release_0.9/shore-0.9.3.tar.gz
    module load gcc/4.9.2
    ./configure --prefix=/sw/apps/bioinfo/SHORE/0.9.3/milou --without-lzma

Let it use the system boost, because it had link problems when using the module
version `boost/1.59.0_gcc4.9.2`, and exclude LZMA support because I couldn't
get LZMA to compile cleanly.  If someone asks for it, I'll try again.

For the mf file, since SHORE provides a C++ library, set up some variables for that.

    prepend-path    PATH                $modroot/bin
    prepend-path    CPLUS_INCLUDE_PATH  $modroot/include
    prepend-path    LD_LIBRARY_PATH     $modroot/lib
    append-path     MANPATH             $modroot/share/man
    #
    # so we don't have to 'module load gcc/4.9.2'
    prepend-path    LD_LIBRARY_PATH     /sw/comp/gcc/4.9.2_$Cluster/lib64
    prepend-path    LD_LIBRARY_PATH     /sw/comp/gcc/4.9.2_$Cluster/lib

Also, it does not hardcode the C lib paths into the executable, so without specifying
the gcc 4.9.2 paths in `LD_LIBRARY_PATH`, you will see things like

    milou-b: /sw/apps/bioinfo/SHORE/0.9.3/milou/bin $ ldd shore
    ./shore: /usr/lib64/libstdc++.so.6: version `GLIBCXX_3.4.20' not found (required by ./shore)
    ./shore: /usr/lib64/libstdc++.so.6: version `GLIBCXX_3.4.15' not found (required by ./shore)
    ./shore: /usr/lib64/libstdc++.so.6: version `GLIBCXX_3.4.20' not found (required by /sw/apps/bioinfo/SHORE/0.9.3/milou/lib/libshore.so.0)

Make sure you do that.

