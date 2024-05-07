mash/2.3-20210519-41ddc61
========================

<https://mash.readthedocs.io/en/latest/>

<https://github.com/marbl/Mash>

Used under license:
Custom open-source
<https://raw.githubusercontent.com/marbl/Mash/master/LICENSE.txt>

Structure creating script (makeroom_mash_2.3-20210519-41ddc61.sh) moved to /sw/bioinfo/mash/makeroom_2.3-20210519-41ddc61.sh

LOG
---

    makeroom.sh -f -t mash -v 2.3-20210519-41ddc61 -w https://mash.readthedocs.io/en/latest/ -d "Fast genome and metagenome distance estimation using MinHash" -l "Custom open-source" -L https://raw.githubusercontent.com/marbl/Mash/master/LICENSE.txt 
    ./makeroom_mash_2.3-20210519-41ddc61.sh 
    source /sw/bioinfo/mash/SOURCEME_mash_2.3-20210519-41ddc61
    cd $SRCDIR
    ml git/2.44.0
    git clone --recursive https://github.com/marbl/Mash
    cd Mash/
    git reset --hard 41ddc61
    ml autoconf/2.69
    ml automake/1.16.1
    ml m4/1.4.17
    ml gcc/12.3.0
    ml binutils/2.41
    ml boost/1.83.0-gcc12.3.0
    ml zlib/1.3
    ml capnproto/1.0.2

I have to apply a patch to include `<limits>`, mentioned in <https://github.com/marbl/Mash/issues/167> and described at <https://salsa.debian.org/med-team/mash/-/blob/master/debian/patches/gcc-11.patch>

    vi src/mash/robin_hood.h

Add `#include <limits>` after the `#include <string>` as the new line 12.

Now configure and build.

    ./configure --prefix=$PREFIX --with-boost=$BOOST_ROOT --with-capnp=$CAPNPROTO_ROOT

    make
    make test

Check RPATH.

    /sw/comp/patchelf/0.10/rackham/bin/patchelf --print-rpath mash

Everything is there!

    make install

    find $PREFIX -type d
    ll $PREFIX/lib

Only statis library, so only include `LIBRARY_PATH` among the library paths.
Also allow include directories.

    vi $TOOLDIR/mf/2.3-20210519-41ddc61 

Wrap up.

    cd $TOOLDIR
    ./mash-2.3-20210519-41ddc61_post-install.sh 
