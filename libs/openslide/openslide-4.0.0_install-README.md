openslide/4.0.0
========================

<https://github.com/openslide/openslide>

Used under license:
LGPL


Structure creating script (makeroom_openslide_4.0.0.sh) moved to /sw/libs/openslide/makeroom_4.0.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "openslide" "-v" "4.0.0" "-d" "C library for reading virtual slide images" "-l" "LGPL" "-w" "https://github.com/openslide/openslide" "-c" "libs"
    ./makeroom_openslide_4.0.0.sh
    cd $SRCDIR

    # Load modules
    module load meson/1.1.0
    module load cairo/1.17.4
    module load glib/2.72.1
    module load OpenJPEG/2.5.0
    module load libtiff/4.5.0
    module load sqlite/3.45.0
    module load zlib/1.3

    # Download
    cd $SRCDIR
    wget https://github.com/openslide/openslide/releases/download/v4.0.0/openslide-4.0.0.tar.xz
    tar xfl openslide-4.0.0.tar.xz
    cd openslide-4.0.0.tar.xz

    # Compile
    meson setup --prefix $PREFIX builddir
    meson compile -C builddir
    meson install -C builddir

    # Check dependencies
    export LD_LIBRARY_PATH=$PREFIX/lib64/:$LD_LIBRARY_PATH
    ldd $PREFIX/bin/*    | grep -i not
    ldd $PREFIX/lib64/*  | grep -i not
