FFmpeg/5.1.2
============

<https://ffmpeg.org/>

Used under license:
LGPL v2.1+, compiled with --enable-nonfree
https://ffmpeg.org/legal.html

Structure creating script (makeroom_FFmpeg_5.1.2.sh) moved to /sw/apps/FFmpeg/makeroom_5.1.2.sh

LOG
---

Build with the non-free features, and also with shared libraries.

Along the way, updated from 4.4 to use git/2.34.1 and installed doxygen/1.9.6 and freetype/2.12.1.


    TOOL=FFmpeg
    VERSION=5.1.2
    cd /sw/apps
    makeroom.sh -f -c apps -t $TOOL -v $VERSION -w https://ffmpeg.org/ -d "A complete, cross-platform solution to record, convert and stream audio and video" -l "LGPL v2.1+, compiled with --enable-nonfree"
    ./makeroom_FFmpeg_5.1.2.sh 

    cd $TOOL
    source SOURCEME_FFmpeg_5.1.2 

    cd $SRCDIR

    module load git/2.34.1

    git clone --recursive https://git.ffmpeg.org/ffmpeg.git ffmpeg
    cd ffmpeg/

    module load gcc/10.3.0
    module load doxygen/1.9.6
    git checkout n5.1.2

    module load freetype/2.12.1
    module load yasm/1.3.0

    ./configure --prefix=$PREFIX   --enable-nonfree --enable-libfreetype --enable-shared --enable-pic

    make -j20
    make install
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PREFIX/lib   make check

