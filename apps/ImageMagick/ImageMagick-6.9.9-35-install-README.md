ImageMagick/6.9.9-35
====================

Provide devel version of ImageMagick.


LOG
---

To find out what might be configurable after unpacking the tarball.

    ./configure --help

I tried to enable shared-library modules with `--with-modules` but got this error:

    checking for libltdl...
    checking ltdl.h usability... no
    checking ltdl.h presence... no
    checking for ltdl.h... no
    checking for lt_dlinit in -lltdl... no
    checking if libltdl package is complete... no
    configure: error: in `/sw/apps/ImageMagick/6.9.9-35/src/ImageMagick-6.9.9-35':
    configure: error: libltdl is required for modules and OpenCL builds

To install:

    TOOL=ImageMagick
    VERSION=6.9.9-35
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/
    mkdir $TOOL
    cd $TOOL/
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for C in bianca irma ; do ln -s $CLUSTER $C; done 
    PFX=$PWD/$CLUSTER
    mkdir src
    cd src/
    [[ -f ImageMagick-${VERSION}.tar.gz ]] || wget https://www.imagemagick.org/download/ImageMagick-${VERSION}.tar.gz
    [[ -d ImageMagick-${VERSION} ]] && rm -rf ImageMagick-${VERSION}
    tar xzf ImageMagick-${VERSION}.tar.gz 
    module load gcc/6.3.0
    module load bzip2/1.0.6
    module load freetype/2.7.1
    module load texlive/2016
    module load zlib/1.2.11
    module load xz/5.2.2
    module load cairo/1.14.8
    module load giflib/5.1.4
    module load Poppler/0.54.0

First, install webp.  This may not be strictly required, but it's a format
increasing in popularity.  Webp installs a `libwebp.pc` file so complete the
install by updating `PKG_CONFIG_PATH` to point to the install directory so webp
will be found during the ImageMagick configure.

    WEBP_VERSION=0.6.1
    [[ -f libwebp_v${WEBP_VERSION}.tar.gz ]] || wget -O libwebp_v${WEBP_VERSION}.tar.gz https://github.com/webmproject/libwebp/archive/v${WEBP_VERSION}.tar.gz
    [[ -d libwebp-${WEBP_VERSION} ]] && rm -rf libwebp-${WEBP_VERSION}
    tar xzf libwebp_v${WEBP_VERSION}.tar.gz
    cd libwebp-${WEBP_VERSION}
    ./autogen.sh --prefix=$PFX
    ./configure --prefix=$PFX
    make -j4
    make install
    export PKG_CONFIG_PATH=$PFX/lib/pkgconfig:$PKG_CONFIG_PATH
    cd ..
    rm -rf libwebp-${WEBP_VERSION}


Now go back to ImageMagick build.  RSVG support must be requested explicitly.

    cd ImageMagick-${VERSION}
    ./configure --prefix=$PFX --with-rsvg=yes

    make -j 10
    make install

    cd ..
    rm -rf ImageMagick-${VERSION}

Steal mf from zlib/1.2.11.

