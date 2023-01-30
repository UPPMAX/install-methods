libtiff/4.5.0
========================

<https://www.libtiff.org>

Used under license:
A IS


Structure creating script (makeroom_libtiff_4.5.0.sh) moved to /sw/libs/libtiff/makeroom_4.5.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-c" "libs" "-t" "libtiff" "-v" "4.5.0" "-w" "https://www.libtiff.org" "-l" "A IS" "-d" "This software provides support for the Tag Image File Format (TIFF), a widely used format for storing image data." "-f"
    ./makeroom_libtiff_4.5.0.sh
    cd $SRCDIR
    wget  http://download.osgeo.org/libtiff/tiff-4.5.0.zip
    unzip tiff-4.5.0.zip
    cd tiff-4.5.0/
    ml gcc/10.3.0
    ./configure  --prefix=$PREFIX
    make
    make check
    make install
    ls $PREFIX # check that bin, lib, include and share dirs are created
 

