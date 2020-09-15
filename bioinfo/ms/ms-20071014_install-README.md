ms/20071014
===========

<http://home.uchicago.edu/~rhudson1/source/mksamples.html>

Used under license:
open source

Structure creating script (makeroom_ms_20071014.sh) moved to /sw/bioinfo/ms/makeroom_20071014.sh

LOG
---

    TOOL=ms
    VERSION=20071014
    cd /sw/bioinfo
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w http://home.uchicago.edu/~rhudson1/source/mksamples.html -l "open source" -d "Generating samples under a Wright-Fisher neutral model" 
    ./makeroom_${TOOL}_{VERSION}.sh 
    cd ${TOOL}
    source SOURCEME_${TOOL}_{VERSION} 
    cd $VERSION
    cd src
    module load gcc/9.3.0

Rsync over ms.tar.gz and msHOT.tar.gz from office comp, and build with the default `drand48()` random number generator.

    tar xzf ms.tar.gz 
    cd msdir/
    gcc -o ms -O3 ms.c streec.c rand1.c -lm
    gcc -o sample_stats sample_stats.c tajd.c -lm
    cp -av ms sample_stats col1 R_example_* msdoc.pdf readms.output.R $PREFIX/
    cd ..

Build msHOT.

    mkdir msHOTdir
    cd msHOTdir
    tar xzvf ../msHOT.tar.gz 
    gcc -o msHOT -O3 msGCHOT.c streecGCHOT.c rand1.c -lm
    cp -av msHOT $PREFIX/
