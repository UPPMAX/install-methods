Platanus-allee/2.2.2
========================

<http://platanus.bio.titech.ac.jp/platanus2>

Used under license:
GPL3


Structure creating script (makeroom_Platanus-allee_2.2.2.sh) moved to /sw/bioinfo/Platanus-allee/makeroom_2.2.2.sh

LOG
---

In short, download source bundle, turn optimisation down from -O3 to -O2, and it seems to be OK.  No need to use its minimap2 build, the dependencies do not seem strong.

    /home/matpiq/install-methods/makeroom.sh "-f" "-t" "Platanus-allee" "-v" "2.2.2" "-s" "assembly" "-w" "http://platanus.bio.titech.ac.jp/platanus2" "-d" "Platanus-allee is a de novo haplotype assembler (phasing tool), which assembles each haplotype sequence in a diploid genome" "-l" "GPL3"
    ./makeroom_Platanus-allee_2.2.2.sh
    cd /sw/bioinfo/Platanus-allee
    source SOURCEME_Platanus-allee_2.2.2
    cd $SRCDIR

There's a multithreading bug revealed by the test data... attempted to get around it by backing off the optimisation, but it persists.

    wget -O Platanus_allee_v${VERSION}_Linux_x86_64.tgz http://platanus.bio.titech.ac.jp/?ddownload=348
    tar xf Platanus_allee_v2.2.2_Linux_x86_64.tgz 
    wget -O Platanus_allee_v${VERSION}_Linux_x86_64.tgz http://platanus.bio.titech.ac.jp/?ddownload=431
    tar xf Platanus_allee_v2.2.2_Linux_x86_64.tgz 

    cd Platanus_allee_v2.2.2
    vi Makefile 

Change -O3 to -O2.

    make clean
    make

    cp -av README.md $PREFIX
    cp -av platanus_allee $PREFIX


The test suite doesn't work, but doesn't work better with -O2.  The Platanus-allee website indicates a known multithreading bug.  Tell users not to use multithreading.
