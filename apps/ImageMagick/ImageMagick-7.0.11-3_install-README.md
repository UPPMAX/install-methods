ImageMagick/7.0.11-3
====================

Provide devel version of ImageMagick.

<https://www.imagemagick.org>

Used under license:
derived Apache 2.0
<https://imagemagick.org/script/license.php>

Structure creating script (makeroom_ImageMagick_7.0.11-3.sh) moved to /sw/apps/ImageMagick/makeroom_7.0.11-3.sh

LOG
---

    cd /sw/apps
    TOOL=ImageMagick
    VERSION=7.0.11-3
    cd $TOOL
    makeroom.sh -f -t "ImageMagick" -v "7.0.11-3" -c "apps" -w "https://www.imagemagick.org" -d "create\, edit\, compose\, or convert digital images" -l "derived Apache 2.0" -L "https://imagemagick.org/script/license.php"
    ./makeroom_ImageMagick_7.0.11-3.sh
    source SOURCEME_ImageMagick_7.0.11-3

    cd $SRCDIR

    [[ -f ImageMagick-${VERSION}.tar.gz ]] || wget https://www.imagemagick.org/download/ImageMagick-${VERSION}.tar.gz
    [[ -d ImageMagick-${VERSION} ]] && rm -rf ImageMagick-${VERSION}
    tar xzf ImageMagick-${VERSION}.tar.gz 
    cd ImageMagick-${VERSION}

To find out what might be configurable after unpacking the tarball.

    ./configure --help

To enable shared-library modules with `--with-modules`, load libtool/2.4.6, which provides libltdl.


To install:

    module load gcc/9.3.0
    module load libtool/2.4.6
    module load bzip2/1.0.6
    module load freetype/2.10.1
    module load texlive/2019
    module load zlib/1.2.11
    module load xz/5.2.2
    module load cairo/1.17.2
    module load giflib/5.1.4
    module load Poppler/0.75.0
    module load libwebp/1.2.0
    module load GhostPDL/9.53.3

Now go back to ImageMagick build.  RSVG support must be requested explicitly.

    cd ImageMagick-${VERSION}
    ./configure --prefix=$PREFIX --with-modules=yes --with-gnu-ld=yes --with-rsvg=yes --disable-hdri

    LDFLAGS=-L$GHOSTSCRIPT_ROOT/lib make -j 10
    make install

    cd ..
    rm -rf ImageMagick-${VERSION}

