PLplot/5.15.0-old_wxWidgets
===========================

<http://plplot.sourceforge.net/>

Used under license:
LGPL v2

Structure creating script (makeroom_PLplot_5.15.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/PLplot/makeroom_5.15.0.sh

LOG
---

    TOOL=PLplot
    VERSION=5.15.0
    cd /sw/libs
    makeroom.sh -t ${TOOL} -v ${VERSION} -w http://plplot.sourceforge.net/ -c libs -l "LGPL v2" -d "a cross-platform software package for creating scientific plots whose (UTF-8) plot symbols and text are limited in practice only by what Unicode-aware system fonts are installed on a user's computer" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd PLplot/
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    echo $PREFIX
    cd src
    wget https://downloads.sourceforge.net/project/plplot/plplot/${VERSION}%20Source/plplot-${VERSION}.tar.gz
    tar xzf plplot-${VERSION}.tar.gz 
    cd plplot-${VERSION}/

This requires cmake 3.  A lot of pulling of hair and gnashing of teeth, but
finally we have a fairly complete installation.  This involved installing new
modules `Qhull/2019.1`, `SHAPELIB/1.5.0` and `wxWidgets/3.1.3-gtk3`.  I also
chose to build with `gcc/6.3.0` which I also used to build Qhull, SHAPELIB and
wxWidgets.  Also, load recent java, perl and python.

    module load cmake/3.13.2
    module load gcc/6.3.0
    module load java/sun_jdk1.8.0_151
    module load python/3.7.2
    module load perl/5.26.2
    module load perl_modules/5.26.2
    module load swig/3.0.7
    module load Qhull/2019.1
    module load libharu/2.3.0
    module load wxWidgets/3.1.3-gtk3
    module load cairo/1.17.2
    module load SHAPELIB/1.5.0

    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DBUILD_TEST=ON -DENABLE_python=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O3' -DOLD_WXWIDGETS:BOOL=ON -Dhpdf_LIBRARY=$LIBHARU_ROOT/lib/libhpdf.so -Dhpdf_INCLUDE_DIR=$LIBHARU_ROOT/include -DSHAPELIB_INCLUDE_DIR:PATH=$SHAPELIB_ROOT/include -DSHAPELIB_LIBRARY:PATH=$SHAPELIB_ROOT/lib/libshp.so

    make -j20
    make install

After running ctest, found failures with Lua, see below.  Not tracking those
down, we can live with that.

    rackham5: /sw/libs/PLplot/5.15.0/src/plplot-5.15.0/build $ ctest
    Test project /sw/libs/PLplot/5.15.0/src/plplot-5.15.0/build
          Start  1: examples_c
     1/25 Test  #1: examples_c .......................   Passed   18.15 sec
          Start  2: examples_cxx
     2/25 Test  #2: examples_cxx .....................   Passed   18.35 sec
          Start  3: examples_fortran
     3/25 Test  #3: examples_fortran .................   Passed    9.01 sec
          Start  4: examples_java
     4/25 Test  #4: examples_java ....................   Passed   22.61 sec
          Start  5: examples_python
     5/25 Test  #5: examples_python ..................   Passed   31.26 sec
          Start  6: examples_tcl
     6/25 Test  #6: examples_tcl .....................   Passed   26.03 sec
          Start  7: examples_lua
     7/25 Test  #7: examples_lua .....................***Failed    0.09 sec
          Start  8: examples_pdfcairo
     8/25 Test  #8: examples_pdfcairo ................   Passed   21.29 sec
          Start  9: examples_pngcairo
     9/25 Test  #9: examples_pngcairo ................   Passed   25.51 sec
          Start 10: examples_pscairo
    10/25 Test #10: examples_pscairo .................   Passed   37.91 sec
          Start 11: examples_epscairo
    11/25 Test #11: examples_epscairo ................   Passed   38.59 sec
          Start 12: examples_svgcairo
    12/25 Test #12: examples_svgcairo ................   Passed   23.49 sec
          Start 13: examples_epsqt
    13/25 Test #13: examples_epsqt ...................   Passed   45.80 sec
          Start 14: examples_pdfqt
    14/25 Test #14: examples_pdfqt ...................   Passed   31.76 sec
          Start 15: examples_bmpqt
    15/25 Test #15: examples_bmpqt ...................   Passed   27.99 sec
          Start 16: examples_jpgqt
    16/25 Test #16: examples_jpgqt ...................   Passed   27.61 sec
          Start 17: examples_pngqt
    17/25 Test #17: examples_pngqt ...................   Passed   34.15 sec
          Start 18: examples_ppmqt
    18/25 Test #18: examples_ppmqt ...................   Passed   28.23 sec
          Start 19: examples_tiffqt
    19/25 Test #19: examples_tiffqt ..................   Passed   28.89 sec
          Start 20: examples_svgqt
    20/25 Test #20: examples_svgqt ...................   Passed   46.30 sec
          Start 21: examples_pdf
    21/25 Test #21: examples_pdf .....................   Passed   19.95 sec
          Start 22: examples_ps
    22/25 Test #22: examples_ps ......................   Passed   14.63 sec
          Start 23: examples_psc
    23/25 Test #23: examples_psc .....................   Passed   14.98 sec
          Start 24: examples_xfig
    24/25 Test #24: examples_xfig ....................   Passed   15.03 sec
          Start 25: examples_compare
    25/25 Test #25: examples_compare .................   Passed   10.17 sec

    96% tests passed, 1 tests failed out of 25

    Total Test time (real) = 617.96 sec

    The following tests FAILED:
          7 - examples_lua (Failed)
    Errors while running CTest


