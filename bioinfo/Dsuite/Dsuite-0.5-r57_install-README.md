Dsuite/0.5-r57
==============

<https://github.com/millanek/Dsuite>

Used under license:
open-source


Structure creating script (makeroom_Dsuite_0.5-r57.sh) moved to /sw/bioinfo/Dsuite/makeroom_0.5-r57.sh

LOG
---

    makeroom.sh -t Dsuite -v 0.5-r57 -c bioinfo -s phylogeny -w https://github.com/millanek/Dsuite -l "open-source" -d "Fast calculation of Patterson's D (ABBA-BABA) and the f4-ratio statistics across many populations/species"
    ./makeroom_Dsuite_0.5-r57.sh 

    source /sw/bioinfo/Dsuite/SOURCEME_Dsuite_0.5-r57
    cd $SRCDIR

    ml git/2.44.0
    ml gcc/13.2.0
    ml zlib/1.3
    git clone --recursive https://github.com/millanek/Dsuite

    cd Dsuite/

We need to include `<iterator>` since that is needed for older gcc versions, no longer included in `<regex>`.

    vi Dsuite_utils.h 

    make -j10

    mkdir $PREFIX/bin
    mv Build/Dsuite $PREFIX/bin/


There are python tools to set up in a venv.

    ml python/3.11.8
    cd $PREFIX
    virtualenv venv
    source venv/bin/activate
    ml -python
    which pip3
    which python3
    cd $SRCDIR
    cd Dsuite/utils
    pip3 install .

This installs `dtools.py` but not the parallelisation script `DtriosParallel` which we need to manage by hand.

    cp -av DtriosParallel $PREFIX/bin/
    cd $PREFIX/bin
    sed -i '1i#!'"$(which python3)" DtriosParallel 

Now lift out `dtools.py` from the venv.

    ln -s ../venv/bin/dtools.py .

Purge modules and see if everything can be found.

    ml purge
    deactivate
    ldd Dsuite

Install.

    cd $TOOLDIR
    ./Dsuite-0.5-r57_post-install.sh
