trf/4.10.0-rc.2
===============

<https://github.com/Benson-Genomics-Lab/TRF>

Used under license:
Gnu Afferoo GPL v3


Structure creating script (makeroom_trf_4.10.0-rc.2.sh) moved to /sw/bioinfo/trf/makeroom_4.10.0-rc.2.sh

There are tags for 2 4.10.0 release candidates. Use the tarball created for the latest of these.

LOG
---

    makeroom.sh -f -t trf -v 4.10.0-rc.2 -s alignment -w https://github.com/Benson-Genomics-Lab/TRF -l "Gnu Afferoo GPL v3" -d "program to locate and display tandem repeats in DNA sequences"
    ./makeroom_trf_4.10.0-rc.2.sh 
    source /sw/bioinfo/trf/SOURCEME_trf_4.10.0-rc.2
    cd $SRCDIR
    wget https://github.com/Benson-Genomics-Lab/TRF/archive/refs/tags/v4.10.0-rc.2.tar.gz
    tar xf v4.10.0-rc.2.tar.gz 
    cd TRF-4.10.0-rc.2/
    ml gcc/12.3.0
    ml binutils/2.41
    mkdir build
    make linux64
    cp -av build/trf4.10.0-rc.1.linux64.exe $PREFIX/trf4.10.0-rc.1.linux64
    cd $PREFIX
    ln -s trf4.10.0-rc.1.linux64 trf

Identical mf to 4.09.1.

Wrap up.

    ./trf-4.10.0-rc.2_post-install.sh
