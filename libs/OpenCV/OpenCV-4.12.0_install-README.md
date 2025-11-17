OpenCV/4.12.0
========================

<https://github.com/opencv/opencv>

Used under license:
Apache 2.0


Structure creating script (makeroom_OpenCV_4.12.0.sh) moved to /sw/libs/OpenCV/makeroom_4.12.0.sh

LOG
---

    makeroom.sh -t OpenCV -v 4.12.0 -c libs -w https://github.com/opencv/opencv -d "Computer vision library" -l "Apache 2.0" 
    ./makeroom_OpenCV_4.12.0.sh 
    source /sw/libs/OpenCV/SOURCEME_OpenCV_4.12.0 && cd $SRCDIR

    ml git/2.44.0
    ml cmake/3.26.3
    ml OpenJPEG/2.5.0
    ml libwebp/1.3.0
    ml Eigen/3.3.4
    ml openblas/0.3.29
    ml tesseract/4.1.3
    ml GDAL/3.7.2
    ml python/3.12.7
    ml freetype/2.12.1
    ml java/OpenJDK_17+35
    ml FFmpeg/5.1.2
    ml gcc/13.3.0
    git clone https://github.com/opencv/opencv.git
    git clone https://github.com/opencv/opencv_contrib.git
    mkdir build
    cd build

    cmake \
    -D BUILD_TIFF=ON \
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=$PREFIX \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON  \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules/  \
    -D BUILD_opencv_xfeatures2d=ON \
    -DCMAKE_POLICY_DEFAULT_CMP0074=NEW \
    -D BUILD_opencv_python2=OFF \
    -D BUILD_opencv_python3=ON \
    -D PYTHON_VERSION=312 \
    -D PYTHON_DEFAULT_EXECUTABLE=$(which python3.12) \
    -D PYTHON3_EXECUTABLE=$(which python3.12) \
    -D PYTHON3_INCLUDE_DIR=$PYTHON_ROOT/include/python3.12 \
         ../opencv/

     make -j20
     make install
