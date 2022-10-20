Platanus-allee/2.2.2
========================

<http://platanus.bio.titech.ac.jp/platanus2>

Used under license:
GPL3


Structure creating script (makeroom_Platanus-allee_2.2.2.sh) moved to /sw/bioinfo/Platanus-allee/makeroom_2.2.2.sh

LOG
---

    /home/matpiq/install-methods/makeroom.sh "-f" "-t" "Platanus-allee" "-v" "2.2.2" "-s" "assembly" "-w" "http://platanus.bio.titech.ac.jp/platanus2" "-d" "Platanus-allee is a de novo haplotype assembler (phasing tool), which assembles each haplotype sequence in a diploid genome" "-l" "GPL3"
    ./makeroom_Platanus-allee_2.2.2.sh
Platanus-allee/2.0.2
========================

<http://platanus.bio.titech.ac.jp/platanus2>

Used under license:


LOG
---

    TOOL=Platanus-allee
    VERSION=2.0.2
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER

    /home/douglas/bin/makeroom.sh

NOTE: I use my own script which is located at /sw/bioinfo/Platanus-allee/makeroom_2.0.2.sh

    ./makeroom_Platanus-allee_2.0.2.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    wget -O Platanus_allee_v${VERSION}_Linux_x86_64.tgz http://platanus.bio.titech.ac.jp/?ddownload=348
    tar xzf Platanus_allee_v${VERSION}_Linux_x86_64.tgz
    cd Platanus_allee_${VERSION}
    module load gcc/4.9.4
    make -j 4
    cp -av platanus_allee $PREFIX/
    cp -av README.md $PREFIX/

Load minimap2 and longranger when this module is loaded.


