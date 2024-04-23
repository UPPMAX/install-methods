METAL/2020-05-05
================

<https://github.com/statgen/METAL>

<http://csg.sph.umich.edu/abecasis/Metal/>

Used under license:
open source

Plus mersene twister license at <https://github.com/statgen/METAL?tab=License-1-ov-file#readme>


Structure creating script (makeroom_METAL_2020-05-05.sh) moved to /sw/bioinfo/METAL/makeroom_2020-05-05.sh

LOG
---

    makeroom.sh -f -t METAL -v 2020-05-05 -s misc -w https://github.com/statgen/METAL -l "open source" -d "facilitate meta-analysis of large datasets, such as several whole genome scans"
    ./makeroom_METAL_2020-05-05.sh 
    source /sw/bioinfo/METAL/SOURCEME_METAL_2020-05-05
    cd $SRCDIR
    wget https://github.com/statgen/METAL/archive/refs/tags/2020-05-05.tar.gz
    tar xf 2020-05-05.tar.gz 
    cd METAL-2020-05-05/
    ml zlib/1.3
    ml gcc/12.3.0
    ml binutils/2.41
    ml cmake/3.26.3
    echo $PREFIX

The build does not adequately recognize -DCMAKE_INSTALL_PREFIX but I'll use it just the same.


    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Release  -DCMAKE_POLICY_DEFAULT_CMP0074=NEW 
    make
    make test
    make install
    ml purge
    ldd bin/metal 
    bin/metal
    cp -av bin $PREFIX


Make sure $modroot/bin is added to PATH.
