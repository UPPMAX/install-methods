edlib/1.2.7
========================

<http://>

Used under license:
MIT


Structure creating script (makeroom_edlib_1.2.7.sh) moved to /sw/libs/edlib/makeroom_1.2.7.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "edlib" "-v" "1.2.7" "-d" "Lightweight, super fast C/C++ (& Python) library for sequence alignment using edit (Levenshtein) distance." "-l" "MIT" "-c" "libs"
    ./makeroom_edlib_1.2.7.sh

    # load modules
    module load meson/1.1.0
    module load gcc/9.3.0
    
    # Download
    cd $SRCDIR
    wget https://github.com/Martinsos/edlib/archive/refs/tags/v1.2.7.tar.gz
    tar xfvz v1.2.7.tar.gz

    # Install
    make
    meson install -C meson-build --destdir $PREFIX
    mv $PREFIX/usr/local/* $PREFIX/
    rmdir -p $PREFIX/usr/
