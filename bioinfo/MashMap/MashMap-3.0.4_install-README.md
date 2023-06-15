MashMap/3.0.4
=============

<https://github.com/marbl/MashMap>

Used under license:
Mixed
<https://raw.githubusercontent.com/marbl/MashMap/master/LICENSE.txt>

Structure creating script (makeroom_MashMap_3.0.4.sh) moved to /sw/bioinfo/MashMap/makeroom_3.0.4.sh

LOG
---

Provides prebuilt binaries, but it must use local libraries.  Set RPATH so this works.
It requires a later gcc than our standard 10.3.0, so use 12.3.0.

    makeroom.sh -t MashMap -v 3.0.4 -c bioinfo -s alignment -w https://github.com/marbl/MashMap -d "A fast approximate aligner for long DNA sequences" -k "long-read Oxford-Nanopore PacBio" -l Mixed -L https://raw.githubusercontent.com/marbl/MashMap/master/LICENSE.txt
    ./makeroom_MashMap_3.0.4.sh 
    source /sw/bioinfo/MashMap/SOURCEME_MashMap_3.0.4
    cd $SRCDIR
    wget https://github.com/marbl/MashMap/releases/download/v3.0.4/mashmap-Linux64-v3.0.4.tar.xz
    tar xf mashmap-Linux64-v3.0.4.tar.xz 
    rmdir $PREFIX && mv mashmap-Linux64-v3.0.4 $PREFIX
    cd $PREFIX

    ml gsl/2.7
    ml openblas/0.3.21
    ml gcc/12.3.0

These all add to LD_LIBRARY_PATH, so make sure this is enough, and use that to set the RPATH

    ldd mashmap
    ldd mashmap-align

    ml patchelf/0.10
    patchelf --print-rpath mashmap
    patchelf --print-rpath mashmap-align

Nothing set.

    patchelf --set-rpath "$LD_LIBRARY_PATH" mashmap
    patchelf --set-rpath "$LD_LIBRARY_PATH" mashmap-align 
    ./mashmap
    ./mashmap-align 
