mapcaller/0.9.9.41
========================

<https://github.com/hsinnan75/MapCaller>

Used under license:
MIT


Structure creating script (makeroom_mapcaller_0.9.9.41.sh) moved to /sw/bioinfo/mapcaller/makeroom_0.9.9.41.sh

LOG
---

    makeroom.sh -t mapcaller -v 0.9.9.41 -c bioinfo -s alignment -w https://github.com/hsinnan75/MapCaller -d "An efficient and versatile approach for short-read alignment and variant detection in high-throughput sequenced genomes" -l MIT
    ./makeroom_mapcaller_0.9.9.41.sh 

    source /sw/bioinfo/mapcaller/SOURCEME_mapcaller_0.9.9.41
    cd $SRCDIR

    ml git/2.44.0
    git clone --recursive https://github.com/hsinnan75/MapCaller
    cd MapCaller/
    git reset --hard v0.9.9.41
    ml gcc/12.3.0
    ml boost/1.83.0-gcc12.3.0
    ml bzip2/1.0.8
    ml xz/5.2.6

    make
    ll bin/
    bin/MapCaller --help
    ./run_test.sh 
    cp -av bin $PREFIX/
