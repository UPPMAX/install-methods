QuantumESPRESSO/6.7MaX-Release
========================

<http://www.quantum-espresso.org>

Used under license:
GNU GPLv2


Structure creating script (makeroom_QuantumESPRESSO_6.7MaX-Release.sh) moved to /sw/apps/QuantumESPRESSO/makeroom_6.7MaX-Release.sh

LOG
---

    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -t "QuantumESPRESSO" -v "6.7MaX-Release" -c "apps" -w "http://www.quantum-espresso.org" -l "GNU GPLv2" -d "is an integrated suite of Open-Source computer codes for electronic-structure calculations and materials modeling at the nanoscale. It is based on density-functional theory\, plane waves\, and pseudopotentials." -u "rackham"
    ./makeroom_QuantumESPRESSO_6.7MaX-Release.sh


    cd /sw/apps/QuantumESPRESSO/6.7MaX-Release/src/
    wget https://github.com/QEF/q-e/archive/refs/tags/qe-6.7MaX-Release.tar.gz
    tar -xvzf qe-6.7MaX-Release.tar.gz
    cp -rp q-e-qe-6.7MaX-Release/* ../rackham/.
    cd ../rackham/
    module load intel/20.4 
    module load intelmpi/20.4
    ./configure
# modify CPP and optimization options
    vi make.inc
    make -j8 all

