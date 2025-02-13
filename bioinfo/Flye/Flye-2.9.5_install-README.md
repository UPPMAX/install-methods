Flye/2.9.5
==========

<https://github.com/mikolmogorov/Flye>

Used under license:
BSD-3-Clause
<https://raw.githubusercontent.com/mikolmogorov/Flye/refs/heads/flye/LICENSE>

Structure creating script (makeroom_Flye_2.9.5.sh) moved to /sw/bioinfo/Flye/makeroom_2.9.5.sh

LOG
---

Build inside a virtualenv.

    makeroom.sh -f -t Flye -v 2.9.5 -d  "de novo assembler for single molecule sequencing reads\, such as those produced by PacBio and Oxford Nanopore Technologies" -l "BSD-3-Clause" -L "https://raw.githubusercontent.com/mikolmogorov/Flye/refs/heads/flye/LICENSE" -w https://github.com/mikolmogorov/Flye
    ./makeroom_Flye_2.9.5.sh 
    source /sw/bioinfo/Flye/SOURCEME_Flye_2.9.5
    cd $SRCDIR
    wget https://github.com/mikolmogorov/Flye/archive/refs/tags/2.9.5.tar.gz
    tar xf 2.9.5.tar.gz 
    cd $PREFIX
    ml python/3.10.8
    virtualenv venv
    source venv/bin/activate
    ml -python
    ml gcc/12.3.0
    cd $SRCDIR
    cd Flye-2.9.5/
    pip install .

    Now lift out to $PREFIX/bin

    cd $PREFIX
    ll venv/bin/
    mkdir bin
    cd bin
    ln -s ../venv/bin/flye* .
    file -L *
    cd $TOOLDIR/mf
    vi 2.9.5 
    cd ..
    ./Flye-2.9.5_post-install.sh 
    history >> Flye-2.9.5_install-README.md 
