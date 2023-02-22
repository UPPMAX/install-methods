doxygen/1.9.6
=============

<https://www.doxygen.nl/>

Used under license:
GPL v2
<https://www.doxygen.nl/manual/index.html#a628_license>

Structure creating script (makeroom_doxygen_1.9.6.sh) moved to /sw/apps/doxygen/makeroom_1.9.6.sh

The precompiled binaries don't work, C library is too new.  Build from source.


LOG
---

We will try to build the GUI wizard too.

    TOOL=doxygen
    VERSION=1.9.6


    makeroom.sh -f -c apps -t ${TOOL} -v ${VERSION} -w https://www.doxygen.nl/ -l "GPL v2" -L https://www.doxygen.nl/manual/index.html#a628_license -d "Doxygen is the de facto standard tool for generating documentation from annotated C++ sources, but it also supports other popular programming languages such as C, Objective-C, C#, PHP, Java, Python, IDL (Corba, Microsoft, and UNO/OpenOffice flavors), Fortran, and to some extent D. Doxygen also supports the hardware description language VHDL."

    ./makeroom_${TOOL}_${VERSION}.sh 

    source /sw/apps/${TOOL}/SOURCEME_${TOOL}_${VERSION}
    cd $SRCDIR

    [[ -f ${TOOL}-${VERSION}.src.tar.gz ]] || wget https://www.doxygen.nl/files/${TOOL}-${VERSION}.src.tar.gz
    md5sum ${TOOL}-${VERSION}.src.tar.gz 

The MD5 sum is provided as text on the download page, (5.0MB, md5: 5f7ab15c8298d013c5ef205a4febc7b4).

    [[ -d ${TOOL}-${VERSION} ]] && rm -rf ${TOOL}-${VERSION}
    tar xf ${TOOL}-${VERSION}.src.tar.gz 

    cd ${TOOL}-${VERSION}/

    mkdir build
    cd build

    module load cmake/3.22.2
    module load texlive/2022-09-18
    module load gcc/10.3.0
    module load perl/5.26.2
    module load perl_modules/5.26.2
    module load python/3.9.5

I don't know if we need all these modules, but load them all just the same.

    cmake -G "Unix Makefiles" -Dbuild_wizard=YES -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX ..

    make
    make install

Can't build the docs, but we can download them!

    wget https://www.doxygen.nl/files/doxygen_manual-${VERSION}.pdf.zip
    wget https://www.doxygen.nl/files/doxygen_manual-${VERSION}.chm.zip
    unzip doxygen_manual-${VERSION}.chm.zip 
    unzip doxygen_manual-${VERSION}.pdf.zip 
    mkdir $PREFIX/doc
    mv doxygen_manual-${VERSION}.chm doxygen_manual-${VERSION}.pdf $PREFIX/doc

