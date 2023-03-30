ANGSD/0.940-stable
==================

<https://github.com/ANGSD/angsd>

Used under license:
GPL v2


Structure creating script (makeroom_ANGSD_0.940-stable.sh) moved to /sw/bioinfo/ANGSD/makeroom_0.940-stable.sh

    makeroom.sh "-f" "-t" "ANGSD" "-v" "0.940-stable" "-w" "https://github.com/ANGSD/angsd" "-l" "GPL v2" "-d" "Software for analyzing next generation sequencing data"
    ./makeroom_ANGSD_0.940-stable.sh

    source /sw/bioinfo/ANGSD/SOURCEME_ANGSD_0.940-stable
    cd $SRCDIR
    wget https://github.com/ANGSD/angsd/releases/download/0.940/angsd0.940.tar.gz
    tar xf angsd0.940.tar.gz

    module load gcc/10.3.0
    module load bzip2/1.0.8
    module load xz/5.2.6
    module load zlib/1.2.12
    module load bioinfo-tools
    module load htslib/1.17

Build using the `htslib/1.17` module, already available.

    cd angsd
    make HTSSRC=systemwide

See if these parts are still required.

    mkdir $PREFIX/bin
    cp -av angsd $PREFIX/bin/
    cp -ravp R doc scripts $PREFIX/

Copy over executables from `misc/` directory, and fix python `#!` line.

    mkdir $PREFIX/misc
    find misc -type f -perm /1 -exec cp -av {} $PREFIX/misc/ \;
    sed -i 's,/usr/bin/python,/usr/bin/env python,' $PREFIX/misc/*.py

Check RPATH.

    cd $PREFIX/bin
    module purge
    ldd angsd
    cd ../misc
    ldd realSFS

Make sure `$modroot/bin` and `$modroot/misc` are added to PATH in the mf file.
Also ad :
