libvips/8.15.2
========================

<https://github.com/libvips/libvips>

Used under license:
LGPL-2.1


Structure creating script (makeroom_libvips_8.15.2.sh) moved to /sw/libs/libvips/makeroom_8.15.2.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "libvips" "-v" "8.15.2" "-c" "libs" "-d" "A fast image processing library with low memory needs." "-w" "https://github.com/libvips/libvips" "-l" "LGPL-2.1"
    ./makeroom_libvips_8.15.2.sh

    # load modules
    module load meson/1.1.0
    module load ninja/1.10.0 
    module load cmake/3.26.3
    module load gcc/13.3.0
    module load ImageMagick/7.0.11-3
    module load OpenJPEG/2.5.0
    module load libarchive/3.6.2
    module load libwebp/1.3.0


    # download
    cd $SRCDIR
    wget https://github.com/libvips/libvips/releases/download/v8.15.2/vips-8.15.2.tar.xz
    tar xfvl vips-8.15.2.tar.xz
    cd vips-8.15.2.tar.xz

    # install
    meson setup build --prefix $PREFIX
    cd build
    meson compile
    meson test
    meson install
    
    #External image format libraries
    #  JPEG load/save with libjpeg       : YES
    #  JXL load/save with libjxl         : NO (dynamic module: NO)
    #  JPEG2000 load/save with OpenJPEG  : YES
    #  PNG load/save with libspng        : NO
    #  PNG load/save with libpng         : YES
    #  selected quantisation package     : none
    #  TIFF load/save with libtiff       : YES
    #  image pyramid save with libarchive: YES
    #  HEIC/AVIF load/save with libheif  : NO (dynamic module: NO)
    #  WebP load/save with libwebp       : YES
    #  PDF load with PDFium              : NO
    #  PDF load with poppler-glib        : NO (dynamic module: NO)
    #  SVG load with librsvg             : YES
    #  EXR load with OpenEXR             : NO
    #  OpenSlide load                    : NO (dynamic module: NO)
    #  Matlab load with libmatio         : NO
    #  NIfTI load/save with niftiio      : NO
    #  FITS load/save with cfitsio       : NO
    #  GIF save with cgif                : NO
    #  selected Magick package           : MagickCore (dynamic module: YES)
    #  Magick API version                : magick7
    #  Magick load                       : YES
    #  Magick save                       : YES
