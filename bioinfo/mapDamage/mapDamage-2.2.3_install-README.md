mapDamage/2.2.3
===============

<http://ginolhac.github.io/mapDamage/>

Used under license:
MIT


Structure creating script (makeroom_mapDamage_2.2.3.sh) moved to /sw/bioinfo/mapDamage/makeroom_2.2.3.sh

LOG
---

Its GSL requirement is for building RcppGSL, but we have R_packages which
already contains this, all built and ready to use. Also all the other R
packages it needs.


    makeroom.sh -f -t mapDamage -v 2.2.3 -w http://ginolhac.github.io/mapDamage/ -l MIT -d "tracking and quantifying damage patterns in ancient DNA sequences" -k "aDNA ancient-DNA"
    ./makeroom_mapDamage_2.2.3.sh 
    source /sw/bioinfo/mapDamage/SOURCEME_mapDamage_2.2.3 && cd $SRCDIR
    wget https://github.com/ginolhac/mapDamage/archive/refs/tags/2.2.3.tar.gz
    tar xf 2.2.3.tar.gz 

    ml python/3.12.7
    ml R_packages/4.3.1

    cd $PREFIX
    virtualenv mapDamage_venv
    mapDamage_venv/bin/pip3 install pysam

    cd $SRCDIR/mapDamage-2.2.3

    /sw/bioinfo/mapDamage/2.2.3/rackham/mapDamage_venv/bin/python3 setup.py install

    mkdir $PREFIX/bin
    cd $PREFIX/bin
    ln -s /sw/bioinfo/mapDamage/2.2.3/rackham/mapDamage_venv/bin/mapDamage .

