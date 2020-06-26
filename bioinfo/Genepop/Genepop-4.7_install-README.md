Genepop/4.7
========================

<https://kimura.univ-montp2.fr/~rousset/Genepop.htm>

Used under license:
CeCILL (GPL compatible)

Structure creating script (makeroom_Genepop_4.7.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Genepop/makeroom_4.7.sh

LOG
---

    TOOL=Genepop
    VERSION=4.7
    makeroom.sh -t "Genepop" -v "4.7" -w "https://kimura.univ-montp2.fr/~rousset/Genepop.htm" -l "CeCILL \(GPL compatible\)" -s "misc" -d "population genetics software package" -f
    ./makeroom_Genepop_4.7.sh
    cd /sw/bioinfo/$TOOL
    source SOURCEME_${TOOL}_${VERSION} 
    cd $VERSION/src

    wget http://kimura.univ-montp2.fr/~rousset/sources.tar.gz
    tar xzf sources.tar.gz 
    module load gcc/9.3.0
    g++ -o Genepop *.cpp -O3

Now compile the LINKDOS program, written in pascal, using fpc/3.0.4, Free Pascal Compiler.

    /sw/comp/fpc/3.0.4/rackham/bin/fpc LINKDOS.pas 

Copy both `Genepop` and LINKDOS to the `$PREFIX` directory.

    cp -av Genepop LINKDOS $PREFIX/
