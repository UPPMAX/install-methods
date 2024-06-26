Poppler/23.09.0
===============

<https://poppler.freedesktop.org>

Used under license:
GPL v2


Structure creating script (makeroom_Poppler_23.09.0.sh) moved to /sw/libs/Poppler/makeroom_23.09.0.sh

The installed executables and shared libraries do not, by default, contain
RPATH information. So, specify this during cmake configuration from the prefix
plus the `LD_RUN_PATH` value collectively set by the module loads.  The
specific option required is

         -DCMAKE_INSTALL_RPATH="$PREFIX/lib64;${LD_RUN_PATH//:/;}"

This provides the prefix `lib64/` directory and `LD_RUN_PATH` but with
semicolons replacing colons, this is how cmake needs the directories to be
specified.


Build with -DENABLE_UNSTABLE_API_ABI_HEADERS
-------------------------------

We need to build with `-DENABLE_UNSTABLE_API_ABI_HEADERS` so that the internal
headers get added to the install directories. This is in contrast to what we
did for Poppler/23.02.0, where we kept the src/ tree unpacked. This also allows
us to simplify the mf file compared to 23.02.0.



LOG
---

    makeroom.sh "-f" "-c" "libs" "-t" "Poppler" "-v" "23.09.0" "-w" "https://poppler.freedesktop.org" "-d" "PDF rendering library" "-l" "GPL v2"
    ./makeroom_Poppler_23.09.0.sh

    source /sw/libs/Poppler/SOURCEME_Poppler_23.09.0

    cd $SRCDIR


    [[ -f poppler-$VERSION.tar.xz ]] || wget --timestamping https://poppler.freedesktop.org/poppler-$VERSION.tar.xz
    tar xf poppler-${VERSION}.tar.xz
    cd poppler-${VERSION}

    module purge
    module load gcc/12.3.0
    module load cairo/1.17.4
    module load freetype/2.12.1
    module load cmake/3.26.3
    module load libcurl/7.85.0
    module load zlib/1.2.12
    module load bzip2/1.0.8
    module load boost/1.83.0-gcc12.3.0
    module load glib/2.72.1
    module load OpenJPEG/2.5.0
    module load libtiff/4.5.0
    module load zstd/1.5.2
    module load xz/5.2.6
    module load glib/2.72.1

    mkdir build
    cd build

    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_INSTALL_RPATH="$PREFIX/lib64;${LD_RUN_PATH//:/;}" -DBoost_NO_BOOST_CMAKE=ON -DCMAKE_BUILD_TYPE=Release -DENABLE_LIBCURL=ON -DFREETYPE_INCLUDE_DIR_freetype2:PATH=$FREETYPE_ROOT/include -DFREETYPE_INCLUDE_DIR_ft2build:PATH=$FREETYPE_ROOT/include  -DFREETYPE_LIBRARY_RELEASE:FILEPATH=$FREETYPE_ROOT/lib/libfreetype.so -DTIFF_INCLUDE_DIR=$LIBTIFF_ROOT/include -DTIFF_LIBRARY_RELEASE:FILEPATH=$LIBTIFF_ROOT/lib/libtiff.so -DENABLE_UNSTABLE_API_ABI_HEADERS:BOOL=YES -DENABLE_QT5:BOOL=OFF -DENABLE_QT6:BOOL=OFF

    make
    make install


