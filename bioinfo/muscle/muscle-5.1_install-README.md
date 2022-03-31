muscle/5.1
==========

<https://github.com/rcedgar/muscle>

Used under license:
GPL v3


Structure creating script (makeroom_muscle_5.1.sh) moved to /sw/bioinfo/muscle/makeroom_5.1.sh

LOG
---

Provides precompiled x86_64 binaries, but I'll build from source with gcc/10.3.0. Can't compile with gcc/11.2.0 because ELF version is 5 where el7 only handles 2 3 4.
Unfortunately no `make test` or `make check`.

    makeroom.sh -f -t muscle -v 5.1  -w https://github.com/rcedgar/muscle -l "GPL v3" -d "Multiple sequence alignment with top benchmark scores scalable to thousands of sequences. Generates replicate alignments, enabling assessment of downstream analyses such as trees and predicted structures."
    ./makeroom_muscle_5.1.sh 
    source /sw/bioinfo/muscle/SOURCEME_muscle_5.1 && cd $SRCDIR
    wget https://github.com/rcedgar/muscle/releases/download/v5.1/muscle5.1.linux_intel64
    wget https://github.com/rcedgar/muscle/archive/refs/tags/v5.1.tar.gz
    file muscle5.1.linux_intel64 
    chmod +x muscle5.1.linux_intel64 
    ./muscle5.1.linux_intel64 
    tar xf v5.1.tar.gz 
    cd muscle-5.1/src
    ml gcc/10.3.0 
    make -j20
    cp -av Linux/muscle $PREFIX

Add `$modroot` to `PATH`.
