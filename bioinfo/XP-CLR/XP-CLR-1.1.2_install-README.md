XP-CLR/1.1.2
========================

<https://github.com/hardingnj/xpclr>

Used under license:
MIT

TOOL=XP-CLR
VERSION=1.1.2


Structure creating script (makeroom_XP-CLR_1.1.2.sh) moved to /sw/bioinfo/XP-CLR/makeroom_1.1.2.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t ${TOOL} -s misc -v ${VERSION} -w https://github.com/hardingnj/xpclr -d "Code to compute xp-clr values as per Chen, Patterson & Reich 2010" -l "MIT"
    ./makeroom_XP-CLR_1.1.2.sh
    source /sw/bioinfo/XP-CLR/SOURCEME_XP-CLR_1.1.2 && cd $TOOLDIR
    cd $SRCDIR
    rmdir $PREFIX
    ml git
    git clone https://github.com/hardingnj/xpclr.git
    mv xpclr $PREFIX
    cd $PREFIX
    ml python/3.7.2
    virtualenv --system-site-packages $PREFIX/venv
    venv/bin/python setup.py install
    venv/bin/python -m pip install scikit-allel==1.2
#Test
    export PYTHONPATH=$PREFIX/venv/lib/python3.7/site-packages
    venv/bin/xpclr
#link to bin/
    cd bin/
    ln -s $PREFIX/venv/bin/xpclr .

# In mf file
    prepend-path    PATH                $modroot/bin
    prepend-path    PYTHONPATH          $modroot/venv/lib/python3.7/site-packages
