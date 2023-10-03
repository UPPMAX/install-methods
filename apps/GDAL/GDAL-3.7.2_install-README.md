GDAL/3.7.2
==========

<https://www.gdal.org>

Used under license:
X/MIT style Open Source

Structure creating script (makeroom_GDAL_3.7.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/GDAL/makeroom_3.7.2.sh

Maybe the shapelib issues are fixed.

LOG
---

    TOOL=GDAL
    VERSION=3.7.2
    makeroom.sh -f -c "apps" -t "$TOOL" -v "$VERSION" -w "https://www.gdal.org" -s "misc" -l "X/MIT style Open Source" -d "translator library for raster and vector geospatial data formats"

    ./makeroom_${TOOL}_${VERSION}.sh
    source /sw/apps/${TOOL}/SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR

    [[ -f gdal-${VERSION}.tar.gz ]] || wget https://github.com/OSGeo/gdal/releases/download/v${VERSION}/gdal-${VERSION}.tar.gz
    tar xf gdal-${VERSION}.tar.gz
    cd gdal-${VERSION}

Cmake for builds.

    module load cmake/3.26.3
    module load gcc/12.3.0
    module load java/OpenJDK_17+35
    module load python/3.10.8
    module load swig/4.1.1

    module load sqlite/3.34.0
    module load hdf5/1.14.0
    module load netcdf/4.9.2

    module load xz/5.2.6
    module load zlib/1.2.12
    module load zstd/1.5.2
    module load lz4/1.9.2
    module load libcurl/7.85.0

    module load Armadillo/9.700.2
    module load PROJ/9.1.1
    module load Poppler/23.09.0
    module load FYBA/4.1.1
    module load OpenJPEG/2.5.0
    module load libtiff/4.5.0
    module load libgeotiff/1.7.1
    module load libwebp/1.3.0
    module load giflib/5.1.4
    module load PROJ/9.1.1
    module load GEOS/3.12.0-gcc12.3.0
    module load Qhull/2020.2
    module load cairo/1.17.4
    module load giflib/5.1.4
    module load freetype/2.12.1
    module load libdeflate/1.19

Continuing:

    mkdir build
    cd build

SQLite3 needs help, as it finds include files from the system but the library
from the module.  Tried definining SQLITE3_ROOT, we'll see if that helps.

`cmake` needs help finding many other tools. This might be the longest cmake
command line I've used? It's rather ridiculous, considering all of these have
`_ROOT` variables defined and many have `pkgconfig/` directories added to
`PKG_CONFIG_PATH`.

    cmake ..  -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DTIFF_INCLUDE_DIR=$LIBTIFF_ROOT/include -DTIFF_LIBRARY_RELEASE:FILEPATH=$LIBTIFF_ROOT/lib/libtiff.so -DWEBP_INCLUDE_DIR:PATH=$LIBWEBP_ROOT/include -DWEBP_LIBRARY:FILEPATH=$LIBWEBP_ROOT/lib/libwebp.so -DSQLite3_INCLUDE_DIR:PATH=$SQLITE_ROOT/include -DSQLITE3EXT_INCLUDE_DIR:PATH=$SQLITE_ROOT/include -DSQLite3_LIBRARY:FILEPATH=$SQLITE_ROOT/lib/libsqlite3.so -DLIBLZMA_INCLUDE_DIR:PATH=$LIBLZMA_ROOT/include -DLIBLZMA_LIBRARY_RELEASE:FILEPATH=$LIBLZMA_ROOT/lib/liblzma.so -DGEOTIFF_INCLUDE_DIR:PATH=$LIBGEOTIFF_ROOT/include -DGEOTIFF_LIBRARY:FILEPATH=$LIBGEOTIFF_ROOT/lib/libgeotiff.so -DARMADILLO_INCLUDE_DIR:PATH=$ARMADILLO_ROOT/include -DARMADILLO_LIBRARY:FILEPATH=$ARMADILLO_ROOT/lib/libarmadillo.so -DOPENJPEG_INCLUDE_DIR:PATH=$OPENJPEG_ROOT/include -DOPENJPEG_INCLUDE_DIR:FILEPATH=$OPENJPEG_ROOT/lib/libopenjp2.so -DDeflate_LIBRARY_RELEASE:FILEPATH=$LIBDEFLATE_ROOT/lib/libdeflate.so -DDeflate_INCLUDE_DIR:PATH=$LIBDEFLATE_ROOT/include -DCMAKE_INSTALL_RPATH="$PREFIX/lib64;${LD_RUN_PATH//:/;}"

Being explicit with `-DCMAKE_INSTALL_RPATH` here means that the executables can
find their libraries, and also `libgdal.so`.

Do we not care about AVX2 instructions? Only if running on snowy. We can skip
the test for them by adding `-Dtest_avx2=NO` to the cmake command.

Poppler/23.09.0 installs the unstable headers, so we no longer need to reach
into its src/ tree as in GDAL/3.6.2. See the Poppler/23.09.0 install README for
more.

    make
    make install

### Combine lib and lib64 directories

Combine `$PREFIX/lib`, which contains `python3.10/`, and `$PREFIX/lib64`.

    cd $PREFIX
    mv lib/python3.10 lib64/
    rmdir lib
    ln -s lib64 lib

The RPATH is set for the library.

    cd $PREFIX/lib/
    [[ -e libgdal.so ]] || { echo '*** lib/ and lib64/ directories not combined!!! ***'; }
    ml patchelf/0.10
    patchelf --print-rpath libgdal.so
    ( ml purge ; ldd libgdal.so )

But the executables' RPATH is missing the directory for the library.

    cd $PREFIX/bin
    ml patchelf/0.10
    for F in $(file * | grep 'ELF 64-bit LSB executable' | cut -f1 -d:) ; do
        echo -e "\n$F\n"
        #  patchelf --print-rpath $F
        ( ml purge; ldd $F | grep 'not found' )
    done

The last command double-checks that RPATH is set correctly for each executable.  Check its outputs.

Update mf to include modules loaded during the build.

