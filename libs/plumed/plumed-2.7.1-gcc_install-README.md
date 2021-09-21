plumed/2.7.1-gcc
========================

<https://www.plumed.org>

Used under license:
LGPL-3.0


Structure creating script (makeroom_plumed_2.7.1-gcc.sh) moved to /sw/libs/plumed/makeroom_2.7.1-gcc.sh

LOG
---

    /home/pmitev/GIT/install-methods/makeroom.sh -t "plumed" -v "2.7.1-gcc" -c "libs" -w "https://www.plumed.org" -l "LGPL-3.0" -f"
    ./makeroom_plumed_2.7.1-gcc.sh
    source /sw/libs/plumed/SOURCEME_plumed_2.7.1-gcc && cd $TOOLDIR/$VERSION
    tar xvf plumed-src-2.7.1.tgz -C src-rackham/
    cd src-rackham/plumed-2.7.1
    module load gcc/7.3.0 openmpi/3.1.0
    ./configure --prefix=$TOOLDIR/$VERSION/rackham
    make -j 10
    make install

