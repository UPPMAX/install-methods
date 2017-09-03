LASTZ from http://www.bx.psu.edu/~rsharris/lastz/
=================================================
Last official release was 1.02 but found 1.03.54 at same site.

Get current release
    wget http://www.bx.psu.edu/~rsharris/lastz/newer/lastz-1.03.54.tar.gz

Edit "make-include.mak" for Milou installation
    12c12
    < installDir = /sw/apps/bioinfo/lastz/1.03.54/milou/bin
    ---
    > installDir = ${HOME}/lastz-distrib/bin

Edit "src/Makefile" to switch off fatal warnings
    53c53
    < definedForAll = -Wall -Wextra -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
    ---
    > definedForAll = -Wall -Wextra -Werror -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE

Compile
    cd src
    make
    make install

Also make executable for > 2GBa
    make lastz_32
    make install_32

Also make version which allows Adjacent Indels
    mv ../../milou/bin/lastz_32 ../../milou/bin/tmp
    make clean
    make lastz_32 allowBackToBackGaps=ON
    make install_32
    mv ../../milou/bin/lastz_32 ../../milou/bin/lastz_ai
    mv ../../milou/bin/tmp ../../milou/bin/lastz_32 
