IsoQuant/3.3.1
==============

<https://github.com/ablab/IsoQuant>

Used under license:
Custom
<https://raw.githubusercontent.com/ablab/IsoQuant/master/LICENSE>

Structure creating script (makeroom_IsoQuant_3.3.1.sh) moved to /sw/bioinfo/IsoQuant/makeroom_3.3.1.sh

LOG
---

    makeroom.sh -t IsoQuant -v 3.3.1 -d "Transcript discovery and quantification with long RNA reads (Nanopores and PacBio)" -l Custom -L https://raw.githubusercontent.com/ablab/IsoQuant/master/LICENSE -s annotation
    ./makeroom_IsoQuant_3.3.1.sh 
    source /sw/bioinfo/IsoQuant/SOURCEME_IsoQuant_3.3.1 && cd $SRCDIR
    wget https://github.com/ablab/IsoQuant/releases/download/v3.3.1/IsoQuant-3.3.1.tar.gz
    tar xvf IsoQuant-3.3.1.tar.gz 
    cd IsoQuant-3.3.1/

Install python requirements, including packaging: see <https://github.com/ablab/IsoQuant/issues/106>

    ml python/3.10.8
    virtualenv $PREFIX/venv
    source $PREFIX/venv/bin/activate

    pip3 install -r requirements.txt
    pip3 install packaging

Now move the rest of tarball contents to $PREFIX

    mv -v * $PREFIX/
    cd ..
    rmdir IsoQuant-3.3.1/
    cd $PREFIX

Adjust `#!` line for isoquant.py to point to the python within the virtualenv
after ensuring python3 is coming from the virtualenv.

    which python3
    sed -i "1i #!$(which python3)" isoquant.py 

Lift other executables from the virtualenv in case their presence is expected.

    ln -s $PREFIX/venv/bin/{faidx,gffutils-cli} .

Add the load of dependencies to the mf file. Note (as always with virtualenv)
that python is not a dependency because scripts use the python from the
virtualenv.

    cd $TOOLDIR/mf
    vi 3.3.1

    depends-on samtools/1.17
    depends-on minimap2/2.24-r1122
    depends-on star/2.7.9a'

Finish up.

    cd $TOOLDIR
    ./IsoQuant-3.3.1_post-install.sh 

Test using my nonprivileged user.

    ml bioinfo-tools IsoQuant/3.3.1
    isoquant.py --test

It passes!
