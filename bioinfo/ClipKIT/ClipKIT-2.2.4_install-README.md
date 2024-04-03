ClipKIT/2.2.4
=============

<https://github.com/JLSteenwyk/ClipKIT>

Used under license:
MIT


Structure creating script (makeroom_ClipKIT_2.2.4.sh) moved to /sw/bioinfo/ClipKIT/makeroom_2.2.4.sh

LOG
---

Easy install from PyPi into a venv.

    makeroom.sh -c bioinfo -s alignment -t ClipKIT -v 2.2.4 -w https://github.com/JLSteenwyk/ClipKIT -l MIT -d "a multiple sequence alignment-trimming algorithm for accurate phylogenomic inference"
    ./makeroom_ClipKIT_2.2.4.sh 
    source /sw/bioinfo/ClipKIT/SOURCEME_ClipKIT_2.2.4

Work directly within PREFIX.

    cd $PREFIX
    ml python/3.11.8
    virtualenv venv
    source venv/bin/activate
    which python3
    which pip3
    ml -python

Make sure 2.2.4, the latest on github, is also on PyPi.

    pip3 install clipkit==
    pip3 install clipkit==2.2.4
    ll venv/bin/
    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/clipkit .
    deactivate

Add $modroot/bin to PATH.

    cd $TOOLDIR/mf
    vi 2.2.4 

Wrap up.

    cd $TOOLDIR
    ./ClipKIT-2.2.4_post-install.sh 

