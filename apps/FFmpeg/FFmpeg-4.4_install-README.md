FFmpeg/4.4
==========

<https://ffmpeg.org/>

Used under license:
LGPL v2.1+, compiled with --enable-nonfree
https://ffmpeg.org/legal.html

Structure creating script (makeroom_FFmpeg_4.4.sh) moved to /sw/apps/FFmpeg/makeroom_4.4.sh

LOG
---

Build with the non-free features, and also with shared libraries.

Along the way, build and installed yasm/1.3.0 to enable assembly code.

    TOOL=FFmpeg
    VERSION=4.4
    cd /sw/apps
    makeroom.sh -f -c apps -t $TOOL -v $VERSION -w https://ffmpeg.org/ -d "A complete, cross-platform solution to record, convert and stream audio and video" -l "LGPL v2.1+, compiled with --enable-nonfree"
    ./makeroom_FFmpeg_4.4.sh 
    cd FFmpeg/
    source SOURCEME_FFmpeg_4.4 
    cd $SRCDIR
    module load git/2.28.0
    git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
    cd ffmpeg/
    module load gcc/9.3.0
    module load doxygen/1.8.11
    git checkout n4.4
    module load yasm/1.3.0
    module load freetype/2.10.1
    ./configure --prefix=$PREFIX   --enable-nonfree --enable-libfreetype --enable-shared --enable-pic
    make -j20
    make install
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PREFIX/lib   make check

