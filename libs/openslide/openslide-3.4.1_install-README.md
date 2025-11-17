openslide/3.4.1
========================

<https://github.com/openslide/openslide>

Used under license:
LGPL


Structure creating script (makeroom_openslide_3.4.1.sh) moved to /sw/libs/openslide/makeroom_3.4.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "openslide" "-v" "3.4.1" "-d" "C library for reading virtual slide images" "-l" "LGPL" "-w" "https://github.com/openslide/openslide" "-c" "libs" "-f"
    ./makeroom_openslide_3.4.1.sh

    # Load modules
    module load OpenJPEG/2.5.0


    # Download
    cd $SRCDIR
    wget https://github.com/openslide/openslide/releases/download/v3.4.1/openslide-3.4.1.tar.gz
    tar xfvz openslide-3.4.1.tar.gz; cd openslide-3.4.1
    ./configure --prefix=$PREFI
    make -j 10



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
