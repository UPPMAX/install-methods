octopus/17a597d-20220708
========================

<https://github.com/luntergroup/octopus>

Used under license:
MIT license


Structure creating script (makeroom_octopus_17a597d-20220708.sh) moved to /sw/bioinfo/octopus/makeroom_17a597d-20220708.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "octopus" "-v" "17a597d-20220708" "-w" "https://github.com/luntergroup/octopus" "-c" "bioinfo" "-l" "MIT license" "-d" "Mapping-based variant caller that implements several calling models within a unified haplotype-aware framework" "-s" "misc" "-x" "INSTALL"
    ./makeroom_octopus_17a597d-20220708.sh
    cd $SRCDIR

    ml git/2.34.1
    git clone https://github.com/luntergroup/octopus.git
    ml gcc/9.3.0 cmake/3.22.2 bioinfo-tools  htslib/1.14 boost/1.70.0_gcc9.3.0 GMP/6.2.1
    ml python/3.9.5
    #needed for python installation scripts, for instance for downloading forest data
    #also needed for some tool scripts
    PYTHONUSERBASE=$PREFIX pip install --user distro
    # ./scripts/install.py has problems with finding the modules, use cmake instead
     cd octopus/build
    cmake .. && make install
    cd ..
    ./scripts/install.py --forests
    cp -r bin $PREFIX
    cp -r resources/ $PREFIX

