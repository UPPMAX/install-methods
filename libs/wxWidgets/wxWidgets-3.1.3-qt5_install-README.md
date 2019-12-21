wxWidgets/3.1.3-qt5
====================

<https://www.wxwidgets.org/>

Used under license:
wxWindows Library Licence 3.1, https://github.com/wxWidgets/wxWidgets/blob/master/docs/licence.txt

Structure creating script (makeroom_wxWidgets_3.1.3-qt5.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/libs/wxWidgets/makeroom_3.1.3-qt5.sh

LOG
---

Had to take over `/sw/libs/wxWidgets` directory from `pontusf-test`.

    TOOL=wxWidgets
    TOOLVERSION=3.1.3
    TOOLKIT=qt5
    TOOLKIT_OPTION="--with-qt"
    VERSION=${TOOLVERSION}-${TOOLKIT}
    cd /sw/libs
    mkdir $TOOL/
    cd $TOOL/
    makeroom.sh -f -t ${TOOL} -v ${VERSION} -w https://www.wxwidgets.org/ -c libs -d "C++ library that lets developers create applications for Windows, macOS, Linux and other platforms with a single code base, compiled with support for ${TOOLKIT}" -l "wxWindows Library Licence 3.1, https://github.com/wxWidgets/wxWidgets/blob/master/docs/licence.txt"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    cd src/
    wget https://github.com/${TOOL}/${TOOL}/releases/download/v${TOOLVERSION}/${TOOL}-${TOOLVERSION}.tar.bz2
    tar xjf ${TOOL}-${TOOLVERSION}.tar.bz2 
    cd ${TOOL}-${TOOLVERSION}/
    echo $PREFIX
    ./configure $TOOLKIT_OPTION --prefix=$PREFIX
    make -j20
    make install

Use the mf from zlib/1.2.11.  There is a `bin/`, `include/` and shared libraries under `lib/` but no static libraries, and no `pkgconfig`.
