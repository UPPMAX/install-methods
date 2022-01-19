tesseract/4.1.3
===============

<https://tesseract-ocr.github.io>

Used under license:
Apache-2.0


Structure creating script (makeroom_tesseract_4.1.3.sh) moved to /sw/apps/tesseract/makeroom_4.1.3.sh

See after main installation for data installation.

LOG
---

Need to build separate rackham and snowy/irma/bianca versions as special instructions are used.

This requires ICU library and leptonica tool, both of which I install directly
into its PREFIX. Also it requires several already-available modules.


    # start here for rackham
    makeroom.sh -t tesseract -v 4.1.3 -w https://tesseract-ocr.github.io -l "Apache-2.0" -d "Open-source optical character recognition (OCR) engine" -c apps
    ./makeroom_tesseract_4.1.3.sh 

    # restart here for snowy/irma/bianca
    source /sw/apps/tesseract/SOURCEME_tesseract_4.1.3 && cd $SRCDIR
    module load git/2.34.1
    module load gcc/9.3.0
    module load libwebp/1.2.0
    module load OpenJPEG/2.3.0
    module load giflib/5.1.4
    module load libcurl/7.45.0

    # Leptonica http://www.leptonica.org/
    # build into our PREFIX

    [[ -f leptonica-1.82.0.tar.gz ]] || wget http://www.leptonica.org/source/leptonica-1.82.0.tar.gz
    [[ -d leptonica-1.82.0 ]] && rm -rf leptonica-1.82.0/
    tar xf leptonica-1.82.0.tar.gz 
    cd leptonica-1.82.0/
    ./configure --prefix=$PREFIX
    make -j 8
    make check
    make install
    cd $SRCDIR

    # ICU https://icu.unicode.org/download/69
    # unpack the Fedora x64 binary dev package and rsync into our PREFIX

    [[ -f icu4c-69_1-Fedora32-x64.tgz ]] || wget https://github.com/unicode-org/icu/releases/download/release-69-1/icu4c-69_1-Fedora32-x64.tgz
    [[ -d icu ]] && rm -rf icu
    tar xf icu4c-69_1-Fedora32-x64.tgz
    cd icu/usr/local
    rsync -Pa * $PREFIX/
    cd $SRCDIR

    # Now for tesseract itself

    [[ -f 4.1.3.tar.gz ]] || wget https://github.com/tesseract-ocr/tesseract/archive/refs/tags/4.1.3.tar.gz
    [[ -d tesseract-4.1.3 ]] && rm -rf tesseract-4.1.3
    tar xf 4.1.3.tar.gz 
    cd tesseract-4.1.3/
    ./autogen.sh 

    # pick up the pkgconfig directory from the ICU installation, and point to the PREFIX for leptonica

    export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH
    LIBLEPT_HEADERSDIR=$PREFIX/include ./configure --prefix=$PREFIX --with-extra-libraries=$PREFIX/lib
    make -j8
    make check
    make install

Now build for snowy/irma/bianca. Log into snowy login node, then

    source /sw/apps/tesseract/SOURCEME_tesseract_4.1.3 && cd $VERSIONDIR
    rm -f snowy irma bianca
    mkdir snowy
    ln -s snowy irma
    ln -s snowy bianca



Install training data
---------------------

On rackham.

We install the default 'fast' data, users can install the 'best' data for themselves.  No need to duplicate, so symlink the snowy to the rackham copy.

    source /sw/apps/tesseract/SOURCEME_tesseract_4.1.3 && cd $SRCDIR
    mkdir traineddata
    wget -O traineddata_fast_4.1.0.tar.gz https://github.com/tesseract-ocr/tessdata_fast/archive/refs/tags/4.1.0.tar.gz
    tar xf traineddata_fast_4.1.0.tar.gz
    cd tessdata_fast-4.1.0
    rm -rf $PREFIX/share/tessdata/*
    rsync -Pa * $PREFIX/share/tessdata/

    cd $VERSIONDIR/snowy/share
    rm -rf tessdata
    ln -s ../../rackham/share/tessdata .


