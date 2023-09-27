GDAL/3.7.2
==========

<https://www.gdal.org>

Used under license:
X/MIT style Open Source

Structure creating script (makeroom_GDAL_3.7.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/GDAL/makeroom_3.7.2.sh

LOG
---

    TOOL=GDAL
    VERSION=3.7.2
    makeroom.sh -f -c "apps" -t "$TOOL" -v "$VERSION" -w "https://www.gdal.org" -s "misc" -l "X/MIT style Open Source" -d "translator library for raster and vector geospatial data formats"

    ./makeroom_GDAL_3.7.2.sh
    source /sw/apps/GDAL/SOURCEME_GDAL_3.7.2

    cd $SRCDIR

    [[ -f gdal-${VERSION}.tar.gz ]] || wget https://github.com/OSGeo/gdal/releases/download/v${VERSION}/gdal-${VERSION}.tar.gz
    tar xf gdal-${VERSION}.tar.gz
    cd gdal-${VERSION}

They only support cmake for builds, since 3.6.0.

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
    module load libcurl/7.85.0

    module load Armadillo/9.700.2
    module load PROJ/9.1.1
    module load Poppler/23.02.0
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

Continuing:

    mkdir build
    cd build

SQLite3 needs help, as it finds include files from the system but the library from the module.  Tried definining SQLITE3_ROOT, we'll see if that helps.

    cmake ..  -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_POLICY_DEFAULT_CMP0074=NEW -DTIFF_INCLUDE_DIR=$LIBTIFF_ROOT/include -DTIFF_LIBRARY_RELEASE:FILEPATH=$LIBTIFF_ROOT/lib/libtiff.so -DWEBP_INCLUDE_DIR:PATH=$LIBWEBP_ROOT/include -DWEBP_LIBRARY:FILEPATH=$LIBWEBP_ROOT/lib/libwebp.so -DSQLite3_INCLUDE_DIR:PATH=$SQLITE_ROOT/include -DSQLITE3EXT_INCLUDE_DIR:PATH=$SQLITE_ROOT/include -DSQLite3_LIBRARY:FILEPATH=$SQLITE_ROOT/lib/libsqlite3.so -DLIBLZMA_INCLUDE_DIR:PATH=$LIBLZMA_ROOT/include -DLIBLZMA_LIBRARY_RELEASE:FILEPATH=$LIBLZMA_ROOT/lib/liblzma.so -DGEOTIFF_INCLUDE_DIR:PATH=$LIBGEOTIFF_ROOT/include -DGEOTIFF_LIBRARY:FILEPATH=$LIBGEOTIFF_ROOT/lib/libgeotiff.so -DARMADILLO_INCLUDE_DIR:PATH=$ARMADILLO_ROOT/include -DARMADILLO_LIBRARY:FILEPATH=$ARMADILLO_ROOT/lib/libarmadillo.so -DOPENJPEG_INCLUDE_DIR:PATH=$OPENJPEG_ROOT/include -DOPENJPEG_INCLUDE_DIR:FILEPATH=$OPENJPEG_ROOT/lib/libopenjp2.so

This cannot build with shapelib support: I tried  `-DGDAL_USE_SHAPELIB=ON -DShapelib_INCLUDE_DIR=$SHAPELIB_ROOT/include -DShapelib_LIBRARY:FILEPATH=$SHAPELIB_ROOT/lib/libshp.so` and ended up with


    CMake Error at frmts/aigrid/CMakeLists.txt:14 (target_link_libraries):
      Error evaluating generator expression:

        $<TARGET_OBJECTS:shapelib>

      Objects of target "shapelib" referenced but no such target exists.

I tried renaming the target in that file to libshp, shp, and so on. Don't know cmake well enough to fix it.

Another problem is that it needs Poppler-internal header files, found only within the Poppler source tree at /sw/libs/Poppler/23.02.0/src/poppler-23.02.0/poppler/. Files like Object.h, Stream.h and so on.
How to specify this and not short-circuit the automatic detection? Does it need the installed header files or only these source-tree header files?
I suppose I could include these directories in CPATH and CPLUS_INCLUDE_PATH of the Poppler module?

    prepend-path   CPATH                  $modroot/../src/poppler-$version/build/poppler
    prepend-path   CPATH                  $modroot/../src/poppler-$version/build
    prepend-path   CPATH                  $modroot/../src/poppler-$version/poppler
    prepend-path   CPATH                  $modroot/../src/poppler-$version
    prepend-path   CPLUS_INCLUDE_PATH     $modroot/../src/poppler-$version/build/poppler
    prepend-path   CPLUS_INCLUDE_PATH     $modroot/../src/poppler-$version/build
    prepend-path   CPLUS_INCLUDE_PATH     $modroot/../src/poppler-$version/poppler
    prepend-path   CPLUS_INCLUDE_PATH     $modroot/../src/poppler-$version

That seems simplest.


    make
    make test
    make install

### Combine lib and lib64 directories

Combine `$PREFIX/lib`, which contains `python3.9/`, and `$PREFIX/lib64`.

    cd $PREFIX
    mv lib/python3.9 lib64/
    rmdir lib
    ln -s lib64 lib

There is no RPATH set for the library, so set it.  Use the current value of `LD_RUN_PATH`.

    cd $PREFIX/lib/
    [[ -e libgdal.so ]] || { echo 'lib directories not combined!!!'; exit 1; }
    ml patchelf/0.10
    patchelf --set-rpath $LD_RUN_PATH libgdal.so

Check RPATH for the executables.

    cd $PREFIX/bin
    for F in $(file * | grep 'ELF 64-bit LSB executable' | cut -f1 -d:) ; do echo $F; patchelf --print-rpath $F; done

No RPATH set. What do they load?


I can see it tests for avx2, so need to build separate on snowy?

Use mf from previous install.

    -- GDAL_VERSION          = 3.6.2
    -- GDAL_ABI_FULL_VERSION = 32.3.6.2
    -- GDAL_SOVERSION        = 32
    -- Could NOT find ODBC (missing: ODBC_INCLUDE_DIR)
    -- Could NOT find ODBCCPP (missing: ODBCCPP_LIBRARY ODBCCPP_INCLUDE_DIR)
    -- Could NOT find MSSQL_ODBC (missing: MSSQL_ODBC_LIBRARY MSSQL_ODBC_INCLUDE_DIR MSSQL_ODBC_VERSION)
    -- Could NOT find MySQL (missing: MYSQL_LIBRARY MYSQL_INCLUDE_DIR)
    -- Found CURL: /sw/libs/libcurl/7.85.0/rackham/lib/libcurl.so (found version "7.85.0")
    -- Performing Test Iconv_IS_BUILT_IN
    -- Performing Test Iconv_IS_BUILT_IN - Success
    -- Found Iconv: /usr/lib64/libc.so
    -- Performing Test _ICONV_SECOND_ARGUMENT_IS_NOT_CONST
    -- Performing Test _ICONV_SECOND_ARGUMENT_IS_NOT_CONST - Success
    -- Performing Test ICONV_HAS_EXTRA_CHARSETS
    -- Performing Test ICONV_HAS_EXTRA_CHARSETS - Success
    -- Found LibXml2: /usr/lib64/libxml2.so (found version "2.9.1")
    -- Could NOT find EXPAT (missing: EXPAT_DIR)
    -- Found EXPAT: /usr/lib64/libexpat.so (found version "2.1.0")
    -- Found XercesC: /usr/lib64/libxerces-c.so (found version "3.1.1")
    -- Found ZLIB: /sw/libs/zlib/1.2.12/rackham/lib/libz.so (found version "1.2.12")
    -- Could NOT find Deflate (missing: Deflate_LIBRARY Deflate_INCLUDE_DIR)
    -- Found OpenSSL: /usr/lib64/libcrypto.so (found version "1.0.2k") found components: SSL Crypto
    -- Could NOT find CryptoPP (missing: CRYPTOPP_LIBRARY CRYPTOPP_TEST_KNOWNBUG CRYPTOPP_INCLUDE_DIR)
    -- Found TIFF: /sw/libs/libtiff/4.5.0/rackham/lib/libtiff.so (found suitable version "4.5.0", minimum required is "4.0")
    -- Could NOT find ZSTD (missing: ZSTD_DIR)
    -- Found PkgConfig: /usr/bin/pkg-config (found version "0.27.1")
    -- Found ZSTD: /sw/libs/zstd/1.5.2/rackham/lib/libzstd.so (found version "1.5.2")
    -- Could NOT find SFCGAL (missing: SFCGAL_LIBRARY SFCGAL_INCLUDE_DIR)
    -- Found TIFF: /sw/libs/libtiff/4.5.0/rackham/lib/libtiff.so (found version "4.5.0")
    -- Reading /sw/libs/libgeotiff/1.7.1/rackham/share/cmake/GeoTIFF/geotiff-config.cmake
    -- GeoTIFF configuration, version 1.7.1
    --   include directory: ${GeoTIFF_INCLUDE_DIRS}
    --   ${GeoTIFF_LIBRARIES} set to static libraries
    -- Found PNG: /usr/lib64/libpng.so (found version "1.5.13")
    -- Found JPEG: /usr/lib64/libjpeg.so (found version "62")
    -- Could NOT find GIF (missing: GIF_LIBRARY GIF_INCLUDE_DIR)
    -- Could NOT find JSONC (missing: JSONC_DIR)
    -- Could NOT find JSONC (missing: JSONC_LIBRARY JSONC_INCLUDE_DIR)
    -- Could NOT find OpenCAD (missing: OPENCAD_LIBRARY OPENCAD_INCLUDE_DIR)
    -- Found QHULL: /sw/libs/Qhull/2020.2/rackham/lib/libqhull_r.so
    -- Could NOT find LERC (missing: LERC_LIBRARY LERC_INCLUDE_DIR)
    -- Could NOT find BRUNSLI (missing: BRUNSLI_ENC_LIB BRUNSLI_DEC_LIB BRUNSLI_INCLUDE_DIR)
    -- Could NOT find libQB3 (missing: libQB3_DIR)
    -- Could NOT find Shapelib (missing: Shapelib_INCLUDE_DIR Shapelib_LIBRARY)
    -- Found PCRE2: /usr/lib64/libpcre2-8.so
    -- Looking for sqlite3_mutex_alloc
    -- Looking for sqlite3_mutex_alloc - found
    -- Looking for sqlite3_column_table_name
    -- Looking for sqlite3_column_table_name - found
    -- Looking for sqlite3_rtree_query_callback
    -- Looking for sqlite3_rtree_query_callback - found
    -- Looking for sqlite3_load_extension
    -- Looking for sqlite3_load_extension - found
    -- Looking for sqlite3_progress_handler
    -- Looking for sqlite3_progress_handler - found
    -- Performing Test SQLite3_HAS_NON_DEPRECATED_AUTO_EXTENSION
    -- Performing Test SQLite3_HAS_NON_DEPRECATED_AUTO_EXTENSION - Success
    -- Found SQLite3: /sw/apps/sqlite/3.34.0/rackham/lib/libsqlite3.so (found version "3.7.17")
    -- Could NOT find SPATIALITE (missing: SPATIALITE_LIBRARY SPATIALITE_INCLUDE_DIR)
    -- Could NOT find RASTERLITE2 (missing: RASTERLITE2_LIBRARY RASTERLITE2_INCLUDE_DIR)
    -- Could NOT find LibKML (missing: LIBKML_BASE_LIBRARY LIBKML_INCLUDE_DIR LIBKML_DOM_LIBRARY LIBKML_ENGINE_LIBRARY)
    -- Found HDF5: /usr/lib64/libhdf5.so;/usr/lib64/libhdf5_cpp.so;/usr/lib64/libhdf5.so (found version "1.8.12") found components: C CXX
    -- Could NOT find WebP (missing: WEBP_INCLUDE_DIR) (found version "1.3.0")
    -- Could NOT find FreeXL (missing: FREEXL_LIBRARY FREEXL_INCLUDE_DIR)
    -- Could NOT find MRSID (missing: MRSID_LIBRARY MRSID_INCLUDE_DIR)
    -- Could NOT find Armadillo (missing: ARMADILLO_INCLUDE_DIR)
    -- Could NOT find GEOS (missing: GEOS_DIR)
    -- Found GEOS: /usr/lib64/libgeos_c.so
    -- Could NOT find HDF4 (missing: HDF4_df_LIBRARY HDF4_mfhdf_LIBRARY HDF4_INCLUDE_DIR)
    -- Could NOT find ECW (missing: ECW_LIBRARY ECWnet_LIBRARY ECWC_LIBRARY NCSUtil_LIBRARY ECW_INCLUDE_DIR)
    -- Could NOT find NetCDF (missing: NetCDF_DIR)
    -- Found NetCDF: /usr/lib64/libnetcdf.so
    -- Could NOT find OGDI (missing: OGDI_LIBRARY OGDI_INCLUDE_DIRS)
    -- Looking for CL_VERSION_2_2
    -- Looking for CL_VERSION_2_2 - found
    -- Found OpenCL: /usr/local/cuda/lib64/libOpenCL.so (found version "2.2")
    -- OPENCL has been found, but is disabled by default. Enable it by setting GDAL_USE_OPENCL=ON
    -- Could NOT find PostgreSQL (missing: PostgreSQL_LIBRARY PostgreSQL_INCLUDE_DIR)
    -- Found FYBA: /sw/libs/FYBA/4.1.1/rackham/lib/libfyba.so
    -- Found LibLZMA: /usr/lib64/liblzma.so (found version "5.2.2")
    -- Could NOT find LZ4 (missing: LZ4_LIBRARY LZ4_INCLUDE_DIR LZ4_VERSION)
    -- Could NOT find Blosc (missing: BLOSC_LIBRARY BLOSC_INCLUDE_DIR)
    -- Could NOT find basisu (missing: basisu_DIR)
    -- Could NOT find IDB (missing: IDB_INCLUDE_DIR IDB_IFCPP_LIBRARY IDB_IFDMI_LIBRARY IDB_IFSQL_LIBRARY IDB_IFCLI_LIBRARY)
    -- Could NOT find rdb (missing: rdb_DIR)
    -- Could NOT find TileDB (missing: TileDB_DIR)
    -- Could NOT find OpenEXR (missing: OpenEXR_LIBRARY OpenEXR_UTIL_LIBRARY OpenEXR_HALF_LIBRARY OpenEXR_IEX_LIBRARY OpenEXR_INCLUDE_DIR Imath_INCLUDE_DIR)
    -- Could NOT find MONGOCXX (missing: MONGOCXX_INCLUDE_DIR BSONCXX_INCLUDE_DIR MONGOCXX_LIBRARY BSONCXX_LIBRARY)
    -- Could NOT find OpenJPEG (missing: OPENJPEG_INCLUDE_DIR) (found version "2.5.0")
    -- Found JNI: /sw/comp/java/x86_64/OpenJDK_11.0.2/lib/libjawt.so
    -- Could NOT find HDFS (missing: HDFS_LIBRARY HDFS_INCLUDE_DIR)
    -- Found Poppler: /sw/libs/Poppler/0.75.0/rackham/lib64/libpoppler.so (found version "0.75.0")
    -- Could NOT find Podofo (missing: PODOFO_LIBRARY PODOFO_INCLUDE_DIR)
    -- Could NOT find Oracle (missing: Oracle_LIBRARY Oracle_INCLUDE_DIR)
    -- Could NOT find FileGDB (missing: FileGDB_LIBRARY FileGDB_INCLUDE_DIR)
    -- Could NOT find KDU (missing: KDU_INCLUDE_DIR KDU_LIBRARY KDU_AUX_LIBRARY) (found version "")
    -- Could NOT find LURATECH (missing: LURATECH_LIBRARY LURATECH_INCLUDE_DIR)
    -- Could NOT find Arrow (missing: Arrow_DIR)
    -- Found SWIG: /sw/apps/swig/3.0.12/rackham/bin/swig (found version "3.0.12")
    -- Found Java: /sw/comp/java/x86_64/OpenJDK_11.0.2/bin/java (found version "11.0.2") found components: Runtime Development
    -- Could NOT find CSharp (missing: CSHARP_TYPE CSHARP_VERSION CSHARP_COMPILER)
    -- Performing Test HAS_NO_UNDEFINED
    -- Performing Test HAS_NO_UNDEFINED - Success
    -- Found BISON: /usr/bin/bison (found version "3.0.4")
    --   Target system:             Linux
    --   Installation directory:    /sw/apps/GDAL/3.6.2/rackham
    --   C++ Compiler type:         GNU
    --   C compile command line:     /sw/comp/gcc/10.3.0_rackham/bin/gcc
    --   C++ compile command line:   /sw/comp/gcc/10.3.0_rackham/bin/g++
    --
    --   CMAKE_C_FLAGS:               -fvisibility=hidden
    --   CMAKE_CXX_FLAGS:               -fvisibility=hidden
    --   CMAKE_CXX11_STANDARD_COMPILE_OPTION:              -std=c++11
    --   CMAKE_CXX11_EXTENSION_COMPILE_OPTION:              -std=gnu++11
    --   CMAKE_EXE_LINKER_FLAGS:
    --   CMAKE_MODULE_LINKER_FLAGS:               -Wl,--no-undefined
    --   CMAKE_SHARED_LINKER_FLAGS:               -Wl,--no-undefined
    --   CMAKE_STATIC_LINKER_FLAGS:
    --   CMAKE_C_FLAGS_RELEASE:              -O3 -DNDEBUG
    --   CMAKE_CXX_FLAGS_RELEASE:              -O3 -DNDEBUG
    --   CMAKE_EXE_LINKER_FLAGS_RELEASE:
    --   CMAKE_MODULE_LINKER_FLAGS_RELEASE:
    --   CMAKE_SHARED_LINKER_FLAGS_RELEASE:
    --   CMAKE_STATIC_LINKER_FLAGS_RELEASE:
    --
    -- Enabled drivers and features and found dependency packages
    -- The following features have been enabled:

     * gdal_JPEG, JPEG image format
     * gdal_RAW, Raw formats:EOSAT FAST Format, FARSITE LCP and Vexcel MFF2 Image
     * gdal_GTIFF, GeoTIFF image format
     * gdal_MEM, Read/write data in Memory
     * gdal_VRT, Virtual GDAL Datasets
     * gdal_HFA, Erdas Imagine .img
     * gdal_SDTS, SDTS translator
     * gdal_NITF, National Imagery Transmission Format
     * gdal_GXF, GXF
     * gdal_AAIGRID, Arc/Info ASCII Grid Format.
     * gdal_CEOS, CEOS translator
     * gdal_SAR_CEOS, ASI CEOS translator
     * gdal_XPM, XPM image format
     * gdal_DTED, Military Elevation Data
     * gdal_JDEM, JDEM driver
     * gdal_ENVISAT, Envisat
     * gdal_ELAS, Earth Resources Laboratory Applications Software
     * gdal_FIT, FIT driver
     * gdal_L1B, NOAA Polar Orbiter Level 1b Data Set (AVHRR)
     * gdal_RS2, RS2 -- RadarSat 2 XML Product
     * gdal_ILWIS, Raster Map
     * gdal_RMF, RMF --- Raster Matrix Format
     * gdal_LEVELLER, Daylon Leveller heightfield
     * gdal_SGI, SGI Image driver
     * gdal_SRTMHGT, SRTM HGT File Read Support
     * gdal_IDRISI, Idrisi Raster Format
     * gdal_GSG, Implements the Golden Software Surfer 7 Binary Grid Format.
     * gdal_ERS, ERMapper .ERS
     * gdal_JAXAPALSAR, JAXA PALSAR Level 1.1 and Level 1.5 processed products support
     * gdal_DIMAP, SPOT Dimap Driver
     * gdal_GFF, Ground-based SAR Applitcations Testbed File Format driver
     * gdal_COSAR, COSAR -- TerraSAR-X Complex SAR Data Product
     * gdal_PDS, USGS Astrogeology ISIS Cube (Version 2)
     * gdal_ADRG, ADRG reader and ASRP/USRP Reader
     * gdal_COASP, DRDC Configurable Airborne SAR Processor (COASP) data reader
     * gdal_TSX, TerraSAR-X XML Product Support
     * gdal_TERRAGEN, Terragen&trade; Terrain File
     * gdal_BLX, Magellan BLX Topo File Format
     * gdal_MSGN, Meteosat Second Generation (MSG) Native Archive Format (.nat)
     * gdal_TIL, EarthWatch .TIL Driver
     * gdal_R, R Object Data Store
     * gdal_NORTHWOOD, NWT_GRD/NWT_GRC -- Northwood/Vertical Mapper File Format
     * gdal_SAGA, SAGA GIS Binary Driver
     * gdal_XYZ, ASCII Gridded XYZ
     * gdal_ESRIC, ESRI compact cache
     * gdal_HF2, HF2/HFZ heightfield raster
     * gdal_KMLSUPEROVERLAY
     * gdal_CTG, CTG driver
     * gdal_ZMAP, ZMAP
     * gdal_NGSGEOID, NOAA NGS Geoid Height Grids
     * gdal_IRIS, IRIS driver
     * gdal_MAP, OziExplorer .MAP
     * gdal_CALS, CALS type 1
     * gdal_SAFE, SAFE -- Sentinel-1 SAFE XML Product
     * gdal_SENTINEL2, Driver for Sentinel-2 Level-1B, Level-1C and Level-2A products.
     * gdal_PRF, PHOTOMOD Raster File
     * gdal_MRF, Meta raster format
     * gdal_WMTS, OGC Web Map Tile Service
     * gdal_GRIB, WMO General Regularly-distributed Information in Binary form
     * gdal_BMP, Microsoft Windows Device Independent Bitmap
     * gdal_TGA, TGA
     * gdal_STACTA, STACTA
     * gdal_OGCAPI, OGCAPI
     * gdal_BSB, Maptech/NOAA BSB Nautical Chart Format
     * gdal_AIGRID, Arc/Info Binary Grid Format
     * gdal_ARG, ARG: Azavea Raster Grid
     * gdal_USGSDEM, USGS ASCII DEM (and CDED)
     * gdal_AIRSAR, AirSAR Polarimetric Format
     * gdal_OZI, OZF2/OZFX3 raster
     * gdal_PCIDSK, PCI Geomatics Database File
     * gdal_SIGDEM, Scaled Integer Gridded DEM .sigdem Driver
     * gdal_RIK, RIK -- Swedish Grid Maps
     * gdal_STACIT, STACIT
     * gdal_PDF, Geospatial PDF
     * gdal_PNG, PNG image format
     * gdal_GIF, Graphics Interchange Format
     * gdal_WCS, OGC Web Coverage Service
     * gdal_HTTP, HTTP driver
     * gdal_NETCDF, NetCDF network Common Data Form
     * gdal_ZARR, ZARR
     * gdal_DAAS, Airbus DS Intelligence Data As A Service(DAAS)
     * gdal_EEDA, Earth Engine Data API
     * gdal_HDF5, Hierarchical Data Format Release 5 (HDF5)
     * gdal_PLMOSAIC, PLMosaic (Planet Labs Mosaics API)
     * gdal_WMS, Web Map Services
     * gdal_RASTERLITE, Rasterlite - Rasters in SQLite DB
     * gdal_MBTILES, MBTile
     * gdal_PCRASTER, PCRaster CSF 2.0 raster file driver
     * ogr_MEM, Read/write driver for MEMORY virtual files
     * ogr_GEOJSON, GeoJSON/ESRIJSON/TopoJSON driver
     * ogr_TAB, MapInfo TAB and MIF/MID
     * ogr_SHAPE, ESRI shape-file
     * ogr_KML, KML
     * ogr_VRT, VRT - Virtual Format
     * ogr_AVC, AVC
     * ogr_GML, GML
     * ogr_CSV, CSV
     * ogr_DGN, DGN
     * ogr_GMT, GMT
     * ogr_NTF, NTF
     * ogr_S57, S57
     * ogr_TIGER, U.S. Census TIGER/Line
     * ogr_GEOCONCEPT, GEOCONCEPT
     * ogr_GEORSS, GEORSS
     * ogr_DXF, DXF
     * ogr_PGDUMP, PGDump
     * ogr_GPSBABEL, GPSBABEL
     * ogr_EDIGEO, EDIGEO
     * ogr_SXF, SXF
     * ogr_OPENFILEGDB, OPENFILEGDB
     * ogr_WASP, WAsP .map format
     * ogr_SELAFIN, OSELAFIN
     * ogr_JML, JML
     * ogr_VDV, VDV-451/VDV-452/INTREST Data Format
     * ogr_FLATGEOBUF, FlatGeobuf
     * ogr_MAPML, MapML
     * ogr_SDTS, SDTS
     * ogr_GPX, GPX - GPS Exchange Format
     * ogr_GMLAS, GMLAS
     * ogr_SVG, Scalable Vector Graphics
     * ogr_CSW, CSW
     * ogr_NAS, NAS/ALKIS
     * ogr_PLSCENES, PLSCENES
     * ogr_SOSI, SOSI:Systematic Organization of Spatial Information
     * ogr_WFS, OGC WFS service
     * ogr_NGW, NextGIS Web
     * ogr_ELASTIC, ElasticSearch
     * ogr_IDRISI, IDRISI
     * ogr_PDS, Planetary Data Systems TABLE
     * ogr_SQLITE, SQLite3 / Spatialite RDBMS
     * ogr_GPKG, GeoPackage
     * ogr_OSM, OpenStreetMap XML and PBF
     * ogr_VFK, Czech Cadastral Exchange Data Format
     * ogr_MVT, MVT
     * ogr_AMIGOCLOUD, AMIGOCLOUD
     * ogr_CARTO, CARTO
     * ogr_ILI, ILI
     * ogr_XLSX, Microsoft Office Excel(xlsx)
     * ogr_CAD, OpenCAD
     * ogr_ODS, ODS
     * ogr_LVBAG, LVBAG

    -- The following OPTIONAL packages have been found:

     * Python (required version >= 3.6)
       SWIG_PYTHON: Python binding
     * Threads
     * Iconv
       Character set recoding (used in GDAL portability library)
     * LibXml2
       Read and write XML formats
     * XercesC
       Read and write XML formats (needed for GMLAS and ILI drivers)
     * OpenSSL
       Use OpenSSL library
     * ZSTD, Zstandard - Fast real-time compression algorithm, <https://github.com/facebook/zstd>
       ZSTD compression library
     * PROJ
     * ZLIB
       zlib (external)
     * PCRE2
       Enable PCRE2 support for sqlite3
     * HDF5
       Enable HDF5
     * NetCDF
       Enable netCDF driver
     * OpenCL
       Enable OpenCL (may be used for warping)
     * FYBA
       enable ogr_SOSI driver
     * LibLZMA
       LZMA compression
     * Poppler, A PDF rendering library, <http://poppler.freedesktop.org>
       Enable PDF driver with Poppler (read side)
     * JNI
       SWIG_JAVA: Java binding
     * Java
     * BISON

    -- The following RECOMMENDED packages have been found:

     * EXPAT
       Read and write XML formats
     * TIFF, Support for the Tag Image File Format (TIFF)., <https://libtiff.gitlab.io/libtiff/>
       Support for the Tag Image File Format (TIFF).
       gdal_GTIFF: GeoTIFF image format
       gdal_CALS: CALS type 1 driver
     * CURL
       Enable drivers to use web API
     * GeoTIFF
       libgeotiff library (external)
     * PNG
       PNG compression library (external)
     * JPEG
       JPEG compression library (external)
     * QHULL
       Enable QHULL (external)
     * SQLite3
       Enable SQLite3 support (used by SQLite/Spatialite, GPKG, Rasterlite, MBTiles, etc.)
     * GEOS
       Geometry Engine - Open Source (GDAL core dependency)
     * SWIG, software development tool that connects programs written in C and C++ with a variety of high-level programming languages., <http://swig.org/>
       Enable language bindings

    -- The following features have been disabled:

     * gdal_HEIF, HEIF
     * gdal_MSG, Meteosat Second Generation
     * gdal_FITS, FITS Driver
     * gdal_RASDAMAN, Rasdaman GDAL driver
     * gdal_GTA, Generic Tagged Arrays
     * gdal_WEBP, WebP
     * gdal_HDF4, Hierarchical Data Format Release 4 (HDF4)
     * gdal_POSTGISRASTER, PostGIS Raster driver
     * gdal_DDS, DirectDraw Surface
     * gdal_KEA, Kea
     * gdal_JP2OPENJPEG, JPEG2000 driver based on OpenJPEG library
     * gdal_TILEDB, TileDB tiledb.io
     * gdal_EXR, EXR support via OpenEXR library
     * gdal_RDB, RIEGL RDB Map Pixel (.mpx) driver
     * gdal_JPEGXL, JPEG-XL
     * gdal_BASISU_KTX2, Basis Universal and KTX2 texture formats
     * gdal_JP2KAK, JPEG-2000 (based on Kakadu)
     * gdal_JPIPKAK, JPIP Streaming
     * gdal_JP2LURA, JPEG-2000 (based on Luratech)
     * gdal_SDE, ESRI ArcSDE Raster
     * gdal_MRSID, Multi-resolution Seamless Image Database
     * gdal_GEOR, Oracle Spatial GeoRaster
     * gdal_ECW, ERDAS JPEG2000 (.jp2)
     * ogr_DWG, DWG
     * ogr_FILEGDB, FileGDB
     * ogr_LIBKML, LibKML
     * ogr_MYSQL, MySQL
     * ogr_PG, PostGIS
     * ogr_MSSQLSPATIAL, MSSQLSPATIAL
     * ogr_ODBC, ODBC
     * ogr_PGEO, PGEO
     * ogr_XLS, Microsoft Office Excel(xls)
     * ogr_MONGODBV3, MongoDB V3
     * ogr_PARQUET, Parquet
     * ogr_ARROW, Arrow
     * ogr_OCI, Oracle OCI
     * ogr_IDB, IDB
     * ogr_OGDI, OGDI
     * ogr_HANA, SAP HANA

    -- The following OPTIONAL packages have not been found:

     * ODBC
       Enable DB support through ODBC
     * ODBCCPP
       odbc-cpp library (external)
     * MSSQL_NCLI
       MSSQL Native Client to enable bulk copy
     * MSSQL_ODBC
       MSSQL ODBC driver to enable bulk copy
     * MySQL
       MySQL
     * Deflate
       Enable libdeflate compression library (complement to ZLib)
     * CryptoPP
       Use crypto++ library for CPL.
     * SFCGAL
       gdal core supports ISO 19107:2013 and OGC Simple Features Access 1.2 for 3D operations
     * GIF
       GIF compression library (external)
     * JSONC
       json-c library (external)
     * OpenCAD
       libopencad (external, used by OpenCAD driver)
     * BRUNSLI
       Enable BRUNSLI for JPEG packing in MRF
     * libQB3
       Enable QB3 compression in MRF
     * SPATIALITE
       Enable spatialite support for sqlite3
     * RASTERLITE2
       Enable RasterLite2 support for sqlite3
     * LibKML
     * WebP
       WebP compression
     * FreeXL
       Enable XLS driver
     * GTA
       Enable GTA driver
     * MRSID
       MrSID raster SDK
     * Armadillo
       C++ library for linear algebra (used for TPS transformation)
     * CFITSIO
       C FITS I/O library
     * HDF4
       Enable HDF4 driver
     * KEA
       Enable KEA driver
     * ECW
       Enable ECW driver
     * OGDI
       Enable ogr_OGDI driver
     * PostgreSQL
     * LZ4
       LZ4 compression
     * Blosc
       Blosc compression
     * JXL
       JPEG-XL compression
     * JXL_THREADS
       JPEG-XL threading
     * Crnlib
       enable gdal_DDS driver
     * basisu
       Enable BASISU driver
     * IDB
       enable ogr_IDB driver
     * RASDAMAN
       enable rasdaman driver
     * rdb
       enable RIEGL RDB library
     * TileDB
       enable TileDB driver
     * OpenEXR
       OpenEXR >=2.2
     * MONGOCXX
       Enable MongoDBV3 driver
     * HEIF
       HEIF >= 1.1
     * OpenJPEG
     * HDFS
       Enable Hadoop File System through native library
     * PDFIUM
       Enable PDF driver with Pdfium (read side)
     * Oracle
       Enable Oracle OCI driver
     * TEIGHA
       Enable DWG and DGNv8 drivers
     * FileGDB
       Enable FileGDB (based on closed-source SDK) driver
     * KDU
       Enable KAKADU
     * LURATECH
       Enable JP2Lura driver
     * Arrow
       Apache Arrow C++ library
     * Dotnet
     * CSharp
       SWIG_CSharp: CSharp binding

    -- The following RECOMMENDED packages have not been found:

     * LERC
       Enable LERC (external)

    -- Disabled components:

     * OPENCL component has been detected, but is disabled with GDAL_USE_OPENCL=OFF


    -- Internal libraries enabled:

     * GIF internal library enabled
     * JSONC internal library enabled
     * OPENCAD internal library enabled
     * LERC internal library enabled


    -- Configuring done
    -- Generating done
    -- Build files have been written to: /sw/apps/GDAL/3.6.2/src/gdal-3.6.2/build
    rackham5: /sw/apps/GDAL/3.6.2/src/gdal
