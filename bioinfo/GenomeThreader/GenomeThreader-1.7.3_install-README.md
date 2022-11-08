GenomeThreader/1.7.3
========================

<http://genomethreader.org/>

Used under license:
Custom AS IS
<https://genomethreader.org/download.html>

Structure creating script (makeroom_GenomeThreader_1.7.3.sh) moved to /sw/bioinfo/GenomeThreader/makeroom_1.7.3.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-s" "annotation" "-t" "GenomeThreader" "-v" "1.7.3" "-w" "http://genomethreader.org/" "-l" "Custom AS IS" "-L" "https://genomethreader.org/download.html" "-d" "software tool to compute gene structure predictions"
    ./makeroom_GenomeThreader_1.7.3.sh

    source SOURCEME_GenomeThreader_1.7.3 && cd ${SRCDIR}
    wget http://genomethreader.org/distributions/gth-${VERSION}-Linux_x86_64-64bit.tar.gz
    tar xf gth-${VERSION}-Linux_x86_64-64bit.tar.gz 
    rmdir $PREFIX && mv gth-${VERSION}-Linux_x86_64-64bit $PREFIX
    cd $PREFIX
    ./gth --version

Uh-oh!!! turns out the prebuilt version 1.7.3 needs a later OS version than we have, by requiring GLIBC_2.27.  I've written the developer about it, we'll see what happens.
